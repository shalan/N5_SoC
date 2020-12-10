# N5_SoC
[NFive32](https://github.com/shalan/NFive32)-Based SoC to validate several open-source projects and IPs. This includes:
- [NfiVe32](https://github.com/shalan/NFive32) CPU Core
- [ADPoR](https://github.com/shalan/ADPoR): All Digital Power on Reset IP
- [QSPI_XIP_CTRL_DMC](https://github.com/shalan/QSPI_XIP_CTRL_DMC): Quad I/O SPI XIP Flash Controller w/ prefatch cache IP.
- [SoCGen](https://github.com/shalan/https://github.com/habibagamal/SoC_Automation): SoC generator.
- [DFFRAM RegF](https://github.com/shalan/DFFRAM): Hand-crafted Register File optmized for area and power (SKY130A).
- Clock Management IP.

## Architecure
<img src="./docs/soc_arch.png">

## Peripherals
|Peripheral|Bus|Base Address|IRQ #|
|----------|---|------------|--------|
|GPIO (14)|AHB|0x48000000|0-15|
|UART0|APB|0x40000000|16|
|UART1|APB|0x40100000|17|
|SPI0|APB|0x40200000|18|
|SPI1|APB|0x40300000|19|
|I2C0|APB|0x40400000|20|
|I2C1|APB|0x40500000|21|
|PWM0|APB|0x40600000|n/a|
|PWM1|APB|0x40700000|n/a|
|TMR0|APB|0x40800000|22|
|TMR1|APB|0x40900000|23|
|TMR2|APB|0x40A00000|24|
|TMR3|APB|0x40B00000|25|
|WDT0|APB|0x40C00000|26|
|WDT1|APB|0x40D00000|27|



