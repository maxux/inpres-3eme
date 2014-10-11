#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <netdb.h>
#include <ctype.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include "petrad.h"

void diep(char *str) {
	perror(str);
	exit(EXIT_FAILURE);
}

//
// cancel threads and joins it
//
void *cleaning(thread_data_t *data) {
	// stopping threads
	printf("[-] cleaning environement\n");
	
	// reset sockfd status
	data->sockfd = -1;
	
	// stopping sensors
	if(pthread_cancel(data->tsensors))	
		diep("[-] thread_cancel");
	
	pthread_join(data->tsensors, NULL);
	
	// stopping actuators
	if(pthread_cancel(data->tactuators))
		diep("[-] thread_cancel");
	
	pthread_join(data->tactuators, NULL);
	
	return NULL;
}

void dump_sensors(sensor_t *sensors) {
	printf("[+] sensors: [");
	printf("L1: %d, ", sensors->L1);
	printf("L2: %d, ", sensors->L2);
	printf("T: %d, ", sensors->T);
	printf("S: %d, ", sensors->S);
	printf("CS: %d, ", sensors->CS);
	printf("AP: %d, ", sensors->AP);
	printf("PP: %d, ", sensors->PP);
	printf("DE: %d]\n", sensors->DE);
}

void dump_actuators(actuator_t *actuators) {
	printf("[+] actuators: [");
	printf("CP: %d, ", actuators->CP);
	printf("C1: %d, ", actuators->C1);
	printf("C2: %d, ", actuators->C2);
	printf("PV: %d, ", actuators->PV);
	printf("PA: %d, ", actuators->PA);
	printf("AA: %d, ", actuators->AA);
	printf("GA: %d]\n", actuators->GA);
}

void send_sensors(thread_data_t *data) {
	char buffer[1024];
	int offset;
	
	//
	// building JSON pseudo-array
	// this is not beautiful but faster than create a true JSON object
	//
	offset = snprintf(buffer, sizeof(buffer),
	         "[[%d,%d,%d,%d,%d,%d,%d,%d],",
	         data->sensors.L1,
	         data->sensors.L2,
	         data->sensors.T,
	         data->sensors.S,
	         data->sensors.CS,
	         data->sensors.AP,
	         data->sensors.PP,
	         data->sensors.DE
	);
	
	snprintf(buffer + offset, sizeof(buffer) - offset,
	         "[%d,%d,%d,%d,%d,%d,%d]]\n",
	         data->actuators.CP,
	         data->actuators.C1,
	         data->actuators.C2,
	         data->actuators.PV,
	         data->actuators.PA,
	         data->actuators.AA,
	         data->actuators.GA
	);
	
	if(send(data->sockfd, buffer, strlen(buffer), 0) < 0)
		perror("[-] sensors: send");
}

//
// sensors management, periodic read sensors status and
// trigger event if something changed
//
void *thread_sensors(void *_data) {
	thread_data_t *data = (thread_data_t *) _data;
	sensor_t previous;
	int fd;
	
	if((fd = open(SENSORS_FILENAME, O_RDONLY)) < 0)
		diep("[-] sensors: open: " SENSORS_FILENAME);
	
	//
	// initializing sensors variable
	//
	bzero(&data->sensors, sizeof(sensor_t));
	bzero(&previous, sizeof(sensor_t));
	
	//
	// initial read and send
	//
	if(read(fd, &data->sensors, sizeof(sensor_t)) != sizeof(sensor_t))
		perror("[-] sensors: read");
	
	send_sensors(data);
	previous = data->sensors;
	
	//
	// pooling for update
	//
	while(1) {
		lseek(fd, 0, SEEK_SET);
		
		if(read(fd, &data->sensors, sizeof(sensor_t)) != sizeof(sensor_t))
			perror("[-] sensors: read");
		
		//
		// sensors changed from last time
		//
		if(memcmp(&data->sensors, &previous, sizeof(sensor_t))) {
			printf("[+] sensors: update detected\n");
			dump_sensors(&data->sensors);
			send_sensors(data);
		}
		
		previous = data->sensors;
		usleep(100000);
	}
	
	close(fd);
	
	return data;
}

int parse(char *buffer, thread_data_t *data, int fd) {
	char *match, key[32];
	int value;
	
	if(!strncmp(buffer, "SET ", 4)) {
		// skipping function
		buffer += 4;
		
		// grabbing value
		if(!(match = strchr(buffer, ' ')))
			return fprintf(stderr, "[-] actuators: missing value key\n");
		
		// checking for out of key size
		if(match - buffer > (signed) sizeof(key))
			return fprintf(stderr, "[-] actuators: key overflow\n");
		
		strncpy(key, buffer, match - buffer);
		key[match - buffer] = '\0';
		
		// check if the value is a number
		if(!isdigit(*(++match)))
			return fprintf(stderr, "[-] actuators: invalid key value\n");
		
		// extract value and check if not greater than a 8-bit value
		if((value = atoi(match)) > 255)
			return fprintf(stderr, "[-] actuators: value out of range\n");
		
	} else return printf("[-] actuators: unknown request\n");
	
	printf("[+] set <%s> to <%d>\n", key, value);
	
	//
	// reading current actuators state
	//
	lseek(fd, SEEK_SET, 0);
	if(read(fd, &data->actuators, sizeof(actuator_t)) != sizeof(actuator_t))
		perror("[-] actuators: read");
	
	dump_actuators(&data->actuators);
	
	//
	// hard-coded inline check
	//	
	if(!strcmp(key, "CP"))
		data->actuators.CP = value;
		
	if(!strcmp(key, "C1"))
		data->actuators.C1 = value;
		
	if(!strcmp(key, "C2"))
		data->actuators.C2 = value;
		
	if(!strcmp(key, "PV"))
		data->actuators.PV = value;
		
	if(!strcmp(key, "PA"))
		data->actuators.PA = value;
		
	if(!strcmp(key, "AA"))
		data->actuators.AA = value;
		
	if(!strcmp(key, "GA"))
		data->actuators.GA = value;
	
	dump_actuators(&data->actuators);
	
	//
	// rollback to the beginin and writing new values
	//
	lseek(fd, SEEK_SET, 0);
	if(write(fd, &data->actuators, sizeof(actuator_t)) != sizeof(actuator_t))
		perror("[-] actuators: write");
		
	return 0;
}

//
// wait for a network input request
// change the actuators when requests is valid
//
void *thread_actuators(void *_data) {
	thread_data_t *data = (thread_data_t *) _data;
	actuator_t previous;
	char buffer[1024];
	ssize_t length;
	int fd;
	
	//
	// opening actuators, this lock the device
	//
	if((fd = open(ACTUATORS_FILENAME, O_RDWR)) < 0)
		diep("[-] actuators: open: " ACTUATORS_FILENAME);
	
	//
	// initializing actuators variable
	//
	bzero(&data->actuators, sizeof(actuator_t));
	bzero(&previous, sizeof(actuator_t));
	
	//
	// initial real read
	//
	if(read(fd, &data->actuators, sizeof(actuator_t)) != sizeof(actuator_t))
		perror("[-] actuators: read");
	
	// printf("%u\n", sizeof(actuator_t));
	
	//
	// sending actuators, a first time
	//
	dump_actuators(&data->actuators);
	send_sensors(data);
	
	while(1) {
		if((length = recv(data->sockfd, buffer, sizeof(buffer), 0)) < 0)
			diep("[-] actuators: recv");
		
		//
		// got a clean shutdown, cleaning all threads
		//
		if(!length)
			return cleaning(data);
		
		buffer[length] = '\0';
		
		//
		// checking request
		//
		printf("[+] actuators: request: %s\n", buffer);
		parse(buffer, data, fd);
		
		//
		// actuators changed from last time
		//
		if(memcmp(&data->actuators, &previous, sizeof(actuator_t))) {
			printf("[+] actuators: update detected\n");
			dump_actuators(&data->actuators);
			send_sensors(data);
		}
		
		previous = data->actuators;
	}
	
	close(fd);
	
	return data;
}

int main(void) {
	struct sockaddr_in addr_listen, addr_client;
	socklen_t addr_client_len;
	int sockfd, newfd, yes = 1;
	thread_data_t data = {
		.sockfd = -1
	};
	
	//
	// initialize socket
	//
	addr_listen.sin_family      = AF_INET;
	addr_listen.sin_port        = htons(SOCKET_PORT);
	addr_listen.sin_addr.s_addr = inet_addr(SOCKET_LISTEN);
	
	addr_client_len = sizeof(addr_client);
	
	if((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
		diep("[-] core: socket");

	if(setsockopt(sockfd, SOL_SOCKET, SO_REUSEADDR, &yes, sizeof(int)) == -1)
		diep("[-] core: setsockopt");

	if(bind(sockfd, (struct sockaddr*) &addr_listen, sizeof(addr_listen)) == -1)
		diep("[-] core: bind");

	if(listen(sockfd, 128) == -1)
		diep("[-] core: listen");
	
	printf("[+] core: ready\n");
	
	//
	// waiting a dispatcher-server node
	// starting threads when dispatcher ready
	// stopping threads when dispatcher goes down
	//
	while(1) {
		if((newfd = accept(sockfd, (struct sockaddr *) &addr_client, &addr_client_len)) == -1)
			perror("[-] core: accept");

		printf("[+] core: incomming connection from %s\n", inet_ntoa(addr_client.sin_addr));
		
		//
		// authorizing client if there is no body attached
		//
		if(data.sockfd > 0) {
			printf("[-] connection request, but a client is already connected\n");
			shutdown(newfd, SHUT_RDWR);
			continue;
		}
			
		data.sockfd = newfd;
		
		//
		// sensors thread
		//
		printf("[+] core: initializing sensors thread\n");
		if(pthread_create(&data.tsensors, NULL, thread_sensors, (void *) &data))
			diep("[-] pthread_create");
		
		if(pthread_detach(data.tsensors))
			diep("[-] pthread_detach");
		
		//
		// actuators thread
		//
		printf("[+] core: initializing actuators thread\n");
		if(pthread_create(&data.tactuators, NULL, thread_actuators, (void *) &data))
			diep("[-] pthread_create");
		
		if(pthread_detach(data.tactuators))
			diep("[-] pthread_detach");
	}
	
	return 0;
}
