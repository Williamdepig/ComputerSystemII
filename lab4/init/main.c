#include "printk.h"

extern void test();

int start_kernel() {
    printk("%d ZJU Computer System II\n", 2022);

    test(); // DO NOT DELETE !!!
	return 0;
}
