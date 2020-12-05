#define APB_UART_0_BASE_ADDR    0x40000000
#define APB_UART_1_BASE_ADDR    0x40100000
#define APB_SPI_0_BASE_ADDR     0x40200000
#define APB_SPI_1_BASE_ADDR     0x40300000
#define APB_I2C_0_BASE_ADDR     0x40400000
#define APB_I2C_1_BASE_ADDR     0x40500000
#define APB_PWM32_0_BASE_ADDR   0x40600000
#define APB_PWM32_1_BASE_ADDR   0x40700000
#define APB_TIMER32_0_BASE_ADDR 0x40800000
#define APB_TIMER32_1_BASE_ADDR 0x40900000
#define APB_TIMER32_2_BASE_ADDR 0x40a00000
#define APB_TIMER32_3_BASE_ADDR 0x40b00000
#define APB_WDT32_0_BASE_ADDR   0x40c00000
#define APB_WDT32_1_BASE_ADDR   0x40d00000

/* UART Modules */

/* PWM Modules: PWM0 & PWM1 */
#define PWM_CMP1_REG            0x00000004
#define PWM_CMP2_REG            0x00000008
#define PWM_PRE_REG             0x00000010
#define PWM_CTRL_REG            0x00000020

unsigned int volatile *const PWM0_CTRL = (unsigned int *)(APB_PWM32_0_BASE_ADDR + PWM_CTRL_REG);
unsigned int volatile *const PWM0_PRE = (unsigned int *)(APB_PWM32_0_BASE_ADDR + PWM_PRE_REG);
unsigned int volatile *const PWM0_CMP1 = (unsigned int *)(APB_PWM32_0_BASE_ADDR + PWM_CMP1_REG);
unsigned int volatile *const PWM0_CMP2 = (unsigned int *)(APB_PWM32_0_BASE_ADDR + PWM_CMP2_REG);

unsigned int volatile *const PWM1_CTRL = (unsigned int *)(APB_PWM32_1_BASE_ADDR + PWM_CTRL_REG);
unsigned int volatile *const PWM1_PRE = (unsigned int *)(APB_PWM32_1_BASE_ADDR + PWM_PRE_REG);
unsigned int volatile *const PWM1_CMP1 = (unsigned int *)(APB_PWM32_1_BASE_ADDR + PWM_CMP1_REG);
unsigned int volatile *const PWM1_CMP2 = (unsigned int *)(APB_PWM32_1_BASE_ADDR + PWM_CMP2_REG);

/* SPI Master Controllers */
#define SPI_DATA_REG            0x00000000
#define SPI_CTRL_REG            0x00000004
#define SPI_CFG_REG             0x00000008
#define SPI_STATUS_REG          0x00000010

unsigned int volatile *const SPI9_CTRL = (unsigned int *)(APB_SPI_0_BASE_ADDR + SPI_CTRL_REG);
unsigned int volatile *const SPI9_DATA = (unsigned int *)(APB_SPI_0_BASE_ADDR + SPI_DATA_REG);
unsigned int volatile *const SPI9_STATUS = (unsigned int *)(APB_SPI_0_BASE_ADDR + SPI_STATUS_REG);
unsigned int volatile *const SPI9_CFG = (unsigned int *)(APB_SPI_0_BASE_ADDR + SPI_CFG_REG);

unsigned int volatile *const SPI1_CTRL = (unsigned int *)(APB_SPI_1_BASE_ADDR + SPI_CTRL_REG);
unsigned int volatile *const SPI1_DATA = (unsigned int *)(APB_SPI_1_BASE_ADDR + SPI_DATA_REG);
unsigned int volatile *const SPI1_STATUS = (unsigned int *)(APB_SPI_1_BASE_ADDR + SPI_STATUS_REG);
unsigned int volatile *const SPI1_CFG = (unsigned int *)(APB_SPI_1_BASE_ADDR + SPI_CFG_REG);
