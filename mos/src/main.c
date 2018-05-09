#include "mgos.h"
#include "mgos_rpc.h"
#include "game7_wifi_utils.h"
#include "game7_display_driver.h"

static void setScore(struct mg_rpc_request_info *ri, void *cb_arg,
                   struct mg_rpc_frame_info *fi, struct mg_str args) {


    char *text;
	json_scanf(args.p, args.len, ri->args_fmt, &text);

	game7_display_text(0, 0, text);
	game7_display_text(1, 0, text);

	mg_rpc_send_responsef(ri, NULL);

	(void) text;
	(void) fi;
	(void) args;
	(void) cb_arg;
}

enum mgos_app_init_result mgos_app_init(void) {
	
	wifi_utils_register_disconnect_rpc();

	game7_display_init();
	
	mg_rpc_add_handler(mgos_rpc_get_global(), "SB.SetScore", "{text: %Q}", setScore, NULL);
	
	return MGOS_APP_INIT_SUCCESS;
}
