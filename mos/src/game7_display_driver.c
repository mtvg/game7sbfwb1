#include "game7_display_driver.h"
#include "game7_display_driver_digits.h"
#include "mgos_i2c.h"

struct mgos_i2c *i2c;

uint8_t I2C_ALPHA_ADDR[2] = {0x72, 0x71};

uint16_t *I2C_ALPHA_ALPHAS[2] = {ALPHA0_ALPHAS, ALPHA1_ALPHAS};
uint16_t *I2C_ALPHA_DIGITS[2] = {ALPHA0_DIGITS, ALPHA1_DIGITS};


void game7_display_text(uint8_t display, uint8_t offset, char* text) {
	uint8_t tlen = strlen(text);
	uint8_t dlen = 1+tlen*2;
	uint8_t data[17];

	data[0] = offset;
	for (uint8_t i=0; i<tlen; i++) {
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

void game7_display_clear_all() {	
	for (uint8_t i=0; i<3; i++) {
		mgos_i2c_write(i2c, 0x70+i, "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 17, true);
	}
}

void game7_display_init() {
	i2c = mgos_i2c_get_global();
	
	for (uint8_t i=0; i<3; i++) {
		mgos_i2c_write(i2c, 0x70+i, "\x21", 1, true);
		mgos_i2c_write(i2c, 0x70+i, "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 17, true);
		mgos_i2c_write(i2c, 0x70+i, "\x81", 1, true);
	}
}
