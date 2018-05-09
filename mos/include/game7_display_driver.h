#ifndef G7_DISPLAY_DRIVER_H_
#define G7_DISPLAY_DRIVER_H_

#include <stdint.h>

void game7_display_clear_all();
void game7_display_init();
void game7_display_text(uint8_t display, uint8_t offset, char* text);
void game7_display_clock(char* text);

#endif /* G7_DISPLAY_DRIVER_H_ */