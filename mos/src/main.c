#include "mgos.h"
#include "mgos_rpc.h"
#include "game7_wifi_utils.h"
#include "game7_display_driver.h"

// JSON Parser
// https://github.com/cesanta/frozen

static void rpc_set_text_cb(struct mg_rpc_request_info *ri, void *cb_arg,
                   struct mg_rpc_frame_info *fi, struct mg_str args) {

    char *text;
    int display = 0;
    int offset = 0;
	json_scanf(args.p, args.len, ri->args_fmt, &text, &display, &offset);

	game7_display_text(display, offset, text);

	mg_rpc_send_responsef(ri, NULL);

	(void) fi;
	(void) cb_arg;
}

static void rpc_set_clock_cb(struct mg_rpc_request_info *ri, void *cb_arg,
                   struct mg_rpc_frame_info *fi, struct mg_str args) {

    char *text;
	json_scanf(args.p, args.len, ri->args_fmt, &text);

	game7_display_clock(text);

	mg_rpc_send_responsef(ri, NULL);

	(void) fi;
	(void) args;
	(void) cb_arg;
}

static void rpc_clear_cb(struct mg_rpc_request_info *ri, void *cb_arg,
                   struct mg_rpc_frame_info *fi, struct mg_str args) {
	
	game7_display_clear_all();

	mg_rpc_send_responsef(ri, NULL);

	(void) fi;
	(void) args;
	(void) cb_arg;
}

enum mgos_app_init_result mgos_app_init(void) {
	
	wifi_utils_register_disconnect_rpc();

	game7_display_init();
	
	mg_rpc_add_handler(mgos_rpc_get_global(), "SB.SetText", "{text: %Q, display: %i, offset: %i}", rpc_set_text_cb, NULL);
	mg_rpc_add_handler(mgos_rpc_get_global(), "SB.SetClock", "{text: %Q}", rpc_set_clock_cb, NULL);
	mg_rpc_add_handler(mgos_rpc_get_global(), "SB.Clear", NULL, rpc_clear_cb, NULL);
	
	return MGOS_APP_INIT_SUCCESS;
}
