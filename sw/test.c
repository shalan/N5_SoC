#include "n5_drv.h"
#include "n5_int.h"


unsigned int A[100];

void IRQ() {
    gpio_write(0x0099);        
}

int fact(int n){
    int f = 1;
    for(int i=2; i<=n; i++)
        f = f * i;
    return f;
}

int strlen(char *s){
    int i=0;
    while (*s){
        i++;
    }
    return i;
}

void M23LC_write_byte(int n, unsigned int addr, unsigned int data){
  spi_start(n);
  spi_write(n, 0x2);
  spi_write(n, addr >> 8);     // Address high byte
  spi_write(n, addr & 0xFF);   // Address low byte
  spi_write(n, data);
  spi_end(n);
}

unsigned char M23LC_read_byte(int n, unsigned short addr){
  spi_start(n);
  spi_write(n, 0x3);
  spi_write(n, addr >> 8);     // Address high byte
  spi_write(n, addr & 0xFF);   // Address low byte
  spi_write(n, 0);             // just write a dummy data to get the data out
  spi_end(n);
  return spi_read(n);
}

#define     DELAY(n)   for(int i=0; i<n; i++)

int main(){
    // Initialization
    uart_init (0, 0);
    gpio_set_dir(0x00FF);
    spi_init(0, 0,0,20);
    
    // Start the test
    uart_puts (0, "Hello World!\n", 13);
    
    // I2C testing
    uart_puts (0, "I2C Test: ", 10);
    i2c_init(0, 16000);
    i2c_start(0, 0xA0);    // slave address = 1010_000, R/W_b=0 (write)
    i2c_sendByte(0x0);
    i2c_sendByte(0x0);
    i2c_sendByte(0x55);
    i2c_stop();
    DELAY(20);
    i2c_start(0, 0xA0);    // slave address = 1010_000, R/W_b=0 (write)
    i2c_sendByte(0x0);
    i2c_sendByte(0x0);
    i2c_start(0, 0xA1);    // slave address = 1010_000, R/W_b=1 (read)
    int i2c_data = i2c_readByte();
    gpio_write(i2c_data);
    if(i2c_data == 0x55)
        uart_puts(0,"Passed!\n", 8);
    else
        uart_puts(0,"Failed!\n", 8);
    i2c_stop();

    // GPIO
    uart_puts (0, "GPIO Test: ", 11);
    int gpio_val = 0x55;
    if (SIM_SOC == 0){
        gpio_val = 0x15; // Wrapper has a lower number of GPIOs
    }    
    gpio_write(gpio_val);
    DELAY(100);
    int gpio_data = gpio_read();
    if((gpio_data >> 8) == gpio_val)
        uart_puts(0,"Passed!\n", 8);
    else
        uart_puts(0,"Failed!\n", 8);
    
    // External SPM Accelerator
    uart_puts (0, "SPM Test: ", 10);
    int factorial = fact(5);
    DELAY(100);
    if(factorial==120)
        uart_puts(0,"Passed!\n", 8);
    else 
        uart_puts(0,"Failed!\n", 8);

    // SPI
    uart_puts (0, "SPI Test: ", 10);
    M23LC_write_byte(0, 0, 0xA5);
    unsigned int spi_data = M23LC_read_byte(0, 0);
    DELAY(100);
    if(spi_data==0xA5)
        uart_puts(0,"Passed!\n", 8);
    else 
        uart_puts(0,"Failed!\n", 8);

    // Timer
    uart_puts (0, "TMR Test: ", 10);
    tmr_init(0, 800, 10);
    tmr_enable(0);
    tmr_wait(0);
    tmr_disable(0);
    if(tmr_read(0) == 0)
        uart_puts(0,"Passed!\n", 8);
    else 
        uart_puts(0,"Failed!\n", 8);

    // WDT
    uart_puts (0, "WDT Test: ", 10);
    wdt_init(0);
    wdt_enable(0);
    wdt_load(0, 50);
    while(wdt_read(0) != 0);
    wdt_disable(0);
    if (wdt_read(0) == 0)
        uart_puts(0,"Passed!\n", 8);
    else
        uart_puts(0,"Failed!\n", 8);

    // PWM
    uart_puts (0, "PWM Test: ", 10);
    pwm_init(0, 250, 99, 5);
 	pwm_enable(0);
    DELAY(300);
    pwm_disable(0); 
    uart_puts(0,"Passed!\n", 8);

    // Some Delay
    DELAY(400);
   
    // Done!
    uart_puts(0, "Done!\n ", 6);
    DELAY(100);
    return 0;
}