void HariMain(void)
{

	int i; /* 曄悢愰尵丅i偲偄偆曄悢偼丄32價僢僩偺惍悢宆 */

	for (i = 0xa0000; i <= 0xaffff; i++) {
		write_mem8(i, i & 0x0f);
	}

	for (;;) {
		io_hlt();
	}

}
