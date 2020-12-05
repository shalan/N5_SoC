#define GPIO_BASE_ADDR      0x48000000

void gpio_set_dir(unsigned int d) { 
    *((unsigned int *)(GPIO_BASE_ADDR+0x10)) = d; 
}

void gpio_write(unsigned int d) { 
    *((unsigned int *)(GPIO_BASE_ADDR+0x04)) = d; 
}

unsigned int gpio_read() {  
    return *((unsigned int *)(GPIO_BASE_ADDR+0x04));
}

int main(){
    gpio_set_dir(0xFFFF);
    gpio_write(0x0550);

    return 0;
}