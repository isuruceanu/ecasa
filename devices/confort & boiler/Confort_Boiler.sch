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
Date "12 feb 2015"
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
P 1750 4150
F 0 "K1" V 1700 4150 50  0000 C CNN
F 1 "DHT1" V 1800 4150 40  0000 C CNN
F 2 "" H 1750 4150 60  0000 C CNN
F 3 "" H 1750 4150 60  0000 C CNN
	1    1750 4150
	0    1    1    0   
$EndComp
$Comp
L CONN_3 K2
U 1 1 54DCBF93
P 2450 4150
F 0 "K2" V 2400 4150 50  0000 C CNN
F 1 "DHT2" V 2500 4150 40  0000 C CNN
F 2 "" H 2450 4150 60  0000 C CNN
F 3 "" H 2450 4150 60  0000 C CNN
	1    2450 4150
	0    1    1    0   
$EndComp
$Comp
L CONN_3 K3
U 1 1 54DCBFAE
P 3250 4150
F 0 "K3" V 3200 4150 50  0000 C CNN
F 1 "DS18B20" V 3300 4150 40  0000 C CNN
F 2 "" H 3250 4150 60  0000 C CNN
F 3 "" H 3250 4150 60  0000 C CNN
	1    3250 4150
	0    1    1    0   
$EndComp
$Comp
L CONN_2 P1
U 1 1 54DCC0AE
P 1050 1050
F 0 "P1" V 1000 1050 40  0000 C CNN
F 1 "TOBOILER" V 1100 1050 40  0000 C CNN
F 2 "" H 1050 1050 60  0000 C CNN
F 3 "" H 1050 1050 60  0000 C CNN
	1    1050 1050
	0    -1   -1   0   
$EndComp
$Comp
L CONN_2 P2
U 1 1 54DCC0C2
P 1050 2650
F 0 "P2" V 1000 2650 40  0000 C CNN
F 1 "BOILERSW" V 1100 2650 40  0000 C CNN
F 2 "" H 1050 2650 60  0000 C CNN
F 3 "" H 1050 2650 60  0000 C CNN
	1    1050 2650
	0    1    1    0   
$EndComp
$Comp
L DIODE D1
U 1 1 54DCC0DA
P 1950 1650
F 0 "D1" H 1950 1750 40  0000 C CNN
F 1 "DIODE" H 1950 1550 40  0000 C CNN
F 2 "~" H 1950 1650 60  0000 C CNN
F 3 "~" H 1950 1650 60  0000 C CNN
	1    1950 1650
	1    0    0    -1  
$EndComp
$Comp
L DIODE D3
U 1 1 54DCC11F
P 2500 1650
F 0 "D3" H 2500 1750 40  0000 C CNN
F 1 "DIODE" H 2500 1550 40  0000 C CNN
F 2 "~" H 2500 1650 60  0000 C CNN
F 3 "~" H 2500 1650 60  0000 C CNN
	1    2500 1650
	-1   0    0    1   
$EndComp
$Comp
L DIODE D2
U 1 1 54DCC12E
P 1950 1950
F 0 "D2" H 1950 2050 40  0000 C CNN
F 1 "DIODE" H 1950 1850 40  0000 C CNN
F 2 "~" H 1950 1950 60  0000 C CNN
F 3 "~" H 1950 1950 60  0000 C CNN
	1    1950 1950
	-1   0    0    1   
$EndComp
$Comp
L DIODE D4
U 1 1 54DCC13D
P 2500 1950
F 0 "D4" H 2500 2050 40  0000 C CNN
F 1 "DIODE" H 2500 1850 40  0000 C CNN
F 2 "~" H 2500 1950 60  0000 C CNN
F 3 "~" H 2500 1950 60  0000 C CNN
	1    2500 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1400 1150 2300
Wire Wire Line
	1150 1650 1750 1650
Wire Wire Line
	2150 1650 2300 1650
Wire Wire Line
	2700 1650 2800 1650
Wire Wire Line
	2800 1650 2800 1950
Wire Wire Line
	2800 1950 2700 1950
Wire Wire Line
	2150 1950 2300 1950
Wire Wire Line
	1750 1950 1600 1950
Wire Wire Line
	1600 1950 1600 1650
Connection ~ 1600 1650
Wire Wire Line
	950  1400 950  2300
Wire Wire Line
	950  2150 2900 2150
Wire Wire Line
	2900 2150 2900 1800
Wire Wire Line
	2900 1800 2800 1800
Connection ~ 2800 1800
Connection ~ 950  2150
Connection ~ 1150 1650
Wire Wire Line
	2200 1650 2200 1300
Wire Wire Line
	2200 1300 3200 1300
Connection ~ 2200 1650
Wire Wire Line
	2200 1950 2200 2300
Wire Wire Line
	2200 2300 3200 2300
Connection ~ 2200 1950
$Comp
L OPTO-TRANSISTOR4 U1
U 1 1 54DCC254
P 3850 1750
F 0 "U1" H 4050 2000 60  0000 C CNN
F 1 "OPTO-TRANSISTOR4" H 3850 1500 60  0000 C CNN
F 2 "" H 3850 1750 60  0000 C CNN
F 3 "" H 3850 1750 60  0000 C CNN
	1    3850 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3200 1300 3200 1600
Wire Wire Line
	3200 1600 3250 1600
Wire Wire Line
	3200 2300 3200 1900
Wire Wire Line
	3200 1900 3250 1900
Text HLabel 4750 1300 1    60   Input ~ 0
GND
Wire Wire Line
	4500 1600 4750 1600
Wire Wire Line
	4750 1600 4750 1300
$Comp
L R R4
U 1 1 54DCC2FC
P 4900 1900
F 0 "R4" V 4980 1900 40  0000 C CNN
F 1 "220" V 4907 1901 40  0000 C CNN
F 2 "~" V 4830 1900 30  0000 C CNN
F 3 "~" H 4900 1900 30  0000 C CNN
	1    4900 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4500 1900 4650 1900
$Comp
L R R1
U 1 1 54DCC4E6
P 1750 3400
F 0 "R1" V 1830 3400 40  0000 C CNN
F 1 "10K" V 1757 3401 40  0000 C CNN
F 2 "~" V 1680 3400 30  0000 C CNN
F 3 "~" H 1750 3400 30  0000 C CNN
	1    1750 3400
	1    0    0    -1  
$EndComp
Text Label 1650 3050 2    60   ~ 0
VCC
Text Label 1850 3050 0    60   ~ 0
GND
Text Label 1750 3050 2    60   ~ 0
LDHT1
Wire Wire Line
	1750 3650 1750 3800
Wire Wire Line
	1750 3050 1750 3150
Wire Wire Line
	1850 3050 1850 3800
Wire Wire Line
	1650 3050 1650 3800
$Comp
L R R2
U 1 1 54DCC5CE
P 2450 3400
F 0 "R2" V 2530 3400 40  0000 C CNN
F 1 "10K" V 2457 3401 40  0000 C CNN
F 2 "~" V 2380 3400 30  0000 C CNN
F 3 "~" H 2450 3400 30  0000 C CNN
	1    2450 3400
	1    0    0    -1  
$EndComp
Text Label 2350 3050 2    60   ~ 0
VCC
Text Label 2450 3050 1    60   ~ 0
LDHT2
Text Label 2550 3050 0    60   ~ 0
GND
Wire Wire Line
	2550 3800 2550 3050
Wire Wire Line
	2450 3650 2450 3800
Wire Wire Line
	2450 3050 2450 3150
Wire Wire Line
	2350 3050 2350 3800
Text Label 3250 3050 1    60   ~ 0
LDS20B18
Text Label 3150 3050 2    60   ~ 0
VCC
Wire Wire Line
	3250 3050 3250 3800
Wire Wire Line
	3150 3050 3150 3800
$Comp
L R R3
U 1 1 54DCC720
P 3000 3450
F 0 "R3" V 3080 3450 40  0000 C CNN
F 1 "4K7" V 3007 3451 40  0000 C CNN
F 2 "~" V 2930 3450 30  0000 C CNN
F 3 "~" H 3000 3450 30  0000 C CNN
	1    3000 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3750 3000 3750
Wire Wire Line
	3000 3750 3000 3700
Connection ~ 3250 3750
Wire Wire Line
	3000 3200 3000 3150
Wire Wire Line
	3000 3150 3150 3150
Connection ~ 3150 3150
Text Label 3350 3050 0    60   ~ 0
GND
Wire Wire Line
	3350 3800 3350 3050
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
Wire Wire Line
	7500 800  7500 1000
Wire Wire Line
	7350 3700 7350 3750
Wire Wire Line
	7350 3750 9850 3750
Wire Wire Line
	6650 3450 6550 3450
Wire Wire Line
	6550 3450 6550 3800
Wire Wire Line
	6550 3800 9950 3800
Wire Wire Line
	8050 2750 10200 2750
Wire Wire Line
	8050 1600 8350 1600
Wire Wire Line
	8050 1500 8300 1500
Text GLabel 2450 3050 1    60   Input ~ 0
LDHT2
Text HLabel 3350 3050 1    60   Input ~ 0
GND
Text HLabel 2550 3050 1    60   Input ~ 0
GND
Text HLabel 1850 3050 1    60   Input ~ 0
GND
Text GLabel 1650 3050 0    60   Input ~ 0
VCC
Text GLabel 2350 3050 1    60   Input ~ 0
VCC
Text GLabel 3150 3050 1    60   Input ~ 0
VCC
Text GLabel 1750 3050 1    60   Input ~ 0
LDHT1
Text GLabel 3250 3050 1    60   Input ~ 0
LDS18B20
Text GLabel 5350 1900 2    60   Input ~ 0
LBOILER
Wire Wire Line
	5150 1900 5350 1900
Text GLabel 8500 1900 2    60   Input ~ 0
LBOILER
Text GLabel 8950 2000 2    60   Input ~ 0
LDS18B20
Text GLabel 8550 2100 2    60   Input ~ 0
LDHT2
Text GLabel 8550 2200 2    60   Input ~ 0
LDHT1
Wire Wire Line
	8050 1900 8500 1900
Wire Wire Line
	8950 2000 8050 2000
Wire Wire Line
	8550 2100 8050 2100
Wire Wire Line
	8550 2200 8050 2200
Text HLabel 9250 3500 1    60   Input ~ 0
GND
Wire Wire Line
	9250 3500 9250 3750
Connection ~ 9250 3750
Text GLabel 7350 850  1    60   Input ~ 0
VCC
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
	8700 1500 8450 1500
Wire Wire Line
	8450 1500 8450 950 
Wire Wire Line
	8450 950  7650 950 
Wire Wire Line
	7650 950  7650 800 
Wire Wire Line
	7650 800  7500 800 
Wire Wire Line
	9800 1100 10200 1100
Wire Wire Line
	10200 1100 10200 2750
Wire Wire Line
	9850 3750 9850 1500
Wire Wire Line
	9850 1500 9800 1500
Wire Wire Line
	9800 1400 9950 1400
Wire Wire Line
	9950 1400 9950 3800
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
$EndSCHEMATC
