EESchema Schematic File Version 2
LIBS:enc28j60
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:arduino
LIBS:valves
LIBS:Confort_Boiler-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "27 mar 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_3 K1
U 1 1 54DCBF76
P 1550 6500
F 0 "K1" V 1500 6500 50  0000 C CNN
F 1 "DHT1" V 1600 6500 40  0000 C CNN
F 2 "" H 1550 6500 60  0000 C CNN
F 3 "" H 1550 6500 60  0000 C CNN
	1    1550 6500
	0    1    1    0   
$EndComp
$Comp
L CONN_3 K2
U 1 1 54DCBF93
P 2250 6500
F 0 "K2" V 2200 6500 50  0000 C CNN
F 1 "DHT2" V 2300 6500 40  0000 C CNN
F 2 "" H 2250 6500 60  0000 C CNN
F 3 "" H 2250 6500 60  0000 C CNN
	1    2250 6500
	0    1    1    0   
$EndComp
$Comp
L CONN_3 K3
U 1 1 54DCBFAE
P 3050 6500
F 0 "K3" V 3000 6500 50  0000 C CNN
F 1 "DS18B20" V 3100 6500 40  0000 C CNN
F 2 "" H 3050 6500 60  0000 C CNN
F 3 "" H 3050 6500 60  0000 C CNN
	1    3050 6500
	0    1    1    0   
$EndComp
$Comp
L CONN_2 P1
U 1 1 54DCC0AE
P 850 1050
F 0 "P1" V 800 1050 40  0000 C CNN
F 1 "TOBOILER" V 900 1050 40  0000 C CNN
F 2 "" H 850 1050 60  0000 C CNN
F 3 "" H 850 1050 60  0000 C CNN
	1    850  1050
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D1
U 1 1 54DCC0DA
P 1300 1750
F 0 "D1" H 1300 1850 40  0000 C CNN
F 1 "DIODE" H 1300 1650 40  0000 C CNN
F 2 "~" H 1300 1750 60  0000 C CNN
F 3 "~" H 1300 1750 60  0000 C CNN
	1    1300 1750
	1    0    0    -1  
$EndComp
$Comp
L DIODE D3
U 1 1 54DCC11F
P 1850 1750
F 0 "D3" H 1850 1850 40  0000 C CNN
F 1 "DIODE" H 1850 1650 40  0000 C CNN
F 2 "~" H 1850 1750 60  0000 C CNN
F 3 "~" H 1850 1750 60  0000 C CNN
	1    1850 1750
	-1   0    0    1   
$EndComp
$Comp
L DIODE D2
U 1 1 54DCC12E
P 1300 2050
F 0 "D2" H 1300 2150 40  0000 C CNN
F 1 "DIODE" H 1300 1950 40  0000 C CNN
F 2 "~" H 1300 2050 60  0000 C CNN
F 3 "~" H 1300 2050 60  0000 C CNN
	1    1300 2050
	-1   0    0    1   
$EndComp
$Comp
L DIODE D4
U 1 1 54DCC13D
P 1850 2050
F 0 "D4" H 1850 2150 40  0000 C CNN
F 1 "DIODE" H 1850 1950 40  0000 C CNN
F 2 "~" H 1850 2050 60  0000 C CNN
F 3 "~" H 1850 2050 60  0000 C CNN
	1    1850 2050
	1    0    0    -1  
$EndComp
$Comp
L OPTO-TRANSISTOR4 U1
U 1 1 54DCC254
P 4400 1900
F 0 "U1" H 4600 2150 60  0000 C CNN
F 1 "OPTO-TRANSISTOR4" H 4400 1650 60  0000 C CNN
F 2 "" H 4400 1900 60  0000 C CNN
F 3 "" H 4400 1900 60  0000 C CNN
	1    4400 1900
	-1   0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 54DCC2FC
P 5450 3000
F 0 "R4" V 5530 3000 40  0000 C CNN
F 1 "330" V 5457 3001 40  0000 C CNN
F 2 "~" V 5380 3000 30  0000 C CNN
F 3 "~" H 5450 3000 30  0000 C CNN
	1    5450 3000
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 54DCC4E6
P 1550 5750
F 0 "R1" V 1630 5750 40  0000 C CNN
F 1 "10K" V 1557 5751 40  0000 C CNN
F 2 "~" V 1480 5750 30  0000 C CNN
F 3 "~" H 1550 5750 30  0000 C CNN
	1    1550 5750
	1    0    0    -1  
$EndComp
Text Label 1450 5400 2    60   ~ 0
VCC
Text Label 1650 5400 0    60   ~ 0
GND
Text Label 1550 5400 2    60   ~ 0
LDHT1
$Comp
L R R2
U 1 1 54DCC5CE
P 2250 5750
F 0 "R2" V 2330 5750 40  0000 C CNN
F 1 "10K" V 2257 5751 40  0000 C CNN
F 2 "~" V 2180 5750 30  0000 C CNN
F 3 "~" H 2250 5750 30  0000 C CNN
	1    2250 5750
	1    0    0    -1  
$EndComp
Text Label 2150 5400 2    60   ~ 0
VCC
Text Label 2250 5400 1    60   ~ 0
LDHT2
Text Label 2350 5400 0    60   ~ 0
GND
Text Label 3050 5400 1    60   ~ 0
LDS20B18
Text Label 2950 5400 2    60   ~ 0
VCC
$Comp
L R R3
U 1 1 54DCC720
P 2800 5800
F 0 "R3" V 2880 5800 40  0000 C CNN
F 1 "4K7" V 2807 5801 40  0000 C CNN
F 2 "~" V 2730 5800 30  0000 C CNN
F 3 "~" H 2800 5800 30  0000 C CNN
	1    2800 5800
	1    0    0    -1  
$EndComp
Text Label 3150 5400 0    60   ~ 0
GND
$Comp
L ARDUINO_MINI U2
U 1 1 54DCF16D
P 7350 2150
F 0 "U2" H 7850 1200 70  0000 C CNN
F 1 "ARDUINO_MINI" H 8100 1100 70  0000 C CNN
F 2 "DIL20" H 7350 2100 60  0000 C CNN
F 3 "" H 7350 2150 60  0000 C CNN
	1    7350 2150
	1    0    0    -1  
$EndComp
Text GLabel 2250 5400 1    60   Input ~ 0
LDHT2
Text HLabel 3150 5400 1    60   Input ~ 0
GND
Text HLabel 2350 5400 1    60   Input ~ 0
GND
Text HLabel 1650 5400 1    60   Input ~ 0
GND
Text GLabel 1450 5400 0    60   Input ~ 0
VCC
Text GLabel 2150 5400 1    60   Input ~ 0
VCC
Text GLabel 2950 5400 1    60   Input ~ 0
VCC
Text GLabel 1550 5400 1    60   Input ~ 0
LDHT1
Text GLabel 3050 5400 1    60   Input ~ 0
LDS18B20
Text GLabel 8950 2000 2    60   Input ~ 0
LDS18B20
Text GLabel 8550 2100 2    60   Input ~ 0
LDHT2
Text GLabel 8550 2200 2    60   Input ~ 0
LDHT1
Text HLabel 9250 3500 1    60   Input ~ 0
GND
Text GLabel 7350 850  1    60   Input ~ 0
VCC
$Comp
L ENC28J60 U3
U 1 1 54DD0F36
P 9250 1300
F 0 "U3" H 9250 950 60  0000 C CNN
F 1 "ENC28J60" H 9250 1650 60  0000 C CNN
F 2 "" H 9250 1300 60  0000 C CNN
F 3 "" H 9250 1300 60  0000 C CNN
	1    9250 1300
	-1   0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 54F6D454
P 3250 1400
F 0 "R7" V 3330 1400 40  0000 C CNN
F 1 "330" V 3257 1401 40  0000 C CNN
F 2 "~" V 3180 1400 30  0000 C CNN
F 3 "~" H 3250 1400 30  0000 C CNN
	1    3250 1400
	0    -1   -1   0   
$EndComp
$Comp
L BC558 Q1
U 1 1 54F6D461
P 2900 1750
F 0 "Q1" H 2900 1601 40  0000 R CNN
F 1 "BC558" H 2900 1900 40  0000 R CNN
F 2 "TO92" H 2800 1852 29  0000 C CNN
F 3 "~" H 2900 1750 60  0000 C CNN
	1    2900 1750
	-1   0    0    1   
$EndComp
$Comp
L R R5
U 1 1 54F6D549
P 2800 2350
F 0 "R5" V 2880 2350 40  0000 C CNN
F 1 "200" V 2807 2351 40  0000 C CNN
F 2 "~" V 2730 2350 30  0000 C CNN
F 3 "~" H 2800 2350 30  0000 C CNN
	1    2800 2350
	-1   0    0    1   
$EndComp
$Comp
L R R6
U 1 1 54F6D56D
P 2800 3000
F 0 "R6" V 2880 3000 40  0000 C CNN
F 1 "100" V 2807 3001 40  0000 C CNN
F 2 "~" V 2730 3000 30  0000 C CNN
F 3 "~" H 2800 3000 30  0000 C CNN
	1    2800 3000
	-1   0    0    1   
$EndComp
$Comp
L ZENER D5
U 1 1 54F6D68D
P 2350 2700
F 0 "D5" H 2350 2800 50  0000 C CNN
F 1 "4v7" H 2350 2600 40  0000 C CNN
F 2 "~" H 2350 2700 60  0000 C CNN
F 3 "~" H 2350 2700 60  0000 C CNN
	1    2350 2700
	0    -1   -1   0   
$EndComp
$Comp
L ZENER D6
U 1 1 54F6D772
P 3350 2200
F 0 "D6" H 3350 2300 50  0000 C CNN
F 1 "15V" H 3350 2100 40  0000 C CNN
F 2 "~" H 3350 2200 60  0000 C CNN
F 3 "~" H 3350 2200 60  0000 C CNN
	1    3350 2200
	0    -1   -1   0   
$EndComp
$Comp
L ZENER D7
U 1 1 54F6D928
P 3650 2400
F 0 "D7" H 3650 2500 50  0000 C CNN
F 1 "4v3" H 3650 2300 40  0000 C CNN
F 2 "~" H 3650 2400 60  0000 C CNN
F 3 "~" H 3650 2400 60  0000 C CNN
	1    3650 2400
	0    -1   -1   0   
$EndComp
$Comp
L OPTO-TRANSISTOR4 U4
U 1 1 54F6DA08
P 4450 2850
F 0 "U4" H 4650 3100 60  0000 C CNN
F 1 "OPTO-TRANSISTOR4" H 4450 2600 60  0000 C CNN
F 2 "" H 4450 2850 60  0000 C CNN
F 3 "" H 4450 2850 60  0000 C CNN
	1    4450 2850
	1    0    0    -1  
$EndComp
Text GLabel 5500 1350 1    60   Input ~ 0
VCC
Text HLabel 5800 3100 3    60   Input ~ 0
GND
$Comp
L R R8
U 1 1 54F6DCE6
P 5450 2850
F 0 "R8" V 5530 2850 40  0000 C CNN
F 1 "1K5" V 5457 2851 40  0000 C CNN
F 2 "~" V 5380 2850 30  0000 C CNN
F 3 "~" H 5450 2850 30  0000 C CNN
	1    5450 2850
	0    -1   -1   0   
$EndComp
Text GLabel 5850 2850 2    60   Input ~ 0
LRX
$Comp
L R R9
U 1 1 54F6DDEA
P 5500 2050
F 0 "R9" V 5580 2050 40  0000 C CNN
F 1 "1K5" V 5507 2051 40  0000 C CNN
F 2 "~" V 5430 2050 30  0000 C CNN
F 3 "~" H 5500 2050 30  0000 C CNN
	1    5500 2050
	0    -1   -1   0   
$EndComp
Text GLabel 5850 2050 2    60   Input ~ 0
LTX
Wire Wire Line
	1500 1750 1650 1750
Wire Wire Line
	2050 1750 2150 1750
Wire Wire Line
	2150 1750 2150 2050
Wire Wire Line
	2150 2050 2050 2050
Wire Wire Line
	1500 2050 1650 2050
Wire Wire Line
	950  2050 1100 2050
Wire Wire Line
	950  1400 950  2050
Connection ~ 950  1750
Wire Wire Line
	2250 2250 2250 1900
Wire Wire Line
	2250 1900 2150 1900
Connection ~ 2150 1900
Wire Wire Line
	1550 1750 1550 1400
Connection ~ 1550 1750
Wire Wire Line
	1550 2050 1550 3350
Connection ~ 1550 2050
Wire Wire Line
	1550 6000 1550 6150
Wire Wire Line
	1550 5400 1550 5500
Wire Wire Line
	1650 5400 1650 6150
Wire Wire Line
	1450 5400 1450 6150
Wire Wire Line
	2350 6150 2350 5400
Wire Wire Line
	2250 6000 2250 6150
Wire Wire Line
	2250 5400 2250 5500
Wire Wire Line
	2150 5400 2150 6150
Wire Wire Line
	3050 5400 3050 6150
Wire Wire Line
	2950 5400 2950 6150
Wire Wire Line
	3050 6100 2800 6100
Wire Wire Line
	2800 6100 2800 6050
Connection ~ 3050 6100
Wire Wire Line
	2800 5550 2800 5500
Wire Wire Line
	2800 5500 2950 5500
Connection ~ 2950 5500
Wire Wire Line
	3150 6150 3150 5400
Wire Wire Line
	7350 3700 7350 3750
Wire Wire Line
	7350 3750 9850 3750
Wire Wire Line
	8050 1600 8350 1600
Wire Wire Line
	8050 1500 8300 1500
Wire Wire Line
	8950 2000 8050 2000
Wire Wire Line
	8550 2100 8050 2100
Wire Wire Line
	8550 2200 8050 2200
Wire Wire Line
	9250 3500 9250 3750
Connection ~ 9250 3750
Wire Wire Line
	7350 850  7350 1000
Wire Wire Line
	8050 1800 8550 1800
Wire Wire Line
	8550 1800 8550 1400
Wire Wire Line
	8550 1400 8700 1400
Wire Wire Line
	8700 1300 8500 1300
Wire Wire Line
	8500 1300 8500 1700
Wire Wire Line
	8500 1700 8050 1700
Wire Wire Line
	9800 1200 9950 1200
Wire Wire Line
	9950 1200 9950 850 
Wire Wire Line
	9950 850  8350 850 
Wire Wire Line
	8350 850  8350 1600
Wire Wire Line
	9800 1300 10000 1300
Wire Wire Line
	10000 1300 10000 800 
Wire Wire Line
	10000 800  8300 800 
Wire Wire Line
	8300 800  8300 1500
Wire Wire Line
	8450 1500 8700 1500
Wire Wire Line
	8450 900  8450 1500
Wire Wire Line
	9850 3750 9850 1500
Wire Wire Line
	9850 1500 9800 1500
Wire Wire Line
	1550 1400 3000 1400
Wire Wire Line
	2800 1550 2800 1400
Connection ~ 2800 1400
Wire Wire Line
	2800 3250 2800 3350
Wire Wire Line
	1550 3350 3750 3350
Wire Wire Line
	2800 1950 2800 2100
Wire Wire Line
	2800 2600 2800 2750
Wire Wire Line
	2350 2500 2350 2050
Wire Wire Line
	2350 2050 2800 2050
Connection ~ 2800 2050
Wire Wire Line
	2350 2900 2350 3350
Connection ~ 2350 3350
Wire Wire Line
	3100 1750 3800 1750
Wire Wire Line
	3350 1750 3350 2000
Wire Wire Line
	3350 3350 3350 2400
Connection ~ 2800 3350
Connection ~ 3350 1750
Wire Wire Line
	3500 1400 3600 1400
Wire Wire Line
	3600 1400 3600 1750
Connection ~ 3600 1750
Wire Wire Line
	3650 3350 3650 2600
Connection ~ 3350 3350
Wire Wire Line
	3800 2050 3650 2050
Wire Wire Line
	3650 2050 3650 2200
Wire Wire Line
	3800 3000 3750 3000
Wire Wire Line
	3750 3000 3750 3350
Connection ~ 3650 3350
Wire Wire Line
	3800 2700 2800 2700
Connection ~ 2800 2700
Wire Wire Line
	5500 1350 5500 1750
Wire Wire Line
	5500 1750 5050 1750
Wire Wire Line
	5200 1750 5200 2700
Wire Wire Line
	5200 2700 5050 2700
Connection ~ 5200 1750
Wire Wire Line
	5050 3000 5200 3000
Wire Wire Line
	5700 3000 5800 3000
Wire Wire Line
	5800 3000 5800 3100
Wire Wire Line
	5200 2850 5100 2850
Wire Wire Line
	5100 2850 5100 3000
Connection ~ 5100 3000
Wire Wire Line
	5850 2850 5700 2850
Wire Wire Line
	5050 2050 5250 2050
Wire Wire Line
	5850 2050 5750 2050
Wire Wire Line
	750  1400 750  2250
Connection ~ 750  2250
Wire Wire Line
	750  2250 2250 2250
Wire Wire Line
	1100 1750 950  1750
Text GLabel 8300 2650 2    60   Input ~ 0
LRX
Wire Wire Line
	8300 2650 8050 2650
Text GLabel 8300 2550 2    60   Input ~ 0
LTX
Wire Wire Line
	7350 900  8450 900 
Connection ~ 7350 900 
Wire Wire Line
	8050 2550 8300 2550
$EndSCHEMATC
