#include "game7_display_driver.h"
#include "game7_display_driver_digits.h"
#include "mgos_i2c.h"
#include <math.h>

struct mgos_i2c *i2c;

void game7_display_text(uint8_t display, uint8_t offset, char* text) {

	if (display > 1) return;

	uint8_t tlen = strlen(text);
	uint8_t data[17];
	uint8_t dlen = fmin(1+tlen*2, sizeof data - offset*2);

	data[0] = offset*2;

	for (uint8_t i=0; i<tlen&&i<6-offset; i++) {
		uint16_t val = 0;
		if (text[i] >= 48 && text[i] <= 57) {
			val = I2C_ALPHA_DIGITS[display][text[i]-48];
		} else if (text[i] >= 65 && text[i] <= 90) {
			val = I2C_ALPHA_ALPHAS[display][text[i]-65];
		}
		data[1+i*2] = val & 0xFF;
		data[2+i*2] = val >> 8;
	}

	mgos_i2c_write(i2c, I2C_ALPHA_ADDR[display], data, dlen, true);
}

void game7_display_clock(char* text) {
	uint8_t tlen = strlen(text);
	uint8_t data[11] = {0};
	for (uint8_t i=0; i<5&&i<tlen; i++) {
		uint8_t val = 0;
		if (text[i] >= 48 && text[i] <= 57) {
			val = CLOCK_DIGITS[text[i]-48];
		}
		if (i == 1) {
			val |= CLOCK_DOT;
		}
		data[1+i*2] = val;
	}

	mgos_i2c_write(i2c, I2C_CLOCK_ADDR, data, sizeof data, true);
}

void game7_display_clear_all() {
	uint8_t data[17] = {0};
	for (uint8_t i=0; i<3; i++) {
		mgos_i2c_write(i2c, 0x70+i, data, sizeof data, true);
	}
}

void game7_display_init() {
	i2c = mgos_i2c_get_global();
	
	uint8_t data[17] = {0};
	for (uint8_t i=0; i<3; i++) {
		mgos_i2c_write(i2c, 0x70+i, "\x21", 1, true);
		mgos_i2c_write(i2c, 0x70+i, data, sizeof data, true);
		mgos_i2c_write(i2c, 0x70+i, "\x81", 1, true);
	}
}
