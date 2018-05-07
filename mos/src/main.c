#include "mgos.h"
#include "mgos_i2c.h"
#include "mgos_rpc.h"
#include "wifi_utils.h"
#include "display_digits.h"

struct mgos_i2c *i2c;
uint16_t step = 0; 

static void nextd(struct mg_rpc_request_info *ri, void *cb_arg,
                   struct mg_rpc_frame_info *fi, struct mg_str args) {
	uint8_t val = step%26;

	// mgos_i2c_write(i2c, 0x70, (char[]){0, CLOCK_DIGITS[val], 0}, 3, true);
	// mgos_i2c_write(i2c, 0x72, (char[]){0, TEAM_A_DIGITS[val]&0xFF, TEAM_A_DIGITS[val]>>8}, 3, true);
	// mgos_i2c_write(i2c, 0x71, (char[]){0, TEAM_B_DIGITS[val]&0xFF, TEAM_B_DIGITS[val]>>8}, 3, true);


	mgos_i2c_write(i2c, 0x72, (char[]){0, TEAM_A_ALPHAS[val]&0xFF, TEAM_A_ALPHAS[val]>>8}, 3, true);
	mgos_i2c_write(i2c, 0x71, (char[]){0, TEAM_B_ALPHAS[val]&0xFF, TEAM_B_ALPHAS[val]>>8}, 3, true);

	step++;

	mg_rpc_send_responsef(ri, NULL);
	
	(void) fi;
	(void) args;
	(void) cb_arg;
	(void) ri;
}

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

enum mgos_app_init_result mgos_app_init(void) {
	
	wifi_utils_register_disconnect_rpc();

	initDisplay();
	
	mg_rpc_add_handler(mgos_rpc_get_global(), "SB.SetScore", "{screen: %ld}", setScore, NULL);
	mg_rpc_add_handler(mgos_rpc_get_global(), "SB.Next", "", nextd, NULL);
	
	return MGOS_APP_INIT_SUCCESS;
}
