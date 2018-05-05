#include "mgos.h"
#include "mgos_i2c.h"
#include "math.h"
#include "mgos_rpc.h"
#include "mgos_wifi.h"
#include "mgos_sys_config.h"
#include "user_interface.h"



struct mgos_i2c *i2c;
uint16_t step = 0; 

/*static void display_cb(void *arg) {
	uint16_t val = 1<<(step%16);
	for (uint8_t i=0; i<3; i++) {
		mgos_i2c_write(i2c, 0x70+i, (char[]){0, val&0xFF, val>>8, val&0xFF, val>>8, val&0xFF, val>>8, val&0xFF, val>>8, val&0xFF, val>>8, val&0xFF, val>>8}, 13, true);
	}
	step++;
	
	(void) arg;
}*/

static void clearDisplay() {	
	for (uint8_t i=0; i<3; i++) {
		mgos_i2c_write(i2c, 0x70+i, "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 17, true);
	}
}

static void initDisplay() {
	i2c = mgos_i2c_get_global();
	
	for (uint8_t i=0; i<3; i++) {
		mgos_i2c_write(i2c, 0x70+i, "\x21", 1, true);
		mgos_i2c_write(i2c, 0x70+i, "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 17, true);
		mgos_i2c_write(i2c, 0x70+i, "\x81", 1, true);
	}
}

static void setScore(struct mg_rpc_request_info *ri, void *cb_arg,
                   struct mg_rpc_frame_info *fi, struct mg_str args) {
	
	clearDisplay();


	long display;
	json_scanf(args.p, args.len, ri->args_fmt, &display);

	uint8_t val = display%18;
	uint8_t screen = val/6;
	uint8_t digit = val%6;

	mgos_i2c_write(i2c, 0x70+screen, (char[]){digit*2, 0xFF, 0xFF}, 3, true);

	mg_rpc_send_responsef(ri, "{display: %d, screen: %d, digit: %d}", display, screen, digit);

	(void) fi;
	(void) args;
	(void) cb_arg;
}

/* Additional heders from <esp8266-sdk>/user_interface.c */
bool wifi_softap_deauth(uint8_t mac[6]);
#include "mg_rpc_channel_tcp_common.h"
/* Additional heders from <mongoose-os>/mg_rpc_channel_http.c */
struct mg_rpc_channel_http_data {
  struct mg_connection *nc;
};

static void disconnectWifi(struct mg_rpc_request_info *ri, void *cb_arg,
                   struct mg_rpc_frame_info *fi, struct mg_str args) {

	struct mg_rpc_channel_http_data *chd = (struct mg_rpc_channel_http_data *) ri->ch->channel_data;
	char *ip_src = mg_rpc_channel_tcp_get_info(chd->nc);
	char ip_dst[16];


	LOG(LL_DEBUG, ("WiFi event: DISCONNECT %s", ip_src));

	struct station_info *station = wifi_softap_get_station_info();
	while(station) {
		sprintf(ip_dst, IPSTR, IP2STR(&station->ip));
		if (strcmp(ip_src, ip_dst)==0) {
			LOG(LL_DEBUG, ("WiFi event: DISCONNECTING %x:%x:%x:%x:%x:%x", station->bssid[0], station->bssid[1], station->bssid[2], station->bssid[3], station->bssid[4], station->bssid[5]));
			wifi_softap_deauth(station->bssid);
			break;
		}
		station = STAILQ_NEXT(station, next);
	}
	wifi_softap_free_station_info();

	mg_rpc_send_responsef(ri, NULL);
	(void) fi;
	(void) args;
	(void) cb_arg;
}

enum mgos_app_init_result mgos_app_init(void) {

	initDisplay();
	
	mg_rpc_add_handler(mgos_rpc_get_global(), "SB.SetScore", "{screen: %ld}", setScore, NULL);
	mg_rpc_add_handler(mgos_rpc_get_global(), "Wifi.Disconnect", "", disconnectWifi, NULL);
	
	return MGOS_APP_INIT_SUCCESS;
}
