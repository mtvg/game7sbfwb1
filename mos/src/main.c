#include "mgos.h"
#include "mgos_rpc.h"
#include "game7_wifi_utils.h"
#include "game7_display_driver.h"
#include "mgos_pwm.h"
#include "mgos_gpio.h"


int TONE_POWER[] = {494, 659, 659, 0};
int TONE_DISCONNECTED[] = {330, 330, 294, 294, 262, 262, 0};
int TONE_CONNECTED[] = {262, 262, 294, 294, 330, 330, 0};
int TONE_SIGNAL[] = {330, 330, 0};
int *current_tones = NULL;
int pos = 0;
mgos_timer_id timerid = 0;

// JSON Parser
// https://github.com/cesanta/frozen


static void tone_timer(void *arg) {

	mgos_pwm_set(5, current_tones[pos], 0.001);

	pos++;

	if (current_tones[pos] == 0) { 
		pos = 0;
		mgos_clear_timer(timerid);
		timerid = 0;
		mgos_gpio_set_mode(5, MGOS_GPIO_MODE_INPUT);
	}

	(void) arg;
}

static void play_tone(int *tones) {
	current_tones = tones;

	if (timerid == 0)
		timerid = mgos_set_timer(63, true, tone_timer, NULL);
}

static void rpc_set_text_cb(struct mg_rpc_request_info *ri, void *cb_arg,
                   struct mg_rpc_frame_info *fi, struct mg_str args) {

    char *text;
    int display = 0;
    int offset = 0;
    int blink = 0;
	json_scanf(args.p, args.len, ri->args_fmt, &text, &display, &offset, &blink);

	game7_display_text(display, offset, text);
	if (blink == 1)
		game7_display_blink(display);

	mg_rpc_send_responsef(ri, NULL);

	(void) fi;
	(void) cb_arg;
}

static void rpc_set_clock_cb(struct mg_rpc_request_info *ri, void *cb_arg,
                   struct mg_rpc_frame_info *fi, struct mg_str args) {

    char *text;
    int blink = 0;
	json_scanf(args.p, args.len, ri->args_fmt, &text, &blink);

	game7_display_clock(text);
	if (blink == 1)
		game7_display_blink(2);

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
	
	mg_rpc_add_handler(mgos_rpc_get_global(), "SB.SetText", "{text: %Q, display: %i, offset: %i, blink: %B}", rpc_set_text_cb, NULL);
	mg_rpc_add_handler(mgos_rpc_get_global(), "SB.SetClock", "{text: %Q, blink: %B}", rpc_set_clock_cb, NULL);
	mg_rpc_add_handler(mgos_rpc_get_global(), "SB.Clear", NULL, rpc_clear_cb, NULL);

	play_tone(TONE_POWER);
	
	return MGOS_APP_INIT_SUCCESS;
}
