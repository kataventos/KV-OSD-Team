**The Graphic User Interface is a powerful tool that will serve you uploading/editing the character map, configuring most of the OSD functions and capable to simulate with precise accuracy your MWii FC Board.**

KVTOSD 2.3 GUI  suffered major changes in order to make it smaller, faster and objective.



![https://lh5.googleusercontent.com/-Mu1HLmz3hfA/U2eMY91CUaI/AAAAAAAABmc/0b0DfgENc8k/s798/Picture%25201.png](https://lh5.googleusercontent.com/-Mu1HLmz3hfA/U2eMY91CUaI/AAAAAAAABmc/0b0DfgENc8k/s798/Picture%25201.png)

The actual version of the GUI have different colors for the adjustments on the configuration and edition board. Red for warnings and dark blue to all others, this will intuitively point you for security warnings/alarms. Check boxes are light blue as before.


# Control #

  * Allow you to save and load GUI configuration files;
  * Choose your FTDI port;
  * Show you port status activity;
  * Call Sign message control tool;
Here you can control the displayable message, by default is "TEAM\_KVOSD". You have available 10 characters to introduce your own "UNIQUE ID". It´s advised to use the exact 10 chars, if you have a shorter ID introduce the remaining with your SPACE (empty space) in order to center it on screen (eg, "  KVTEAM  ").

**Note:** To use it just type your message, press return and write it to the OSD. To turn it Off/On use OSD Menu.

  * Read from the OSD board EEPROM;
  * Reset to default EEPROM settings;
  * Write new values/options according your needs;
  * Restart the OSD

# Configuration and edition #

  * **OSD board type**

Here we differentiate two different boards Rushduino and Minim OSD´s. The only difference between them  are the pins used to control the MAX7456.

**RSSI**

  * RSSI signal
The input type can be both ADC using your OSD to collect data or MWii thru serial protocol.

  * PWM On/Off

  * PWM Divider

  * RSSI Minimum/Maximum
**NOTE:** This can be also configured using your RC radio on the field thru your OSD menu but I advise not to. Using the 100% with your radio On and 0% with it OFF will provide you inaccurate calculation.
I advise to memorize manually using the GUI function your minimum signal when you have at least between 15 and 20% real signal, this will give you a good error margin. Because I use 2.4 FRSky RX and TX I also have the RSSI on my 9x and I have them both pretty much synchronized regarding this matter.

  * RSSI alarm

This value continue to be in % and by default is set to 60%. When you reach this value your RSSI will blink on screen.

**Volume flight**

  * Volume distance Max (x100)
The distance default calculation is in meters and it is adjustable from 0 to 25000m. By default is set to 500m  (5\*100).

  * Volume altitude Max Can be set from 0 to 500m (Default is 25\*2=50m)
**NOTE:** Be aware that in most country´s, the allowed air space to RC models is up to 400m. Consult your area legislation.

  * Volume altitude Min  Can be set from 0 to 50m (Default  is 0m).

Minimum altitude warning will only be triggered after 60 seconds of flight. If you gave a minimum altitude greater then zero is because you want to fly avoiding any obstacles previously seen on your flying field. The time Off will let you start the flight and gain altitude without being warned.

Maximum altitude will be ready to warn you immediately.


**GPS settings**

  * GPS On/OFF;
  * GPS coordinates;
  * Heading 180º or 360º;
  * Max Volume. Here you can program warning for volume flight. By default it will trigger at 500m

**Main voltage**

  * ADC/MWii input type to collect data;
  * Number of battery cells;
  * Minimum voltage warning (default value is 105 and means 10.5v)
  * Divider ratio is where you adjust accurately the main voltage (works only using the ADC input).

Main voltage admits 2 to 6 cells Lipo´s and inherent minimum voltage can be set.

**Note:** 6s lipo´s can be connected using the wiki voltage dividers and available only on some OSD´s.



**Video voltage**

  * ADC/MWii input type to collect data;
  * Minimum voltage warning (default value is 105 and means 10.5v)
  * Divider ratio is where you adjust accurately the video voltage (works only using the ADC input).

Video voltage admits 2 to 3 cells Lipo´s and inherent minimum voltage can be set.

**Other functions**

  * Units
Metric/Imperial

  * Video signal
PAL/NTSC

  * Statistics at the end of the flight

Reset/Maintain (when motors are armed).

If you like you can fly two minutes and land to take a quick coffee and a cookie without disconnecting your battery, **Maintain** option will allow you to take off again and and statistics will be from both flights.

  * OSD ADC
On/Off

Whenever you want to use even one of the available OSD ADC input you have to turn this on, by default is On.

  * **BoxId´s/BoxNames**

This is mainly to continue supporting older MWii versions prior to BoxId´s implementation.
However if you need to use the simulator you need to check BoxNames in order to have it fully functional, the contrary will happen if you use MWii later or up to date versions, check BoxId´s.

Summary:
  * GUI Simulator/Older MWii = BoxNames;
  * MWii FC with later versions = BoxId´s. (Note: If you haven´t checked this, OSD will not work correctly)

  * Blink frequency

Alows you to configure the blink frequency as follows which affects all warnings/alarms less the Motor Armed function:
10=1Hz, 9=1.1Hz, 8=1,25Hz, 7=1.4Hz, 6=1.6Hz, 5=2Hz, 4=2,5Hz, 3=3,3Hz, 2=5Hz, 1=10Hz.

**Amperage**

  * ADC/MWii input type to collect data;
  * Sensitivity;

Simply set this value on GUI as is (20, 40, ...) according your sensor data sheet.

  * Offset High;
  * Offset Low;

**OFF-SET UNIDIRECTIONAL SENSOR:**
Set the HIGHT byte to zero (0)
Set the LOW byte with 0 or 1 or 2 ... in order to have zero Amp with No-LOAD always starting from 0 (zero) value and verify.
Usually  1 or 2 points are enough.

**OFF-SET BIDIRECTIONAL SENSOR:**
Set the HIGHT byte to 2 and LOW byte to 0 (Zero) Verify if the reading is very near to 0A.
If not set the LOW byte with 1 or 2... and verify if the reading go toward zero.
If the current reading still increasing this means OFFSET is too hight, so:
Set the HIGHT byte to 1 and LOW byte to 255 (Zero): And verify if the reading is very near to 0A.
If not set the LOW byte with 254 253 ...(decreasing it!) and verify if the reading go toward zero.

**["Inner" working and brief explanation about current sensing](http://code.google.com/p/rush-osd-development/wiki/Current_Sensing_Tutorial)**


**Font tools**

  * Edit font (edit the font map according your desire)
**Note:** The edition board will appear incomplete, you can move it´s place by pressing Option key and the mouse on the board label. In fact you can move all boards inside the main board using this method.

  * Upload font to the OSD
  * Browse font maps (**.mcm files)**

# Simulator #

This board simulates your MWii FCB and it´s useful to test all functions. To use it clic to expand/collapse. You need to have the GUI connected to your OSD with live video. Here we are using default unit only (meters) which is the unit sent by MWii.

  * **MWii sensors and ADC´s**
  * Altitude (Barometric sensor);
-100 to 1000m

  * Vario (Climbing rate);
-3 to 3m/second

  * Vbat (Battery data)
7 to  25.2volts

  * RSSI
0 to 1023 which corresponds to 0-100% signal

  * **Simulator control**
On/Off

  * **MWii GPS data**

  * GPS fix

  * Sats (number of acquired satellites)
0 to 15

  * Altitude
0 to 10000 cm

  * Speed
0 to 10000cm/second

  * Distance to home
0 to 1000m

  * **Heading home**
-180 to 180º

  * **RC radio control**
  * Throttle;
  * Yaw;
  * Pitch;
  * Roll.
To enter the OSD menu you can either press CTRL key or use the check box in order to maintain yaw position.

  * **Angle/Heading**
  * Roll
  * Pitch
Used to check/change the artificial horizon.

  * **Heading**
-180 to 180º (Magnetometer)

  * **Flight modes**

  * Arm/disarm motors;
  * Stable mode;
  * Horizon mode;

  * **Sensors checked**

  * Barometric;
  * Magnetometer;
  * GPS home (also change 3Dfix icon to go home)
  * GPS hold (also change to hold icon)

  * **OSD SW / SMART SW**
OSD sw is used to mask/manually clean the screen using a TX dedicated SW. SMART because functions and calculations will be active and ready to automatically report any critical data regarding GPS, RSSI and main voltage ([see wiki](http://code.google.com/p/rush-osd-development/wiki/Smart_SW?ts=1389134471&updated=Smart_SW)).