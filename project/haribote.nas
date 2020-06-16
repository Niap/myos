; haribote-os
; TAB=4

		ORG		0xc200			; 偙偺僾儘僌儔儉偑偳偙偵撉傒崬傑傟傞偺偐

		MOV		AL,0x13			; VGA僌儔僼傿僢僋僗丄320x200x8bit僇儔乕
		MOV		AH,0x00
		INT		0x10
fin:
		HLT
		JMP		fin
