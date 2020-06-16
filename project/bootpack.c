void io_hlt(void);
void io_cli(void);
void io_out8(int port, int data);
int io_load_eflags(void);
void io_store_eflags(int eflags);

void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);

void HariMain(void)
{
	char * p = (char *)0xa0000;
	int i;
	init_palette();
	for(i=0;i <= 0xaffff; i++){
		p[i] = i & 0x0f;
	}

	for (;;) {
		io_hlt();
	}

}



void init_palette(void)
{
	static unsigned char table_rgb[16 * 3] = {
		0x00, 0x00, 0x00,	/*  0:崟 */
		0xff, 0x00, 0x00,	/*  1:柧傞偄愒 */
		0x00, 0xff, 0x00,	/*  2:柧傞偄椢 */
		0xff, 0xff, 0x00,	/*  3:柧傞偄墿怓 */
		0x00, 0x00, 0xff,	/*  4:柧傞偄惵 */
		0xff, 0x00, 0xff,	/*  5:柧傞偄巼 */
		0x00, 0xff, 0xff,	/*  6:柧傞偄悈怓 */
		0xff, 0xff, 0xff,	/*  7:敀 */
		0xc6, 0xc6, 0xc6,	/*  8:柧傞偄奃怓 */
		0x84, 0x00, 0x00,	/*  9:埫偄愒 */
		0x00, 0x84, 0x00,	/* 10:埫偄椢 */
		0x84, 0x84, 0x00,	/* 11:埫偄墿怓 */
		0x00, 0x00, 0x84,	/* 12:埫偄惵 */
		0x84, 0x00, 0x84,	/* 13:埫偄巼 */
		0x00, 0x84, 0x84,	/* 14:埫偄悈怓 */
		0x84, 0x84, 0x84	/* 15:埫偄奃怓 */
	};
	set_palette(0, 15, table_rgb);
	return;

	/* static char 柦椷偼丄僨乕僞偵偟偐巊偊側偄偗偳DB柦椷憡摉 */
}


void set_palette(int start, int end, unsigned char *rgb)
{
	int i, eflags;
	eflags = io_load_eflags();	/* 妱傝崬傒嫋壜僼儔僌偺抣傪婰榐偡傞 */
	io_cli(); 					/* 嫋壜僼儔僌傪0偵偟偰妱傝崬傒嬛巭偵偡傞 */
	io_out8(0x03c8, start);
	for (i = start; i <= end; i++) {
		io_out8(0x03c9, rgb[0] / 4);
		io_out8(0x03c9, rgb[1] / 4);
		io_out8(0x03c9, rgb[2] / 4);
		rgb += 3;
	}
	io_store_eflags(eflags);	/* 妱傝崬傒嫋壜僼儔僌傪尦偵栠偡 */
	return;
}
