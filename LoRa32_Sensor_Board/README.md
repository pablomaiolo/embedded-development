LoRa32 Sensor Board
===================
This is a battery powered board that features a MPL115A1 absolute pressure sensor, a LSM303C inertial measurement unit (IMU) and a SAM-M8Q GPS module. This board also has a battery monitor IC, STC3100, which allows to obtain an estimate of the remaining charge. It is meant to be used with TTGO LoRa32 MCU module. It is powered by a 3.7 V 2200 mAh 18650 battery.

TTGO LoRa32
-----------
LoRa32 is a development board based on the ESP32 chip, which combines a 32-bit microcontroller alongside WiFi and Bluetooth modules. LoRa32 also features a SX1276 LoRa transceiver and an OLED display.

ESP32 has 34 GPIO pins which can be mapped to any peripheral. This particular board uses SPI, I2C and UART to communicate with the sensors. According to LoRa32 schematic, one SPI interface is connected to SX1276 and one I2C is connected to the OLED display. I've decided to use these same interfaces with the sensors. Communication with the GPS module is done through UART. One of the UARTs is connected to a CP2102 USB-to-UART bridge, so in order to be able to simultaneously use this UART and receive data from the GPS, I've decided to use another UART. I chose GPIO21 for UART1 TX signal and GPIO22 for UART1 RX because both of these pins are unused in the LoRa32 board and can be assigned to UART1. GPIO23 is the chip select signal for MPL115A1 and GPIO17 is connected to the shutdown pin.

LSM303C IMU
-----------
LSM303C is an IC featuring a 3D accelerometer and magnetometer. It supports both I2C and SPI. The datasheet explains that in order to use I2C, both chip select lines must be held high (tied to Vdd_IO).

Output pins are connected as follows:

* DRDY_MAG (magnetometer data ready) to GPIO35.
* INT_MAG (magnetometer interrupt signal) to GPIO12.
* INT_XL (accelerometer interrupt signal) to GPIO13.

These three GPIO pins can be set up to trigger an interrupt at positive edge.

MPL115A1 pressure sensor
------------------------
MPL115A1 is an absolute pressure sensor with a SPI interface. It has a shutdown pin that puts the sensor into low power mode. ESP32 GPIO pins default to high impedance before initialization, so both chip select and shutdown pin are pulled up to 3V3 to give them a defined level and avoid triggering a spurious communication sequence.

SAM-M8Q GPS module
------------------
This module features a GPS receiver with an embedded patch antenna. It provides both I2C and UART interfaces, although in this board only UART is used.

STC3100 battery monitor
-----------------------
STC3100 monitors voltage, temperature and current of a single-cell battery. It also has a Coulomb counter which can be used to implement a gas gauge to monitor the available battery capacity. Application is based on the example schematic shown in the datasheet. Sense resistor Rcg is chosen to maximise charge and current resolution. In this application, we have the following maximum current consumption:

* LoRa32: 100 mA
* SAM-M8Q: 67 mA
* LSM303C: 450 uA (worst case when adding magnetometer current plus accelerometer current)
* MPL115A1: 10 uA
* STC3100: 100 uA

For the sake of simplicity we will consider the last three to consume 1 mA each. In this case the maximum total current is 170 mA. Full scale voltage on the internal A/D converter of the STC3100 is +/- 80 mV. Since the board does not have a battery charger, 170 mA is the maximum current that will flow through the sense resistor.

Rcg = 80 mV / 170 mA = 0.47 ohm


But ST's application note [AN3064](https://www.st.com/content/ccc/resource/technical/document/application_note/fa/c2/de/32/e8/c9/4e/28/CD00248578.pdf/files/CD00248578.pdf/jcr:content/translations/en.CD00248578.pdf) also provides an equation relating the charge data in mAh to the sense resistor value:

charge data (mAh) = 6.70 \* charge_code / Rcg (mohm)

charge_code is a 16-bit binary number in two's complement. If we want to be able to measure a full discharge, we should find Rcg for 2200 mAh and a charge code of 2^15-1:

Rcg = 6.70 \* 32767 / 2200 mAh = 0.1 ohm

So, we use a 0.1 ohm resistor for Rcg.

Layout considerations
---------------------
PCB design rules are set according to [PCBWay](https://www.pcbway.com) manufacturing process. Minimum track width and clearance are 6 mils (0.1524 mm). Minimum hole size and width of annular ring are, respectively, 0.3 mm and 0.15 mm, so this yields a minimum via diameter of 0.6 mm.

Components are distributed following common design practices, such as placing decoupling capacitor near supply pins.

STC3100 is as near the battery as possible, but temperature readings probably wouldn't be too accurate since the battery sits on a plastic holder. Following guidelines from STC3100 datasheet, GND pin is routed to the ground side of the sense resistor through a dedicated track, in order to avoid voltage drops that would render the measurement inaccurate. BATT+ and BATT- signals have big copper fills to bring them closer to the pads without voltage drops.

Board size is mainly determined by the battery holder and the LoRa32 module.

Bill of Materials
-----------------

| Reference  | Description                              | Quantity |
|------------|------------------------------------------|----------|
| C1, C3, C4 | 100nF X7R 0805 SMD capacitor             | 3        |
| C2         | 10uF SMD aluminum electrolytic capacitor | 1        |
| C5, C6, C7 | 1uF X7R 0805 SMD capacitor               | 3        |
| C8         | 220nF X7R 0805 SMD capacitor             | 1        |
| J1         | Keystone 1042 battery holder             | 1        |
| R1, R2     | 33k 0805 SMD capacitor                   | 2        |
| R3         | 200k 0.1% 0805 SMD capacitor             | 1        |
| R4         | 1k 0805 SMD capacitor                    | 1        |
| R5         | 0.1 1% 0805 SMD capacitor                | 1        |
| U1         | LSM303CTR                                | 1        |
| U2         | 18 pos female rectangular header         | 2        |
| U3         | MPL115A1                                 | 1        |
| U4         | SAM-M8Q                                  | 1        |
| U5         | STC3100IST                               | 1        |
