void HariMain(void)
{

	int i; /* 曄悢愰尵丅i偲偄偆曄悢偼丄32價僢僩偺惍悢宆 */

	for (i = 0xa0000; i <= 0xaffff; i++) {
		write_mem8(i, 7); /* MOV BYTE [i],15 */
	}

	for (;;) {
		io_hlt();
	}

}
