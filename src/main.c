#include "mgos.h"
#include "mgos_i2c.h"
#include "math.h"

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

static void display_cb(void *arg) {
	for (uint8_t i=0; i<3; i++) {
		mgos_i2c_write(i2c, 0x70+i, "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 17, true);
	}
	uint8_t val = step%18;
	uint8_t screen = val/6;
	uint8_t digit = val%6;

	mgos_i2c_write(i2c, 0x70+screen, (char[]){digit*2, 0xFF, 0xFF}, 3, true);

	step++;
	
	(void) arg;
}

enum mgos_app_init_result mgos_app_init(void) {
	i2c = mgos_i2c_get_global();
	
	for (uint8_t i=0; i<3; i++) {
		mgos_i2c_write(i2c, 0x70+i, "\x21", 1, true);
		mgos_i2c_write(i2c, 0x70+i, "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 17, true);
		mgos_i2c_write(i2c, 0x70+i, "\x81", 1, true);
	}
	
	mgos_set_timer(100, MGOS_TIMER_REPEAT, display_cb, NULL);
	
	return MGOS_APP_INIT_SUCCESS;
}
