#ifndef MAC_RESOLV_H
#define MAC_RESOLV_H
	char *macresolvMD(char *smac, char *sip, char *dip);
	
	#define ETH_ALEN       6
	#define ETH_HLEN       14
	#define ETH_FRAME_LEN  1514
	#define ETH_DATA_LEN   1500
	
	#define IP_ALEN        4
	
	#define INTERFACE      "eth0"
#endif
