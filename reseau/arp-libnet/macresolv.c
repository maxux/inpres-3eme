#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <linux/if_ether.h>
#include <net/if.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <linux/ip.h>
#include <linux/udp.h>
#include <linux/tcp.h>
#include <libnet.h>
#include "macresolv.h"
#include "formater.h"
 
struct packet {
	unsigned short _hardware_type;
	unsigned short _protocol_type;
	unsigned char _hardware_address_length;
	unsigned char _protocol_address_length;
	unsigned short _opcode;
	unsigned char _src_mac[ETH_ALEN];
	unsigned char _src_ip[4];
	unsigned char _dest_mac[ETH_ALEN];
	unsigned char _dest_ip[4];
	char fill[18];
};

char *macresolvMD(char *smac, char *sip, char *dip) {
	int sock;
	char eth_cache[ETH_FRAME_LEN];
	struct ethhdr *p_eth_header;
	char eth_dest[ETH_ALEN]       = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};
	char eth_dest_dummy[ETH_ALEN] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
	
	struct in_addr in, dest;
	struct sockaddr to;
	char buffer[65535], *final_mac = NULL, final_ip[64];

	// ethernet header
	p_eth_header = (struct ethhdr*) eth_cache;
	memcpy(p_eth_header->h_dest, eth_dest, ETH_ALEN);
	p_eth_header->h_proto = htons(0x0806);

	// arp data
	struct packet *p_arp, *arp_rply;
	p_arp = (struct packet *)(eth_cache + ETH_HLEN);
	p_arp->_hardware_type           = htons(0x1);
	p_arp->_protocol_type           = htons (0x800);
	p_arp->_hardware_address_length = ETH_ALEN;
	p_arp->_protocol_address_length = 4;
	p_arp->_opcode                  = htons(0x0001);

	// init socket
	sock = socket(AF_INET, SOCK_PACKET, htons(0x0003));

	in.s_addr = inet_addr(sip);
	memcpy(p_arp->_src_ip,&in.s_addr,4);
	
	dest.s_addr = inet_addr(dip);
	memcpy(p_arp->_dest_ip,&dest.s_addr,4);
	
	
	int hostmac_len;
	uint8_t *hostmac = libnet_hex_aton(smac, &hostmac_len);
	memcpy(p_arp->_src_mac, hostmac, 6);
	memcpy(p_eth_header->h_source, hostmac, 6);
	

	memcpy(p_arp->_dest_mac, eth_dest_dummy, ETH_ALEN);        
	bzero(p_arp->fill, 18);
	
	strcpy(to.sa_data, INTERFACE);

	int n = 0;
	
	n = sendto(sock,&eth_cache,64,0,&to,sizeof(to));
	
	printf("[+] arp request sent (%d bytes)\n", n);
	
	
	arp_rply = (struct packet*)(buffer + 14);
	
	while(recv(sock, buffer, sizeof(buffer), 0)) {
		if((((buffer[12]) << 8) + buffer[13]) != ETH_P_ARP)
			continue;
	
		if(ntohs(arp_rply->_opcode) != 2)
			continue;
		
		// checking remote ip
		format_ipMD(arp_rply->_src_ip, final_ip);
		if(strcmp(final_ip, dip))
			break;
		
		// extracting mac, we got it
		final_mac = (char *) malloc(sizeof(char) * 20);
		format_macMD(arp_rply->_src_mac, final_mac);
		
		break;
	}
	
	close(sock);
	
	return final_mac;
}
/*
int main(void) {
	char *mac;
	
	if(!(mac = macresolv("8c:89:a5:c8:8a:84", "192.168.10.210", "192.168.10.176")))
		return 1;
	
	printf("> %s\n", mac);
		
	return 0;
}*/
