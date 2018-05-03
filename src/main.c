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

static void ev_handler(struct mg_connection *c, int ev, void *ev_data,
                       void *user_data) {
  struct mg_dns_message *msg = (struct mg_dns_message *) ev_data;
  struct mbuf reply_buf;
  int i;

  if (ev != MG_DNS_MESSAGE) return;

  mbuf_init(&reply_buf, 512);
  struct mg_dns_reply reply = mg_dns_create_reply(&reply_buf, msg);
  for (i = 0; i < msg->num_questions; i++) {
    char rname[256];
    struct mg_dns_resource_record *rr = &msg->questions[i];
    mg_dns_uncompress_name(msg, &rr->name, rname, sizeof(rname) - 1);
    fprintf(stdout, "Q type %d name %s\n", rr->rtype, rname);
    if (rr->rtype == MG_DNS_A_RECORD) {
      uint32_t ip = inet_addr("192.168.4.1");
      mg_dns_reply_record(&reply, rr, NULL, rr->rtype, 10, &ip, 4);
    }
  }
  mg_dns_send_reply(c, &reply);
  mbuf_free(&reply_buf);
  (void) user_data;
}

enum mgos_app_init_result mgos_app_init(void) {
	i2c = mgos_i2c_get_global();
	
	for (uint8_t i=0; i<3; i++) {
		mgos_i2c_write(i2c, 0x70+i, "\x21", 1, true);
		mgos_i2c_write(i2c, 0x70+i, "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", 17, true);
		mgos_i2c_write(i2c, 0x70+i, "\x81", 1, true);
	}
	
	mgos_set_timer(100, MGOS_TIMER_REPEAT, display_cb, NULL);

  struct mg_connection *c = mg_bind(mgos_get_mgr(), "udp://:53", ev_handler, 0);
  mg_set_protocol_dns(c);
	
	return MGOS_APP_INIT_SUCCESS;
}
