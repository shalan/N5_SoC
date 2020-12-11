#include "n5_drv.h"
#include "n5_int.h"

unsigned int A[100];

void IRQ() {
    gpio_write(0x0099);        
}

int main(){
    gpio_set_dir(0x00FF);
    gpio_write(0x0055);

    uart_init (0, 0);
    uart_puts (0, "Hello World!\n", 13);

    gpio_write(0x00AA);

    for(int i=0; i<50; i++);

    gpio_write(0x00AA);

    int x = 5;
    asm volatile ("csrrw   zero, mie, %0" :: "r" (x));
    
    x = 0x100;
    asm volatile ("csrrw   zero, 0x310, %0" :: "r" (x));

    gpio_im(0x0100);

    for(int i=0; i<50; i++);

    return 0;
}

