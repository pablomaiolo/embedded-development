EESchema Schematic File Version 4
LIBS:LoRa32_Sensor_Board-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5CA22056
P 3450 1550
F 0 "J1" H 3370 1767 50  0000 C CNN
F 1 "Battery holder" H 3370 1676 50  0000 C CNN
F 2 "Battery:BatteryHolder_Keystone_1042_1x18650" H 3450 1550 50  0001 C CNN
F 3 "~" H 3450 1550 50  0001 C CNN
	1    3450 1550
	-1   0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR02
U 1 1 5CA22199
P 3950 1550
F 0 "#PWR02" H 3950 1400 50  0001 C CNN
F 1 "+BATT" H 3965 1723 50  0000 C CNN
F 2 "" H 3950 1550 50  0001 C CNN
F 3 "" H 3950 1550 50  0001 C CNN
	1    3950 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1550 3950 1550
Wire Wire Line
	3650 1650 3950 1650
$Comp
L power:GND #PWR09
U 1 1 5CA222A8
P 5200 4700
F 0 "#PWR09" H 5200 4450 50  0001 C CNN
F 1 "GND" H 5205 4527 50  0000 C CNN
F 2 "" H 5200 4700 50  0001 C CNN
F 3 "" H 5200 4700 50  0001 C CNN
	1    5200 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR08
U 1 1 5CA22315
P 5200 2450
F 0 "#PWR08" H 5200 2300 50  0001 C CNN
F 1 "+BATT" H 5215 2623 50  0000 C CNN
F 2 "" H 5200 2450 50  0001 C CNN
F 3 "" H 5200 2450 50  0001 C CNN
	1    5200 2450
	1    0    0    -1  
$EndComp
NoConn ~ 4600 2850
NoConn ~ 4600 2950
NoConn ~ 4600 3050
NoConn ~ 4600 3150
NoConn ~ 4600 3250
NoConn ~ 4600 3350
NoConn ~ 4600 3450
NoConn ~ 4600 3550
NoConn ~ 4600 3650
NoConn ~ 4600 3750
NoConn ~ 4600 3850
NoConn ~ 4600 3950
NoConn ~ 5750 4250
NoConn ~ 5750 3950
NoConn ~ 5750 3250
$Comp
L Sensor_Pressure:MPL115A1 U3
U 1 1 5CA23078
P 7000 3550
F 0 "U3" H 7200 4000 50  0000 L CNN
F 1 "MPL115A1" H 7050 3100 50  0000 L CNN
F 2 "Package_LGA:LGA-8_3x5mm_P1.25mm" H 7150 2850 50  0001 C CNN
F 3 "http://www.nxp.com/assets/documents/data/en/data-sheets/MPL115A1.pdf" H 7000 3550 50  0001 C CNN
	1    7000 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3350 6500 3350
Wire Wire Line
	5750 3450 6500 3450
Wire Wire Line
	5750 3550 6500 3550
Wire Wire Line
	5750 3650 6500 3650
$Comp
L power:GND #PWR018
U 1 1 5CA23FA8
P 7750 4000
F 0 "#PWR018" H 7750 3750 50  0001 C CNN
F 1 "GND" H 7755 3827 50  0000 C CNN
F 2 "" H 7750 4000 50  0001 C CNN
F 3 "" H 7750 4000 50  0001 C CNN
	1    7750 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3550 7750 3550
Wire Wire Line
	7750 3900 7750 4000
$Comp
L power:GND #PWR016
U 1 1 5CA241D1
P 7000 4150
F 0 "#PWR016" H 7000 3900 50  0001 C CNN
F 1 "GND" H 7005 3977 50  0000 C CNN
F 2 "" H 7000 4150 50  0001 C CNN
F 3 "" H 7000 4150 50  0001 C CNN
	1    7000 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR013
U 1 1 5CA24242
P 6100 2600
F 0 "#PWR013" H 6100 2450 50  0001 C CNN
F 1 "+3V3" H 6115 2773 50  0000 C CNN
F 2 "" H 6100 2600 50  0001 C CNN
F 3 "" H 6100 2600 50  0001 C CNN
	1    6100 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2850 6100 2850
$Comp
L power:+3V3 #PWR015
U 1 1 5CA2455C
P 7000 2800
F 0 "#PWR015" H 7000 2650 50  0001 C CNN
F 1 "+3V3" H 7015 2973 50  0000 C CNN
F 2 "" H 7000 2800 50  0001 C CNN
F 3 "" H 7000 2800 50  0001 C CNN
	1    7000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2950 7000 2900
Wire Wire Line
	7000 2900 7150 2900
Connection ~ 7000 2900
Wire Wire Line
	7000 2900 7000 2800
$Comp
L power:GND #PWR017
U 1 1 5CA249A8
P 7750 3050
F 0 "#PWR017" H 7750 2800 50  0001 C CNN
F 1 "GND" H 7755 2877 50  0000 C CNN
F 2 "" H 7750 3050 50  0001 C CNN
F 3 "" H 7750 3050 50  0001 C CNN
	1    7750 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 2900 7750 3050
NoConn ~ 5750 3750
$Comp
L power:+3V3 #PWR014
U 1 1 5CA25251
P 6500 4550
F 0 "#PWR014" H 6500 4400 50  0001 C CNN
F 1 "+3V3" H 6515 4723 50  0000 C CNN
F 2 "" H 6500 4550 50  0001 C CNN
F 3 "" H 6500 4550 50  0001 C CNN
	1    6500 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 4550 6500 4500
Connection ~ 6500 3650
Wire Wire Line
	6500 3650 6500 4100
Wire Wire Line
	5900 3750 5900 4150
Wire Wire Line
	5900 4150 5750 4150
Wire Wire Line
	5900 3750 6150 3750
Text Label 5900 3650 0    50   ~ 0
MPL115A1_CS
Wire Wire Line
	6150 4500 6500 4500
Connection ~ 6500 4500
Wire Wire Line
	6150 4100 6150 3750
Connection ~ 6150 3750
Wire Wire Line
	6150 3750 6500 3750
$Comp
L power:+3V3 #PWR04
U 1 1 5CA26BDB
P 4400 5100
F 0 "#PWR04" H 4400 4950 50  0001 C CNN
F 1 "+3V3" H 4415 5273 50  0000 C CNN
F 2 "" H 4400 5100 50  0001 C CNN
F 3 "" H 4400 5100 50  0001 C CNN
	1    4400 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5400 4350 5150
Wire Wire Line
	4350 5150 4400 5150
Wire Wire Line
	4400 5150 4400 5100
Wire Wire Line
	4450 5400 4450 5150
Wire Wire Line
	4450 5150 4400 5150
Connection ~ 4400 5150
$Comp
L Device:CP1_Small C2
U 1 1 5CA27E6A
P 5050 5350
F 0 "C2" H 5141 5396 50  0000 L CNN
F 1 "10u" H 5141 5305 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.4" H 5050 5350 50  0001 C CNN
F 3 "~" H 5050 5350 50  0001 C CNN
	1    5050 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5CA27EFC
P 5300 5350
F 0 "C4" H 5392 5396 50  0000 L CNN
F 1 "100n" H 5392 5305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5300 5350 50  0001 C CNN
F 3 "~" H 5300 5350 50  0001 C CNN
	1    5300 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5250 5050 5150
Wire Wire Line
	5050 5150 4450 5150
Connection ~ 4450 5150
Wire Wire Line
	5050 5150 5300 5150
Wire Wire Line
	5300 5150 5300 5250
Connection ~ 5050 5150
$Comp
L power:GND #PWR010
U 1 1 5CA28F8D
P 5200 5500
F 0 "#PWR010" H 5200 5250 50  0001 C CNN
F 1 "GND" H 5205 5327 50  0000 C CNN
F 2 "" H 5200 5500 50  0001 C CNN
F 3 "" H 5200 5500 50  0001 C CNN
	1    5200 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 5450 5300 5500
Wire Wire Line
	5300 5500 5200 5500
Wire Wire Line
	5050 5500 5050 5450
Connection ~ 5200 5500
Wire Wire Line
	5200 5500 5050 5500
$Comp
L Device:C_Small C1
U 1 1 5CA299DE
P 3550 5300
F 0 "C1" H 3642 5346 50  0000 L CNN
F 1 "100n" H 3642 5255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3550 5300 50  0001 C CNN
F 3 "~" H 3550 5300 50  0001 C CNN
	1    3550 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5CA29A69
P 3550 5450
F 0 "#PWR01" H 3550 5200 50  0001 C CNN
F 1 "GND" H 3555 5277 50  0000 C CNN
F 2 "" H 3550 5450 50  0001 C CNN
F 3 "" H 3550 5450 50  0001 C CNN
	1    3550 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5450 3550 5400
Wire Wire Line
	3550 5200 3550 5150
Wire Wire Line
	3550 5150 4350 5150
Connection ~ 4350 5150
Wire Wire Line
	3650 6000 3300 6000
Wire Wire Line
	3300 6000 3300 5150
Wire Wire Line
	3300 5150 3550 5150
Connection ~ 3550 5150
Wire Wire Line
	3650 6100 3300 6100
Wire Wire Line
	3300 6100 3300 6000
Connection ~ 3300 6000
$Comp
L power:GND #PWR05
U 1 1 5CA2CE6A
P 4400 6700
F 0 "#PWR05" H 4400 6450 50  0001 C CNN
F 1 "GND" H 4405 6527 50  0000 C CNN
F 2 "" H 4400 6700 50  0001 C CNN
F 3 "" H 4400 6700 50  0001 C CNN
	1    4400 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 6700 4400 6650
Wire Wire Line
	4400 6650 4350 6650
Wire Wire Line
	4350 6650 4350 6600
Wire Wire Line
	4400 6650 4450 6650
Wire Wire Line
	4450 6650 4450 6600
Connection ~ 4400 6650
$Comp
L Device:C_Small C3
U 1 1 5CA2F13D
P 5250 6350
F 0 "C3" H 5342 6396 50  0000 L CNN
F 1 "100n" H 5342 6305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5250 6350 50  0001 C CNN
F 3 "~" H 5250 6350 50  0001 C CNN
	1    5250 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5CA2F1C9
P 5250 6500
F 0 "#PWR011" H 5250 6250 50  0001 C CNN
F 1 "GND" H 5255 6327 50  0000 C CNN
F 2 "" H 5250 6500 50  0001 C CNN
F 3 "" H 5250 6500 50  0001 C CNN
	1    5250 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 6500 5250 6450
Wire Wire Line
	5250 6250 5250 6200
Wire Wire Line
	5250 6200 5050 6200
Text Label 3400 5800 0    50   ~ 0
SCL
Text Label 3400 5900 0    50   ~ 0
SDA
Wire Wire Line
	3400 5800 3650 5800
Wire Wire Line
	3400 5900 3650 5900
Text Label 4150 4150 0    50   ~ 0
SDA
Text Label 4150 4250 0    50   ~ 0
SCL
Wire Wire Line
	4600 4250 4150 4250
Wire Wire Line
	4600 4150 4150 4150
$Comp
L RF_GPS:ublox_SAM-M8Q U4
U 1 1 5CA3A74E
P 8250 5300
F 0 "U4" H 7900 5750 50  0000 C CNN
F 1 "ublox_SAM-M8Q" H 8650 4850 50  0000 C CNN
F 2 "RF_Module:ublox_SAM-M8Q" H 8800 4850 50  0001 C CNN
F 3 "https://www.u-blox.com/sites/default/files/SAM-M8Q_DataSheet_%28UBX-16012619%29.pdf" H 8250 5300 50  0001 C CNN
	1    8250 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5CA3A91C
P 8250 5800
F 0 "#PWR020" H 8250 5550 50  0001 C CNN
F 1 "GND" H 8255 5627 50  0000 C CNN
F 2 "" H 8250 5800 50  0001 C CNN
F 3 "" H 8250 5800 50  0001 C CNN
	1    8250 5800
	1    0    0    -1  
$EndComp
NoConn ~ 8750 5400
NoConn ~ 8750 5500
$Comp
L power:+3V3 #PWR019
U 1 1 5CA3D7E0
P 8250 4600
F 0 "#PWR019" H 8250 4450 50  0001 C CNN
F 1 "+3V3" H 8265 4773 50  0000 C CNN
F 2 "" H 8250 4600 50  0001 C CNN
F 3 "" H 8250 4600 50  0001 C CNN
	1    8250 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4800 8150 4700
Wire Wire Line
	8150 4700 8250 4700
Wire Wire Line
	8250 4700 8250 4600
Wire Wire Line
	8250 4700 8350 4700
Wire Wire Line
	8350 4700 8350 4800
Connection ~ 8250 4700
Wire Wire Line
	8250 4800 8250 4700
NoConn ~ 7750 5200
NoConn ~ 7750 5300
Text Label 9100 5100 2    50   ~ 0
U1TX
Text Label 9100 5200 2    50   ~ 0
U1RX
Wire Wire Line
	8750 5100 9100 5100
Wire Wire Line
	8750 5200 9100 5200
NoConn ~ 7750 5400
NoConn ~ 7750 5500
$Comp
L stc3100:STC3100 U5
U 1 1 5CA4E22C
P 9350 2250
F 0 "U5" H 9100 2700 50  0000 C CNN
F 1 "STC3100" H 9550 1800 50  0000 C CNN
F 2 "Package_SO:MSOP-8_3x3mm_P0.65mm" H 9350 2250 50  0001 C CNN
F 3 "" H 9350 2250 50  0001 C CNN
	1    9350 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R5
U 1 1 5CA3A583
P 10450 2550
F 0 "R5" H 10518 2596 50  0000 L CNN
F 1 "0.1 1%" H 10518 2505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10450 2550 50  0001 C CNN
F 3 "~" H 10450 2550 50  0001 C CNN
	1    10450 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5CA3A8E5
P 10450 2750
F 0 "#PWR025" H 10450 2500 50  0001 C CNN
F 1 "GND" H 10455 2577 50  0000 C CNN
F 2 "" H 10450 2750 50  0001 C CNN
F 3 "" H 10450 2750 50  0001 C CNN
	1    10450 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 2750 10450 2650
Wire Wire Line
	10450 2450 10450 2300
Wire Wire Line
	10450 2300 9850 2300
$Comp
L power:+BATT #PWR023
U 1 1 5CA3F94A
P 9350 1550
F 0 "#PWR023" H 9350 1400 50  0001 C CNN
F 1 "+BATT" H 9365 1723 50  0000 C CNN
F 2 "" H 9350 1550 50  0001 C CNN
F 3 "" H 9350 1550 50  0001 C CNN
	1    9350 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 1650 9350 1550
$Comp
L Device:C_Small C7
U 1 1 5CA41643
P 9100 1650
F 0 "C7" V 9329 1650 50  0000 C CNN
F 1 "1u" V 9238 1650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9100 1650 50  0001 C CNN
F 3 "~" H 9100 1650 50  0001 C CNN
	1    9100 1650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5CA4171F
P 8850 1750
F 0 "#PWR022" H 8850 1500 50  0001 C CNN
F 1 "GND" H 8855 1577 50  0000 C CNN
F 2 "" H 8850 1750 50  0001 C CNN
F 3 "" H 8850 1750 50  0001 C CNN
	1    8850 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1650 8850 1650
Wire Wire Line
	8850 1650 8850 1750
Wire Wire Line
	9200 1650 9350 1650
Connection ~ 9350 1650
$Comp
L Device:R_Small_US R3
U 1 1 5CA45206
P 8650 2100
F 0 "R3" V 8550 2100 50  0000 C CNN
F 1 "200k 0.1%" V 8750 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 8650 2100 50  0001 C CNN
F 3 "~" H 8650 2100 50  0001 C CNN
	1    8650 2100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5CA45376
P 8450 2100
F 0 "#PWR021" H 8450 1850 50  0001 C CNN
F 1 "GND" H 8455 1927 50  0000 C CNN
F 2 "" H 8450 2100 50  0001 C CNN
F 3 "" H 8450 2100 50  0001 C CNN
	1    8450 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2100 8750 2100
Wire Wire Line
	8550 2100 8450 2100
$Comp
L power:-BATT #PWR03
U 1 1 5CA49368
P 3950 1650
F 0 "#PWR03" H 3950 1500 50  0001 C CNN
F 1 "-BATT" H 3965 1823 50  0000 C CNN
F 2 "" H 3950 1650 50  0001 C CNN
F 3 "" H 3950 1650 50  0001 C CNN
	1    3950 1650
	-1   0    0    1   
$EndComp
$Comp
L power:-BATT #PWR027
U 1 1 5CA494CD
P 10600 2300
F 0 "#PWR027" H 10600 2150 50  0001 C CNN
F 1 "-BATT" V 10615 2428 50  0000 L CNN
F 2 "" H 10600 2300 50  0001 C CNN
F 3 "" H 10600 2300 50  0001 C CNN
	1    10600 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	10600 2300 10450 2300
Connection ~ 10450 2300
$Comp
L Device:R_Small_US R4
U 1 1 5CA4B440
P 10000 1650
F 0 "R4" V 9795 1650 50  0000 C CNN
F 1 "1k" V 9886 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10000 1650 50  0001 C CNN
F 3 "~" H 10000 1650 50  0001 C CNN
	1    10000 1650
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5CA4B558
P 10550 1800
F 0 "C8" H 10642 1846 50  0000 L CNN
F 1 "220n" H 10642 1755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 10550 1800 50  0001 C CNN
F 3 "~" H 10550 1800 50  0001 C CNN
	1    10550 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5CA4B5D2
P 10550 1950
F 0 "#PWR026" H 10550 1700 50  0001 C CNN
F 1 "GND" H 10555 1777 50  0000 C CNN
F 2 "" H 10550 1950 50  0001 C CNN
F 3 "" H 10550 1950 50  0001 C CNN
	1    10550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 1950 10550 1900
Wire Wire Line
	10550 1700 10550 1650
Wire Wire Line
	10550 1650 10300 1650
Wire Wire Line
	9900 1650 9350 1650
Wire Wire Line
	9850 2100 10300 2100
Wire Wire Line
	10300 2100 10300 1650
Connection ~ 10300 1650
Wire Wire Line
	10300 1650 10100 1650
$Comp
L power:GND #PWR024
U 1 1 5CA53A6D
P 9350 2850
F 0 "#PWR024" H 9350 2600 50  0001 C CNN
F 1 "GND" H 9355 2677 50  0000 C CNN
F 2 "" H 9350 2850 50  0001 C CNN
F 3 "" H 9350 2850 50  0001 C CNN
	1    9350 2850
	1    0    0    -1  
$EndComp
Text Label 8150 2300 0    50   ~ 0
SDA
Text Label 8150 2400 0    50   ~ 0
SCL
Wire Wire Line
	8850 2400 8150 2400
Wire Wire Line
	8850 2300 8150 2300
NoConn ~ 9850 2400
Text Label 6100 4050 2    50   ~ 0
U1TX
Text Label 6100 3850 2    50   ~ 0
U1RX
Wire Wire Line
	5750 3850 6100 3850
Wire Wire Line
	5750 4050 6100 4050
$Comp
L lsm303c:LSM303C U1
U 1 1 5CA7A3C3
P 4350 6000
F 0 "U1" H 3850 6500 50  0000 C CNN
F 1 "LSM303C" H 4750 5500 50  0000 C CNN
F 2 "LoRa32_Sensor_Board:LGA-12_2x2mm_P0.5mm_smallerpads" H 3950 5300 50  0001 L CNN
F 3 "www.st.com/resource/en/datasheet/lsm303c.pdf" H 4450 5350 50  0001 C CNN
	1    4350 6000
	1    0    0    -1  
$EndComp
NoConn ~ 5050 5800
NoConn ~ 5050 5900
NoConn ~ 5050 6000
Wire Wire Line
	6100 2600 6100 2850
$Comp
L ttgo_lora32:TTGO_LoRa32 U2
U 1 1 5CA16B34
P 5200 3550
F 0 "U2" H 4850 4500 50  0000 C CNN
F 1 "TTGO_LoRa32" H 5500 2550 50  0000 C CNN
F 2 "LoRa32_Sensor_Board:TTGO_LoRa32" H 4600 4250 50  0001 C CNN
F 3 "" H 4600 4250 50  0001 C CNN
	1    5200 3550
	1    0    0    -1  
$EndComp
NoConn ~ 4600 4050
NoConn ~ 5750 2950
NoConn ~ 5750 3050
NoConn ~ 5750 3150
$Comp
L power:+BATT #PWR06
U 1 1 5CA9653F
P 4700 1400
F 0 "#PWR06" H 4700 1250 50  0001 C CNN
F 1 "+BATT" H 4715 1573 50  0000 C CNN
F 2 "" H 4700 1400 50  0001 C CNN
F 3 "" H 4700 1400 50  0001 C CNN
	1    4700 1400
	1    0    0    -1  
$EndComp
$Comp
L power:-BATT #PWR07
U 1 1 5CA965A1
P 5050 1600
F 0 "#PWR07" H 5050 1450 50  0001 C CNN
F 1 "-BATT" H 5065 1773 50  0000 C CNN
F 2 "" H 5050 1600 50  0001 C CNN
F 3 "" H 5050 1600 50  0001 C CNN
	1    5050 1600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5CA96629
P 5400 1600
F 0 "#PWR012" H 5400 1350 50  0001 C CNN
F 1 "GND" H 5405 1427 50  0000 C CNN
F 2 "" H 5400 1600 50  0001 C CNN
F 3 "" H 5400 1600 50  0001 C CNN
	1    5400 1600
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5CA966C3
P 4700 1600
F 0 "#FLG01" H 4700 1675 50  0001 C CNN
F 1 "PWR_FLAG" H 4700 1773 50  0000 C CNN
F 2 "" H 4700 1600 50  0001 C CNN
F 3 "~" H 4700 1600 50  0001 C CNN
	1    4700 1600
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5CA9676A
P 5050 1400
F 0 "#FLG02" H 5050 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 5050 1574 50  0000 C CNN
F 2 "" H 5050 1400 50  0001 C CNN
F 3 "~" H 5050 1400 50  0001 C CNN
	1    5050 1400
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG03
U 1 1 5CA967C5
P 5400 1400
F 0 "#FLG03" H 5400 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 5400 1574 50  0000 C CNN
F 2 "" H 5400 1400 50  0001 C CNN
F 3 "~" H 5400 1400 50  0001 C CNN
	1    5400 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 1600 4700 1400
Wire Wire Line
	5050 1600 5050 1400
Wire Wire Line
	5400 1600 5400 1400
$Comp
L Device:C_Small C6
U 1 1 5CA9CF04
P 7750 3800
F 0 "C6" H 7842 3846 50  0000 L CNN
F 1 "1u" H 7842 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7750 3800 50  0001 C CNN
F 3 "~" H 7750 3800 50  0001 C CNN
	1    7750 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5CA9D022
P 7250 2900
F 0 "C5" V 7021 2900 50  0000 C CNN
F 1 "1u" V 7112 2900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7250 2900 50  0001 C CNN
F 3 "~" H 7250 2900 50  0001 C CNN
	1    7250 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small_US R1
U 1 1 5CA9D137
P 6150 4200
F 0 "R1" H 6218 4246 50  0000 L CNN
F 1 "33k" H 6218 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6150 4200 50  0001 C CNN
F 3 "~" H 6150 4200 50  0001 C CNN
	1    6150 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R2
U 1 1 5CA9D1B1
P 6500 4200
F 0 "R2" H 6568 4246 50  0000 L CNN
F 1 "33k" H 6568 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6500 4200 50  0001 C CNN
F 3 "~" H 6500 4200 50  0001 C CNN
	1    6500 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 4300 6150 4500
Wire Wire Line
	6500 4300 6500 4500
Wire Wire Line
	7750 3550 7750 3700
Wire Wire Line
	7350 2900 7750 2900
Text Label 5950 3350 0    50   ~ 0
SCK
Text Label 5950 3450 0    50   ~ 0
MOSI
Text Label 5950 3550 0    50   ~ 0
MISO
Text Label 5900 3750 0    50   ~ 0
MPL115A1_SHDN
$EndSCHEMATC
