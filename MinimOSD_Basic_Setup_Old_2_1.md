# MinimOSD Basic Setup #

This guide will show you how to setup the MinimOSD board with Rush KV firmware version 2.1

## Required: ##

  * FTDI adapter. If you do not have a FTDI adapter but have another Arduino you may be able to use it instead.
  * [Arduino 1.0 or higher](http://arduino.cc/en/main/software)
  * [Rush KV 2.1 Firmware](http://code.google.com/p/rush-osd-development/downloads/detail?name=Rush_KV_2_1.zip&can=2&q=)
  * Minim OSD board

# Instructions: #

  * Before installing this firmware you should first update the character map on the MinimOSD board.  For instructions on how to do that [see the Character Map Upload wiki page](http://code.google.com/p/rush-osd-development/wi#ki/Character_Map_Upload).

## Modify the Configuration File: ##

  * Unzip the Rush KV 2.1 firmware and open the file "Rush\_KV\_2\_1.ino" with Arduino 1.0+
  * Near the top of the Arduino window will be several tabs, one will say "Config.h", click on that tab.
  * By default the Rushduino board is selected but we want to use the MinimOSD board.  To do that remove the two slashes from line 10 which reads "//#define MINIMOSD" and add two slashes in front of line 11 which says "#define RUSHDUINO".  Your code should now look like the code below:
```
/***************   Define your OSD Board   ***************/

#define MINIMOSD
//#define RUSHDUINO 
```
> This is how you will change any of the settings in this configuration file.  The setting without the "//" in front of it is the one that will be active, the setting with the "//" will be the one that is disabled. Adding the "//" before a line is called 'commenting out' the line.
  * Below that in the "Video System" section of the code you may wish to change the default PAL to the NTSC setting if that is what your system uses, to do that do the same as you did before; add "//" before lines 15 and 16 and remove them from lines 18 and 19.  If you do this your code should now look like this:
```
/***************  Video System  ***************/

//#define VideoSignalType_PAL
//const char videoSignalType=1;

#define VideoSignalType_NTSC
const char videoSignalType=0;
```
  * If you are using a version of MultiWii **greater than** 2.1 you shouldn't have to change anything in the "Mode Active" section of the code however you should still confirm that these values are correct as per the instructions in the code.  If you are using MultiWii version 2.1 or older you must make sure lines 33 **to** 40 are commented out with "//" then remove the `"*/"` from line 42 and the `"/*"` from line 50.  If you have MultiWill 2.1 or less your code should now look like this:
```
/***************  Mode Active (you MUST define according your MWC options)  ***************/
/*
Only MWii version newer than 2.1 (including dev versions)
How to config correctly the Mode active in order to show sensors and Arm/Disarm indication:
-) Take a look at "MultiWii.ino" file of MWii sketch in "enum box...."
-) Assign a power of 2 for each sensor/device defined in MWii "config.h" skipping sensor/devices not defined.
-) These found numbers are to be defined here....
*/
//#define STABLEMODE     1            // OK
//#define BAROMODE       4            // OK
//#define MAGMODE        8            // OK
////#define BOXCAMSTAB     16         // not used
//#define ARMEDMODE      32           // OK
//#define GPSHOMEMODE    64           // OK
//#define GPSHOLDMODE    128          // OK
////#define BOXCAMTRIG     256        // not used


// MWii version 2.1 and older
#define STABLEMODE     1
#define BAROMODE       2
#define MAGMODE        4
#define ARMEDMODE      32
#define GPSHOMEMODE    64
#define GPSHOLDMODE    128

```
  * You may also want to make changes in the Display Settings and Sensor Presence sections to suit your setup.  This will be the same as the changes you have already made; add a "//" before a setting to disable it or ensure there is no "//" before a setting to enable it.
  * This should conclude the basic software configuration.  Save your file (Ctrl+S).

## Upload the Firmware to the MinimOSD board: ##

  * You are now ready to upload the firmware to the board. Connect your OSD board to your FTDI adapter and your FTDI adapter to your computer as seen in the image below. Typically the FTDI adapter will have a 6 pin connector that fits right on your OSDs 6 pin connector.  If that is not the case at the minimum to connect your FTDI adapter to your OSD you will have to connect:
    1. The GRN pins on both devices together
    1. The +5V pins on both devices together
    1. Rx on the OSD to Tx on the FTDI
    1. Tx on the OSD to Rx on FTDI
    1. The pins labeled GND, CTS, and BLK are all ground pins and at least one on each device must be connected to at least one on the other device.
> Please note that some FTDI adapters may have their Rx and Tx pins labeled backwards, if you can't get your sketch to upload try swapping the Tx and Rx pins on one device.  ![https://lh4.googleusercontent.com/-Btbq2ecLIdg/UQLeTsL_u8I/AAAAAAAAHQ4/qHpHMWraYC0/s1540/ftdi.png](https://lh4.googleusercontent.com/-Btbq2ecLIdg/UQLeTsL_u8I/AAAAAAAAHQ4/qHpHMWraYC0/s1540/ftdi.png)
  * On your computer open the "Rush\_KV\_2\_1.ino" file that you edited earlier with Arduino 1.0+
  * Click the "Tools" drop down menu and choose "Board >" select "Arduino Pro or Pro Mini (5V,16MHz) w/ATmega328"
  * Click the "Tools" drop down menu and choose "Serial Port >" There will likely only be one port available, if so select it.  If there are multiple ports you may have to try them all.
  * Click the "File" drop down menu and choose "Upload".
  * The blue horizontal bar at near bottom of the screen will read "Compiling Sketch" and then "Uploading", once it is complete it will read "Done uploading.", make sure there are no errors in red text below the blue bar, even if it says "Done uploading"!

## Connect to MultiWii ##

> To connect your MinimOSD board to your MultiWii flight controller's serial port you will need a 4 wire cable.  Your MultiWii should have a serial port on it which will have 4 pins labeled Tx, Rx, VCC(+5V), and GND (ground).  Your MultiWii may also have a 6 pin port labeled FTDI, this will work too but you only need to connect the four Tx, Rx, VCC(+5V), and GND (ground) pins (if you connect all 6 pins it will still work fine too).  Connect these four pins to your Minim OSD the same way you did before when you uploaded the firmware via the FTDI cable.  If it does not work properly try switching the Tx and Rx cables.
    1. The +5V pins on both devices together
    1. Rx on the OSD to Tx on the MultiWii
    1. Tx on the OSD to Rx on MultiWii
    1. The pins labeled GND, CTS, and BLK are all ground pins and at least one on each device must be connected to at least one on the other device.

> ` `**Note: Your MinimOSD must be connected to your MultiWii flight controller before it will work!**  Do not try and test it before making the serial connection, it will not work.

> Connect your video in and ground lines to their respective pins on the MinimOSD and your video out and ground line from the MinimOSD to your video transmitter's respective inputs.  If you have not done the 5V modification (recommended) you will also have to connect 12V to one of the 12V pins on the MinimOSD for it to work properly.

> This concludes the basic setup. You should now have a working OSD.

> For more advanced setup and tuning please see the [OSD Pages User Manual](http://code.google.com/p/rush-osd-development/wiki/OSD_pages_User_manual) on the wiki.

## Done! ##