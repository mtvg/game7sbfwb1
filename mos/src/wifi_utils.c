#include "wifi_utils.h"
#include "mgos.h"
#include "mgos_rpc.h"
#include "user_interface.h"
#include "mgos_wifi.h"

/* Additional heders from <esp8266-sdk>/user_interface.c */
bool wifi_softap_deauth(uint8_t mac[6]);
#include "mg_rpc_channel_tcp_common.h"
/* Additional heders from <mongoose-os>/mg_rpc_channel_http.c */
struct mg_rpc_channel_http_data {
  struct mg_connection *nc;
};


static void wifi_utils_disconnect_wifi_cb(struct mg_rpc_request_info *ri, void *cb_arg,
                   struct mg_rpc_frame_info *fi, struct mg_str args) {

	if (strcmp(ri->ch->get_type(ri->ch), "HTTP")==0) {
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
		mg_rpc_send_responsef(ri, "{status: \"%s\"}", "Disconnecting");
	} else {
		mg_rpc_send_responsef(ri, "{error: \"%s\"}", "Can disconnect only from RPC over HTTP");
	}
	
	(void) fi;
	(void) args;
	(void) cb_arg;
}

void wifi_utils_register_disconnect_rpc() {
	mg_rpc_add_handler(mgos_rpc_get_global(), "Wifi.Disconnect", "{}", wifi_utils_disconnect_wifi_cb, NULL);
}