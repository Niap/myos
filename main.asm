
main.out:     file format pei-i386


Disassembly of section .text:

00007c00 <osmain>:
void osmain(void){
    7c00:	55                   	push   %ebp
    7c01:	89 e5                	mov    %esp,%ebp
    7c03:	eb fe                	jmp    7c03 <osmain+0x3>

00007c05 <__CTOR_LIST__>:
    7c05:	ff                   	(bad)  
    7c06:	ff                   	(bad)  
    7c07:	ff                   	(bad)  
    7c08:	ff 00                	incl   (%eax)
    7c0a:	00 00                	add    %al,(%eax)
	...

00007c0d <__DTOR_LIST__>:
    7c0d:	ff                   	(bad)  
    7c0e:	ff                   	(bad)  
    7c0f:	ff                   	(bad)  
    7c10:	ff 00                	incl   (%eax)
    7c12:	00 00                	add    %al,(%eax)
	...
