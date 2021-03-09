#include "n5_drv.h"
#include "n5_int.h"

void IRQ() {
    gpio_write(0x0099);        
}

#define     DELAY(n)   for(int i=0; i<n; i++)

int main(){
    // Initialization
    gpio_set_dir(0xFFFF);
    
    // Start the test
    uart_puts (0, "Hello World!\n", 13);

    // GPIO
    uart_puts (0, "GPIO Test: ", 11); 
    gpio_write(0xFFFF);
    DELAY(100);
    int gpio_data = gpio_read();
    if(gpio_data == 0xFFFF)
        uart_puts(0,"Passed!\n", 8);
    else
        uart_puts(0,"Failed!\n", 8);
    

    // GPIO Flashing LED
    for (int i=0; i<50; i=i+1) {
        gpio_write(0x0);
        DELAY(1000);
        gpio_write(0xFFFF);
        DELAY(1000);
    }
   
    // Some Delay
    DELAY(400);
   
    // Done!
    uart_puts(0, "Done!\n ", 6);
    DELAY(100);
    return 0;
}