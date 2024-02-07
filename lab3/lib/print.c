#include "print.h"
#include "sbi.h"

void puts(char *s) {
  while(*s){
    sbi_console_putchar(*(s++));
  }
}

void puti(int x) {
  char s[20];
  int i = 0;
  if(x < 0){
    sbi_console_putchar('-');
    x = -x;
  }
  do{
    s[i++] = '0' + x%10;
    x /= 10;
  }while(x);
  while(i){
    sbi_console_putchar(s[--i]);
  }
}
