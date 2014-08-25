#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <sched.h>
#include <unistd.h>

int yield = 0;

void diep(char *str) {
	perror(str);
	exit(EXIT_FAILURE);
}

void *sporadic_thread(void *data) {
	int z = 0;
	
	while(1) {
		if(!z++)
			printf("[+] loop for %p\n", data);
		
		if(yield)
			sched_yield();
	}
	
	return data;
}

int main(int argc, char *argv[]) {
	pthread_attr_t attr;
	struct sched_param param;
	int i, limit = 1, period = 400;
	
	printf("[+] note: %s [threads = 1 [yield = off [period = 400]]]\n", argv[0]);
	
	if(argc > 3)
		period = atoi(argv[3]);
	
	if(argc > 2)
		yield = 1;
	
	if(argc > 1)
		limit = atoi(argv[1]);
	
	printf("[+] starting with %d threads\n", limit);
	printf("[+] yield %s\n", yield ? "enabled" : "disabled");

	pthread_attr_init(&attr);
	memset(&param, '\0', sizeof(param));

	param.sched_priority        = sched_get_priority_max(SCHED_SPORADIC) / 2;
	param.sched_ss_low_priority = sched_get_priority_min(SCHED_SPORADIC);
	param.sched_ss_max_repl     = 20;
	nsec2timespec(&param.sched_ss_repl_period, period * 1000000); // ms
	nsec2timespec(&param.sched_ss_init_budget, 200 * 1000000); // 200 ms
	
	printf("[+] priority     : %d\n", param.sched_priority);
	printf("[+] low priority : %d\n", param.sched_ss_low_priority);
	printf("[+] replenishment: %d\n", param.sched_ss_max_repl);

	pthread_attr_setschedparam(&attr, &param);		
	pthread_attr_setschedpolicy(&attr, SCHED_SPORADIC);
	pthread_attr_setinheritsched(&attr, PTHREAD_EXPLICIT_SCHED);

	for(i = 0; i < limit; i++) {
		if(pthread_create(NULL, &attr, sporadic_thread, (void *) i))
			diep("[-] pthread_create");
	}
	
	sleep(20);
	
	return 0;
}
