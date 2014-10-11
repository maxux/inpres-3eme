#ifndef PETRAD_H
	#define PETRAD_H
	
	typedef struct sensor_t {
		unsigned int L1 :1;
		unsigned int L2 :1;
		unsigned int T  :1;
		unsigned int S  :1;
		unsigned int CS :1;
		unsigned int AP :1;
		unsigned int PP :1;
		unsigned int DE :1;
		
	} __attribute__ ((packed)) sensor_t;
	
	typedef struct actuator_t {
		unsigned CP :2;
		unsigned C1 :1;
		unsigned C2 :1;
		unsigned PV :1;
		unsigned PA :1;
		unsigned AA :1;
		unsigned GA :1;
		
	} __attribute__ ((packed)) actuator_t;

	#ifdef __linux__
		#define SENSORS_FILENAME    "/tmp/petra0"
		#define ACTUATORS_FILENAME  "/tmp/petra1"
	#else
		#define SENSORS_FILENAME    "/dev/capteursPETRA"
		#define ACTUATORS_FILENAME  "/dev/actuateursPETRA"
	#endif
	
	#define SOCKET_PORT         8788
	#define SOCKET_LISTEN       "0.0.0.0"
	
	typedef struct thread_data_t {
		pthread_t tsensors;     // sensors thread handler
		pthread_t tactuators;   // actuators thread handler
		
		sensor_t sensors;       // sensors data
		actuator_t actuators;   // actuators data
		
		int sockfd;             // remote socket fd
		
	} thread_data_t;
#endif
