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
#define UART_DATA_REG           0x00000000
#define UART_STATUS_REG         0x00000004
#define UART_CTRL_REG           0x00000004
#define UART_PRESCALER_REG      0x00000008
#define UART_IM_REG             0x0000000C
#define UART_TXFIFOTR_REG       0x00000010
#define UART_RXFIFOTR_REG       0x00000014

unsigned int volatile *const UART0_DATA = (unsigned int *)(APB_UART_0_BASE_ADDR + UART_DATA_REG);
unsigned int volatile *const UART0_STATUS = (unsigned int *)(APB_UART_0_BASE_ADDR + UART_STATUS_REG);
unsigned int volatile *const UART0_CTRL = (unsigned int *)(APB_UART_0_BASE_ADDR + UART_CTRL_REG);
unsigned int volatile *const UART0_PRESCALER = (unsigned int *)(APB_UART_0_BASE_ADDR + UART_PRESCALER_REG);
unsigned int volatile *const UART0_IM = (unsigned int *)(APB_UART_0_BASE_ADDR + UART_IM_REG);
unsigned int volatile *const UART0_TXTH = (unsigned int *)(APB_UART_0_BASE_ADDR + UART_TXFIFOTR_REG);
unsigned int volatile *const UART0_RXTH = (unsigned int *)(APB_UART_0_BASE_ADDR + UART_RXFIFOTR_REG);

unsigned int volatile *const UART1_DATA = (unsigned int *)(APB_UART_1_BASE_ADDR + UART_DATA_REG);
unsigned int volatile *const UART1_STATUS = (unsigned int *)(APB_UART_1_BASE_ADDR + UART_STATUS_REG);
unsigned int volatile *const UART1_CTRL = (unsigned int *)(APB_UART_1_BASE_ADDR + UART_CTRL_REG);
unsigned int volatile *const UART1_PRESCALER = (unsigned int *)(APB_UART_1_BASE_ADDR + UART_PRESCALER_REG);
unsigned int volatile *const UART1_IM = (unsigned int *)(APB_UART_1_BASE_ADDR + UART_IM_REG);
unsigned int volatile *const UART1_TXTH = (unsigned int *)(APB_UART_1_BASE_ADDR + UART_TXFIFOTR_REG);
unsigned int volatile *const UART1_RXTH = (unsigned int *)(APB_UART_1_BASE_ADDR + UART_RXFIFOTR_REG);

/* SPI Master Controllers */
#define SPI_DATA_REG            0x00000000
#define SPI_CTRL_REG            0x00000004
#define SPI_CFG_REG             0x00000008
#define SPI_STATUS_REG          0x00000010

unsigned int volatile *const SPI0_CTRL = (unsigned int *)(APB_SPI_0_BASE_ADDR + SPI_CTRL_REG);
unsigned int volatile *const SPI0_DATA = (unsigned int *)(APB_SPI_0_BASE_ADDR + SPI_DATA_REG);
unsigned int volatile *const SPI0_STATUS = (unsigned int *)(APB_SPI_0_BASE_ADDR + SPI_STATUS_REG);
unsigned int volatile *const SPI0_CFG = (unsigned int *)(APB_SPI_0_BASE_ADDR + SPI_CFG_REG);

unsigned int volatile *const SPI1_CTRL = (unsigned int *)(APB_SPI_1_BASE_ADDR + SPI_CTRL_REG);
unsigned int volatile *const SPI1_DATA = (unsigned int *)(APB_SPI_1_BASE_ADDR + SPI_DATA_REG);
unsigned int volatile *const SPI1_STATUS = (unsigned int *)(APB_SPI_1_BASE_ADDR + SPI_STATUS_REG);
unsigned int volatile *const SPI1_CFG = (unsigned int *)(APB_SPI_1_BASE_ADDR + SPI_CFG_REG);

/* I2C Modules: I2C00 & I2C1 */


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