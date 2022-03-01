EESchema Schematic File Version 4
EELAYER 30 0
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
L my:MCP2221 IC1
U 1 1 549866AF
P 5050 2800
F 0 "IC1" H 5100 3200 60  0000 C CNN
F 1 "MCP2221" H 5050 2400 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-14_3.9x8.7mm_Pitch1.27mm" H 5050 2650 60  0001 C CNN
F 3 "" H 5050 2650 60  0000 C CNN
	1    5050 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 54986C8D
P 5750 3200
F 0 "R4" V 5830 3200 40  0000 C CNN
F 1 "2.2k" V 5757 3201 40  0000 C CNN
F 2 "my:SMD-0805" V 5680 3200 30  0001 C CNN
F 3 "" H 5750 3200 30  0000 C CNN
	1    5750 3200
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 54986CD2
P 5900 3200
F 0 "R5" V 5980 3200 40  0000 C CNN
F 1 "2.2k" V 5907 3201 40  0000 C CNN
F 2 "my:SMD-0805" V 5830 3200 30  0001 C CNN
F 3 "" H 5900 3200 30  0000 C CNN
	1    5900 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 54986F67
P 5900 2250
F 0 "#PWR014" H 5900 2250 30  0001 C CNN
F 1 "GND" H 5900 2180 30  0001 C CNN
F 2 "" H 5900 2250 60  0000 C CNN
F 3 "" H 5900 2250 60  0000 C CNN
	1    5900 2250
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR07
U 1 1 54986F9A
P 4600 2200
F 0 "#PWR07" H 4600 2300 30  0001 C CNN
F 1 "VDD" H 4600 2310 30  0000 C CNN
F 2 "" H 4600 2200 60  0000 C CNN
F 3 "" H 4600 2200 60  0000 C CNN
	1    4600 2200
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR08
U 1 1 54986FB7
P 4900 2000
F 0 "#PWR08" H 4900 2100 30  0001 C CNN
F 1 "VDD" H 4900 2110 30  0000 C CNN
F 2 "" H 4900 2000 60  0000 C CNN
F 3 "" H 4900 2000 60  0000 C CNN
	1    4900 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 54986FD4
P 5050 2050
F 0 "#PWR09" H 5050 2050 30  0001 C CNN
F 1 "GND" H 5050 1980 30  0001 C CNN
F 2 "" H 5050 2050 60  0000 C CNN
F 3 "" H 5050 2050 60  0000 C CNN
	1    5050 2050
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 54986FF1
P 5050 2000
F 0 "#FLG02" H 5050 2095 30  0001 C CNN
F 1 "PWR_FLAG" H 5050 2180 30  0000 C CNN
F 2 "" H 5050 2000 60  0000 C CNN
F 3 "" H 5050 2000 60  0000 C CNN
	1    5050 2000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5498700E
P 4900 2050
F 0 "#FLG01" H 4900 2145 30  0001 C CNN
F 1 "PWR_FLAG" H 4900 2230 30  0000 C CNN
F 2 "" H 4900 2050 60  0000 C CNN
F 3 "" H 4900 2050 60  0000 C CNN
	1    4900 2050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 549872A8
P 4450 2100
F 0 "R2" V 4530 2100 40  0000 C CNN
F 1 "10k" V 4457 2101 40  0000 C CNN
F 2 "my:SMD-0805" V 4380 2100 30  0001 C CNN
F 3 "" H 4450 2100 30  0000 C CNN
	1    4450 2100
	-1   0    0    1   
$EndComp
$Comp
L power:VDD #PWR06
U 1 1 5498736A
P 4450 1900
F 0 "#PWR06" H 4450 2000 30  0001 C CNN
F 1 "VDD" H 4450 2010 30  0000 C CNN
F 2 "" H 4450 1900 60  0000 C CNN
F 3 "" H 4450 1900 60  0000 C CNN
	1    4450 1900
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR03
U 1 1 549873D7
P 4200 1900
F 0 "#PWR03" H 4200 2000 30  0001 C CNN
F 1 "VDD" H 4200 2010 30  0000 C CNN
F 2 "" H 4200 1900 60  0000 C CNN
F 3 "" H 4200 1900 60  0000 C CNN
	1    4200 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 549873EC
P 4200 2300
F 0 "#PWR04" H 4200 2300 30  0001 C CNN
F 1 "GND" H 4200 2230 30  0001 C CNN
F 2 "" H 4200 2300 60  0000 C CNN
F 3 "" H 4200 2300 60  0000 C CNN
	1    4200 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 54987403
P 4200 2100
F 0 "C2" H 4200 2200 40  0000 L CNN
F 1 "0.1u" H 4206 2015 40  0000 L CNN
F 2 "my:SMD-0805" H 4238 1950 30  0001 C CNN
F 3 "" H 4200 2100 60  0000 C CNN
	1    4200 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5498751C
P 6500 3050
F 0 "C6" H 6500 3150 40  0000 L CNN
F 1 "4.7u" V 6650 2850 40  0000 L CNN
F 2 "my:SMD-0805" H 6538 2900 30  0001 C CNN
F 3 "" H 6500 3050 60  0000 C CNN
	1    6500 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 54987696
P 3950 2300
F 0 "#PWR02" H 3950 2300 30  0001 C CNN
F 1 "GND" H 3950 2230 30  0001 C CNN
F 2 "" H 3950 2300 60  0000 C CNN
F 3 "" H 3950 2300 60  0000 C CNN
	1    3950 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5498769C
P 3950 2100
F 0 "C1" H 3950 2200 40  0000 L CNN
F 1 "4.7u" H 3956 2015 40  0000 L CNN
F 2 "my:SMD-0805" H 3988 1950 30  0001 C CNN
F 3 "" H 3950 2100 60  0000 C CNN
	1    3950 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3200 3950 3300
Wire Wire Line
	4650 2800 4450 2800
Connection ~ 4600 2300
Wire Wire Line
	5050 2000 5050 2050
Wire Wire Line
	4900 2050 4900 2000
Connection ~ 5750 2950
Wire Wire Line
	5900 2950 5750 2950
Wire Wire Line
	5600 3000 5450 3000
Wire Wire Line
	5600 3000 5600 3500
Wire Wire Line
	5450 2900 5550 2900
Wire Wire Line
	5500 3100 5450 3100
Wire Wire Line
	5500 3300 5500 3100
Wire Wire Line
	3950 3300 5500 3300
Connection ~ 4600 2500
Wire Wire Line
	5450 2800 5550 2800
Wire Wire Line
	4600 2200 4600 2300
Wire Wire Line
	4600 2300 4600 2500
Wire Wire Line
	4600 2500 4650 2500
Wire Wire Line
	4450 1900 4450 1950
Wire Wire Line
	4200 2250 4200 2300
Wire Wire Line
	3950 2250 3950 2300
Wire Wire Line
	4200 1900 4200 1950
Wire Wire Line
	5750 2950 5750 3050
Wire Wire Line
	5900 2950 5900 3050
Wire Wire Line
	5900 3350 5900 3550
Wire Wire Line
	5750 3350 5750 3500
$Comp
L Regulator_Linear:LM1117-3.3 U1
U 1 1 615491F5
P 5900 1900
F 0 "U1" H 5900 2142 50  0000 C CNN
F 1 "LM1117-3.3" H 5900 2051 50  0000 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-223-3_TabPin2" H 5900 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 5900 1900 50  0001 C CNN
	1    5900 1900
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 6154B126
P 6800 2600
F 0 "J6" H 6880 2592 50  0000 L CNN
F 1 "USB" H 6700 2800 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 6800 2600 50  0001 C CNN
F 3 "~" H 6800 2600 50  0001 C CNN
	1    6800 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 6154DE3B
P 6250 3050
F 0 "C5" H 6250 3150 40  0000 L CNN
F 1 "0.1u" V 6400 2850 40  0000 L CNN
F 2 "my:SMD-0805" H 6288 2900 30  0001 C CNN
F 3 "" H 6250 3050 60  0000 C CNN
	1    6250 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 6154E6DE
P 6500 3300
F 0 "#PWR016" H 6500 3300 30  0001 C CNN
F 1 "GND" H 6500 3230 30  0001 C CNN
F 2 "" H 6500 3300 60  0000 C CNN
F 3 "" H 6500 3300 60  0000 C CNN
	1    6500 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2800 6500 2800
Wire Wire Line
	6250 2800 6250 2900
Wire Wire Line
	6500 2900 6500 2800
Connection ~ 6500 2800
Wire Wire Line
	6500 2800 6250 2800
$Comp
L power:GND #PWR015
U 1 1 615565CF
P 6250 3300
F 0 "#PWR015" H 6250 3300 30  0001 C CNN
F 1 "GND" H 6250 3230 30  0001 C CNN
F 2 "" H 6250 3300 60  0000 C CNN
F 3 "" H 6250 3300 60  0000 C CNN
	1    6250 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3300 6250 3250
Wire Wire Line
	6500 3300 6500 3200
Wire Wire Line
	6250 2800 6250 1900
Connection ~ 6250 2800
Wire Wire Line
	5600 1900 5550 1900
Wire Wire Line
	5550 1900 5550 2300
Wire Wire Line
	4600 2300 5250 2300
Connection ~ 5550 2300
Wire Wire Line
	5550 2300 5550 2800
Wire Wire Line
	5900 2200 5900 2250
Wire Wire Line
	5600 3500 5750 3500
Wire Wire Line
	5550 3550 5900 3550
$Comp
L Device:LED D1
U 1 1 61569DE1
P 3950 3050
F 0 "D1" V 4000 3200 50  0000 R CNN
F 1 "LED" V 3900 3250 50  0000 R CNN
F 2 "my:SMD-0805" H 3950 3050 50  0001 C CNN
F 3 "~" H 3950 3050 50  0001 C CNN
	1    3950 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 6156CD5A
P 3950 2700
F 0 "R1" V 4030 2700 40  0000 C CNN
F 1 "1k" V 3957 2701 40  0000 C CNN
F 2 "my:SMD-0805" V 3880 2700 30  0001 C CNN
F 3 "" H 3950 2700 30  0000 C CNN
	1    3950 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	3950 2900 3950 2850
Wire Wire Line
	3950 2500 4600 2500
Wire Wire Line
	5750 2900 5750 2950
$Comp
L power:VDD #PWR013
U 1 1 54986F7D
P 5750 2900
F 0 "#PWR013" H 5750 3000 30  0001 C CNN
F 1 "VDD" H 5750 3010 30  0000 C CNN
F 2 "" H 5750 2900 60  0000 C CNN
F 3 "" H 5750 2900 60  0000 C CNN
	1    5750 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1900 3950 1950
$Comp
L power:VDD #PWR01
U 1 1 54987690
P 3950 1900
F 0 "#PWR01" H 3950 2000 30  0001 C CNN
F 1 "VDD" H 3950 2010 30  0000 C CNN
F 2 "" H 3950 1900 60  0000 C CNN
F 3 "" H 3950 1900 60  0000 C CNN
	1    3950 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1900 6250 1900
Wire Wire Line
	5450 2500 6100 2500
Wire Wire Line
	5450 2600 6600 2600
Wire Wire Line
	5450 2700 6600 2700
Wire Wire Line
	6250 3250 6100 3250
Wire Wire Line
	6100 3250 6100 2500
Connection ~ 6250 3250
Wire Wire Line
	6250 3250 6250 3200
Connection ~ 6100 2500
Wire Wire Line
	6100 2500 6600 2500
$Comp
L Device:LED D2
U 1 1 61599F96
P 5400 1900
F 0 "D2" V 5500 2000 50  0000 R CNN
F 1 "LED" V 5500 1900 50  0000 R CNN
F 2 "my:SMD-0805" H 5400 1900 50  0001 C CNN
F 3 "~" H 5400 1900 50  0001 C CNN
	1    5400 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 6159A252
P 5400 2100
F 0 "#PWR010" H 5400 2100 30  0001 C CNN
F 1 "GND" H 5400 2030 30  0001 C CNN
F 2 "" H 5400 2100 60  0000 C CNN
F 3 "" H 5400 2100 60  0000 C CNN
	1    5400 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2250 4450 2800
Wire Wire Line
	3950 2550 3950 2500
$Comp
L my:INA226 IC2
U 1 1 615A30F6
P 5050 4050
F 0 "IC2" H 5050 4497 60  0000 C CNN
F 1 "INA226" H 5050 4391 60  0000 C CNN
F 2 "Housings_SSOP:MSOP-10_3x3mm_Pitch0.5mm" H 5050 3900 60  0001 C CNN
F 3 "" H 5050 3900 60  0000 C CNN
	1    5050 4050
	1    0    0    -1  
$EndComp
NoConn ~ 4650 4050
$Comp
L Device:C C3
U 1 1 615A7CD7
P 5650 4500
F 0 "C3" H 5650 4600 40  0000 L CNN
F 1 "0.1u" V 5800 4300 40  0000 L CNN
F 2 "my:SMD-0805" H 5688 4350 30  0001 C CNN
F 3 "" H 5650 4500 60  0000 C CNN
	1    5650 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 615A8A26
P 5650 4750
F 0 "#PWR012" H 5650 4750 30  0001 C CNN
F 1 "GND" H 5650 4680 30  0001 C CNN
F 2 "" H 5650 4750 60  0000 C CNN
F 3 "" H 5650 4750 60  0000 C CNN
	1    5650 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4250 5650 4250
Wire Wire Line
	5650 4250 5650 4350
Wire Wire Line
	5650 4650 5650 4700
Wire Wire Line
	5650 4700 5500 4700
Wire Wire Line
	5500 4700 5500 4150
Wire Wire Line
	5500 4150 5450 4150
Connection ~ 5650 4700
Wire Wire Line
	5650 4700 5650 4750
$Comp
L power:VDD #PWR011
U 1 1 615ACB90
P 5650 4200
F 0 "#PWR011" H 5650 4300 30  0001 C CNN
F 1 "VDD" H 5650 4310 30  0000 C CNN
F 2 "" H 5650 4200 60  0000 C CNN
F 3 "" H 5650 4200 60  0000 C CNN
	1    5650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4200 5650 4250
Connection ~ 5650 4250
Wire Wire Line
	5550 2900 5550 3550
Wire Wire Line
	5600 3500 4550 3500
Wire Wire Line
	4550 3500 4550 4150
Wire Wire Line
	4550 4150 4650 4150
Connection ~ 5600 3500
Wire Wire Line
	5550 3550 4500 3550
Wire Wire Line
	4500 3550 4500 4250
Wire Wire Line
	4500 4250 4650 4250
Connection ~ 5550 3550
$Comp
L power:GND #PWR05
U 1 1 615B36EB
P 4400 4350
F 0 "#PWR05" H 4400 4350 30  0001 C CNN
F 1 "GND" H 4400 4280 30  0001 C CNN
F 2 "" H 4400 4350 60  0000 C CNN
F 3 "" H 4400 4350 60  0000 C CNN
	1    4400 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3850 4400 3850
Wire Wire Line
	4400 3850 4400 3950
Wire Wire Line
	4650 3950 4400 3950
Connection ~ 4400 3950
Wire Wire Line
	4400 3950 4400 4350
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 6187FF12
P 4200 2600
F 0 "J1" H 4300 2600 50  0000 C CNN
F 1 "Conn_01x01" H 4118 2466 50  0001 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Big" H 4200 2600 50  0001 C CNN
F 3 "~" H 4200 2600 50  0001 C CNN
	1    4200 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	5250 2250 5250 2300
Connection ~ 5250 2300
Wire Wire Line
	5250 2300 5550 2300
Wire Wire Line
	5250 1700 5400 1700
Wire Wire Line
	5400 1700 5400 1750
Wire Wire Line
	5400 2050 5400 2100
Wire Wire Line
	5250 1700 5250 1950
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 61891FA4
P 4200 2750
F 0 "J2" H 4300 2750 50  0000 C CNN
F 1 "Conn_01x01" H 4118 2616 50  0001 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Big" H 4200 2750 50  0001 C CNN
F 3 "~" H 4200 2750 50  0001 C CNN
	1    4200 2750
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 6189220B
P 4200 2900
F 0 "J3" H 4300 2900 50  0000 C CNN
F 1 "Conn_01x01" H 4118 2766 50  0001 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Big" H 4200 2900 50  0001 C CNN
F 3 "~" H 4200 2900 50  0001 C CNN
	1    4200 2900
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 6189248C
P 4200 3050
F 0 "J4" H 4300 3050 50  0000 C CNN
F 1 "Conn_01x01" H 4118 2916 50  0001 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Big" H 4200 3050 50  0001 C CNN
F 3 "~" H 4200 3050 50  0001 C CNN
	1    4200 3050
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 618926AF
P 4200 3200
F 0 "J5" H 4300 3200 50  0000 C CNN
F 1 "Conn_01x01" H 4118 3066 50  0001 C CNN
F 2 "Measurement_Points:Measurement_Point_Square-SMD-Pad_Big" H 4200 3200 50  0001 C CNN
F 3 "~" H 4200 3200 50  0001 C CNN
	1    4200 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 2600 4400 2600
Wire Wire Line
	4650 2700 4600 2700
Wire Wire Line
	4600 2700 4600 2750
Wire Wire Line
	4600 2750 4400 2750
Wire Wire Line
	4650 2900 4400 2900
Wire Wire Line
	4650 3000 4550 3000
Wire Wire Line
	4550 3000 4550 3050
Wire Wire Line
	4550 3050 4400 3050
Wire Wire Line
	4650 3100 4400 3100
Wire Wire Line
	4400 3100 4400 3200
$Comp
L Device:R R8
U 1 1 618A1CC0
P 6600 4000
F 0 "R8" V 6680 4000 40  0000 C CNN
F 1 "0.025" V 6607 4001 40  0000 C CNN
F 2 "Resistors_SMD:R_2512" V 6530 4000 30  0001 C CNN
F 3 "" H 6600 4000 30  0000 C CNN
	1    6600 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:R R6
U 1 1 618A2886
P 6400 3800
F 0 "R6" V 6480 3800 40  0000 C CNN
F 1 "10" V 6407 3801 40  0000 C CNN
F 2 "my:SMD-0805" V 6330 3800 30  0001 C CNN
F 3 "" H 6400 3800 30  0000 C CNN
	1    6400 3800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 618A2DBA
P 6400 4200
F 0 "R7" V 6480 4200 40  0000 C CNN
F 1 "10" V 6407 4201 40  0000 C CNN
F 2 "my:SMD-0805" V 6330 4200 30  0001 C CNN
F 3 "" H 6400 4200 30  0000 C CNN
	1    6400 4200
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C4
U 1 1 618A3197
P 6200 4000
F 0 "C4" H 6200 4100 40  0000 L CNN
F 1 "0.1u" V 6350 3950 40  0000 L CNN
F 2 "my:SMD-0805" H 6238 3850 30  0001 C CNN
F 3 "" H 6200 4000 60  0000 C CNN
	1    6200 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 618A3765
P 7100 3950
F 0 "J7" H 7180 3942 50  0000 L CNN
F 1 "Vin/Vout(3.3V)" H 6900 4100 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 7100 3950 50  0001 C CNN
F 3 "~" H 7100 3950 50  0001 C CNN
	1    7100 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3850 5550 3850
Wire Wire Line
	5550 3850 5550 3800
Wire Wire Line
	5550 3800 6200 3800
Wire Wire Line
	6200 3850 6200 3800
Connection ~ 6200 3800
Wire Wire Line
	6200 3800 6250 3800
Wire Wire Line
	6550 3800 6600 3800
Wire Wire Line
	6600 3800 6600 3850
Wire Wire Line
	6600 3800 6800 3800
Wire Wire Line
	6800 3800 6800 3950
Wire Wire Line
	6800 3950 6900 3950
Connection ~ 6600 3800
Wire Wire Line
	6000 3950 6000 4200
Wire Wire Line
	6000 4200 6200 4200
Wire Wire Line
	5450 3950 6000 3950
Wire Wire Line
	6200 4150 6200 4200
Connection ~ 6200 4200
Wire Wire Line
	6200 4200 6250 4200
Wire Wire Line
	6550 4200 6600 4200
Wire Wire Line
	6600 4200 6600 4150
Wire Wire Line
	6600 4200 6800 4200
Wire Wire Line
	6800 4200 6800 4050
Wire Wire Line
	6800 4050 6900 4050
Connection ~ 6600 4200
Wire Wire Line
	5900 4050 5900 4300
Wire Wire Line
	5900 4300 6600 4300
Wire Wire Line
	6600 4300 6600 4200
Wire Wire Line
	5450 4050 5900 4050
$Comp
L Device:R R3
U 1 1 61599DD8
P 5250 2100
F 0 "R3" V 5330 2100 40  0000 C CNN
F 1 "1k" V 5257 2101 40  0000 C CNN
F 2 "my:SMD-0805" V 5180 2100 30  0001 C CNN
F 3 "" H 5250 2100 30  0000 C CNN
	1    5250 2100
	-1   0    0    1   
$EndComp
$EndSCHEMATC
