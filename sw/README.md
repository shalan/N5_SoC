## I/O Map (WIP)
### GPIO Port (Base: 0x48000000)
|Register|Offset|Description|
|----------|---|------------|
| Data In | 0x00 | 14 pins only|
| Data Out| 0x04| 14 pins only|
| Pull Up Enable|0x08| Currently not used|
| Pull Down Enable|0x0C| Currently not used|
| Direction|0x10| 1: Input, 0: Output|
| Interrupt Mask| 0x14||
||||

### UART Modules (UART0 Base: 0x40100000, UART1 Base: 0x40200000)

|Register|Offset|Description|
|----------|---|------------|
| TX/RX Data | 0x00 | Read/Write from/to RX/TX FIFOs |
| STATUS |0x04| Status Register (RO)|
| CONTROL| 0x04| Control Register (W)|
| PRESCALER|0x08| Prescaler for the baud rate generator|
| IM| 0x0C|Interrupts Mask Register|
| TX FIFO Threshold|0x10||
| RX FIFO Threshold|0x14||
||||


- ```Baudrate = Clock Frequency/((PRESCALER+1)*16)```

### SPI Modules (SPI0 Base: 0x40200000, SPI1 Base: 0x40300000 )

|Register|Offset|Description|
|----------|---|------------|
| Data |0x00| Data Register|
| Control |0x04| Control Register<br>Bit 0: Go - Start the transaction<br> Bit 1: Slave Select|
| Configuration |0x08|Configuration Register<br>Bit 0: Clock Polarization (CPOL)<br>Bit 1: Clock Phase (CPHA)<br>Bits 2-9: SPI Clock Divider |
| Status |0x10| SPI Status Register<br>Bit 0: Done - Transaction is over|
| Interrupt Mask|0x14| Interrupt Mask register|
||||

### I2C Modules (I2C0 Base: 0x40400000, I2C1 Base: 0x40500000)

|Register|Offset|Description|
|----------|---|------------|
|Prescaler Lo Register (8-bit)| 0x00||
|Prescaler Hi Register (8-bit)| 0x04||
|Control Register|0x08||
|Data (TX)) Register|0x0C||
|Data *RX) Register|0x10||
|Command Register|0x14||
|Status Register|0x18||
|Interrupt Mask Register|0x1C||
||||

### Pulse Width Modulors (PWM0 Base: 0x40600000, PWM1 Base: 0x40700000)

|Register|Offset|Description|
|----------|---|------------|
| CMP1 | 0x04| Compare 1 Register (period)|
| CMP2 | 0x08 | Compare 2 Register (level change) |
| PRESCALER| 0x10| Prescaler Register|
| CTRL| 0x20| Control Register, 0: Enable PWM| 
||||

- ``tmr_clk = clk / (PRESCALER+1)``
- ``PWM Period = (CMP1 + 1)/tmr_clk``
- ``PWM Duty Cyle = 1 - (CMP1 + 1)/(CMP2 + 1)``

### 32-bit Timer Modules (Base: 0x40800000, 0x40900000, 0x40A00000, 0x40B00000)

|Register|Offset|Description|
|----------|---|------------|
| TIMER | 0x00| Current Count |
| Prescaler | 0x04| |
| Compare | 0x08| Compare Register|
| Status|0x0C| Status Register|
| Overflow Clear |0x10||
| IM |0x100| Interrupt Mask Register|
||||

### 32-bit Watch Dog Timer Modules (Base: 0x40C00000, 0x40D00000)
|Register|Offset|Description|
|----------|---|------------|
||||
