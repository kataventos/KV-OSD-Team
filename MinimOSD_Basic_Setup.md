# MinimOSD Basic Setup #

This guide will show you how to setup the MinimOSD board with KV Team OSD firmware version [r345](https://code.google.com/p/rush-osd-development/source/detail?r=345).


## Required: ##

  * FTDI adapter. If you do not have a FTDI adapter but have another Arduino you may be able to use it instead.
  * [Arduino 1.0 or higher](http://arduino.cc/en/main/software)
  * [KV Team OSD Firmware and GUI](http://code.google.com/p/rush-osd-development/downloads/list)
  * Minim OSD board
  * MultiWii Flight Controller with MultiWii V2.2 version.
  * NOTE: Some boards will require to clear the EEPROM (download available in downloads section)
<a href='Hidden comment: 
==Optional:==
* [http://processing.org/download/ Processing] *Note:* Even if you have a 64bit system you must download the 32bit version of processing.  Serial communication is not available with the 64bit version.
* [http://www.sojamo.de/libraries/controlP5/ ControlP5 Processing Library]
'></a>

# Instructions: #
<a href='Hidden comment: 
* Before installing this firmware you should first update the character map on the MinimOSD board.  For instructions on how to do that [http://code.google.com/p/rush-osd-development/wi#ki/Character_Map_Upload see the Character Map Upload wiki page]. *Note: if you have used the Rush KV Firmware before and are updating to a newer version you will still likely have to update the character map.*


==Modify the Configuration File :==
With the current release there are still a few variables which cannot be updated via the GUI, you may wish to make changes to them in the config.h file.  *You should read the instructions below first to determine if you need to complete this step or not.*
* Unzip the KV Team firmware and open the file "KV_Team_OSD.ino" with Arduino 1.0+

* Near the top of the Arduino window will be several tabs, one will say "Config.h", click on that tab.
* The first settings will only be used if you are using a hardware current sensor.  Scroll down to the "**** Amperage" **** section of the code and follow the configuration instructions found there.  The instructions are quite well documented in the code.
* Now scroll down to the "****   Display Settings ****" Section:
* Change your decimal point character if you prefer ( . or , ).
* Now scroll down to the "****   MSP Options and compatibility ****" Settings:
* Comment out #define BOX_OSD_SWITCH (by adding "//" before the line) if you want to use the landing light switch to turn on/off your OSD center of screen instead of the OSD switch.
* Now scroll down to the "****   For Sensors presence ****" Section:
* Define any sensors you may have and comment out any you don"t.
* If you don"t know what to do here just leave it the same, you shouldn"t have to make changes here.
* If you made any changes, save your file (Ctrl+S).
'></a>
## Upload the Firmware to the MinimOSD board: ##

  * You are now ready to upload the firmware to the board. Connect your OSD board to your FTDI adapter and your FTDI adapter to your computer as seen in the image below. Typically the FTDI adapter will have a 6 pin connector that fits right on your OSDs 6 pin connector.  If that is not the case at the minimum to connect your FTDI adapter to your OSD you will have to connect:
    1. The GRN pins on both devices together
    1. The +5V pins on both devices together
    1. Rx on the OSD to Tx on the FTDI
    1. Tx on the OSD to Rx on FTDI
    1. The pins labeled GND, CTS, and BLK are all ground pins and at least one on each device must be connected to at least one on the other device.
> Please note that some FTDI adapters may have their Rx and Tx pins labeled backwards, if you can't get your sketch to upload try swapping the Tx and Rx pins on one device.  ![https://lh4.googleusercontent.com/-Btbq2ecLIdg/UQLeTsL_u8I/AAAAAAAAHQ4/qHpHMWraYC0/s1540/ftdi.png](https://lh4.googleusercontent.com/-Btbq2ecLIdg/UQLeTsL_u8I/AAAAAAAAHQ4/qHpHMWraYC0/s1540/ftdi.png)
> > [Click Here for full size image](https://lh4.googleusercontent.com/-Btbq2ecLIdg/UQLeTsL_u8I/AAAAAAAAHQ4/qHpHMWraYC0/s1540/ftdi.png)

  * On your computer open the "KV\_Team\_OSD.ino" file that you downloaded earlier.  Use the Arduino program to open this file.
  * Click the "Tools" drop down menu and choose "Board >" select "Arduino Pro or Pro Mini (5V,16MHz) w/ATmega328"
  * Click the "Tools" drop down menu and choose "Serial Port >" There will likely only be one port available, if so select it.  If there are multiple ports you may have to try them all.
  * Click the "File" drop down menu and choose "Upload".
  * The blue horizontal bar at near bottom of the screen will read "Compiling Sketch" and then "Uploading", once it is complete it will read "Done uploading.", make sure there are no errors in red text below the blue bar, even if it says "Done uploading"!
  * You can close Arduino now but do not unplug your OSD board or FTDI connector yet as they will be used in the next step.

## Connect to GUI (graphical user interface): ##
<a href='Hidden comment: 
* *Advanced:* If you wish to tweak the GUI to your liking you may open the "KV_Team_OSD_GUI.pde" file with Processing (*Note:* serial communication only works with the 32bit version of Processing).  You will also need to install the ControlP5 library in order to run the Processing sketch.
'></a>
  * To open the GUI in Windows XP/Vista/7 open the GUI folder and then open the "application.windows32" folder.  **Do not use the windows64 version, it does not work, even on 64bit computers!**  Run the "KV\_Team\_OSD\_GUI.exe".  A new window should open, it will look like the image below, this is the KV Team OSD GUI:

> https://lh4.googleusercontent.com/-DOGJkTv8V88/UTKaGKtuIbI/AAAAAAAAHwI/0IZkoS81YeY/s1006/r340GUI.PNG
> > [Click Here for full size image](https://lh4.googleusercontent.com/-DOGJkTv8V88/UTKaGKtuIbI/AAAAAAAAHwI/0IZkoS81YeY/s1006/r340GUI.PNG)
  * The first thing to do is open the COM port that your OSD board is connected to, this will be the same COM port you used to upload the firmware in Arduino.  Select it from the menu near the top left of the GUI.
> > In the bottom left of the GUI you must now click:
  * **1- press RESET button;**
  * **2- press the RESTART button.**

  * Your OSD board should now be connected to the computer and ready to setup.
<a href='Hidden comment: 
if you connect the OSD"s video output to a screen you should see the OSD with values generated by the "Simulator Controls" section of the GUI.
'></a>

<a href='Hidden comment: 
==Font Tools:==
With the latest firmware version you can now upload new fonts (character maps) directly to the OSD board through the GUI.  You can also edit/create your own character maps.
*If you are having issues uploading a font you can try using the old method [http://code.google.com/p/rush-osd-development/wiki/Character_Map_Upload found here].*
* Before your OSD will work properly you must update the font.  If you have used the KV Team OSD Firmware before and are updating to a newer version you will still likely have to update the font.
* To update the font click the "BROWSE" button and select the "MW_OSD_Team.mcm" file (in the KV_Team_OSD_GUI folder), now click "SEND" button.  This will send the default font to the OSD board. To upload a custom font click the "BROWSE" button and select the .mcm file you want.  Now click "SEND".
* To edit a font click "Edit Font".  A new window will open.  Select a character to edit and it will appear much larger on the right.  Click any of the squares to change their color (grey = transparent), click again to change the color again.  After editing each character click the "SAVE" button.  Your edited font will be saved in the same directory as "Custom_KV_MCM.mcm"
'></a>


## Configure your OSD via the GUI: ##


> At this point you should use the GUI to configure the OSD to your liking.
  * **Note: when turning features on and off with the blue switches:** light blue to the right indicates the setting is OFF where as light blue to the left indicates the setting is ON.
> > ![https://lh4.googleusercontent.com/-1Szt9wkkJeE/UR9AuHLCtGI/AAAAAAAAHfo/zKuJCGvqA_k/s71/off-on.png](https://lh4.googleusercontent.com/-1Szt9wkkJeE/UR9AuHLCtGI/AAAAAAAAHfo/zKuJCGvqA_k/s71/off-on.png)
  * **Note:** when adjusting variables such as "RSSI Min", they should be adjusted on your config page 4 with your sticks. For maximum value select directly, for minimum value select and turn off your radio until the time out is over.

> ### Board Type: ###
    * Select "Rush" if you are using a Rushduino OSD board.
    * Select "Minim" if you are using a MinimOSD board.
> ### RSSI: ###
    * RSSI Min: set your minimum RSSI value (typically the RSSI value for when your transmitter is turned off).
    * RSSI Max: set your maximum RSSI value.
    * Display RSSI: show/hide RSSI value on the OSD.
> ### Main Voltage: ###
    * Display Voltage:  show/hide the flight battery voltage on the OSD.
    * Voltage Min: This is the voltage level at which the voltage readout on the OSD will begin to flash, alerting you of low battery voltage.  **Note:** 90 = 9V,  105 = 10.5V
    * Battery Cells: Number of cells in your LiPo flight battery pack.
    * Main Voltage Divider: ratio at which to divide the analog input which measures your flight battery's voltage.
    * Main Voltage MW: Show the main voltage reading being sent to the OSD board from the MultiWii board instead of having the OSD board read the voltage directly from the battery.
> ### Amperage: ###
    * Display Amperage: show/hide the number of amps currently being consumed (if external ammeter is connected).
    * Display Amperage Used: show/hide the number of amps(in mAh) which have been used. This function works even without a ammeter conected, it use automatically POWERMETER if you use VBAT from your flight controller, on config.h you have a define to fine tune it.
> ### Video Voltage: ###
    * Display Video Voltage: show/hide the secondary video system battery voltage on the OSD.
    * Video Voltage Divider: ratio at which to divide the analog input which measures your video battery's voltage.
    * Video Voltage MW: Show the video voltage reading being sent to the OSD board from the MultiWii board instead of having the OSD board read the voltage directly from the battery.
> ### Temperature ###
    * Display Temperature: show/hide the temperature value on the OSD.
    * Temperature Max: set the maximum temperature value.
> ### GPS: ###
    * Display GPS: show/hide GPS information on the OSD.
    * Display GPS Coords: show/hide current GPS coordinates on the OSD.
    * Display Heading: show/hide the current heading direction on the OSD.  **Note:** does not require GPS, can be used with just magnetometer connected to MultiWii.
    * Display Heading 360: sets starting heading as 0°.
> ### Other: ###
    * Units: pick either Metric (m, km, etc...) or Imperial (feet, miles, etc...).
    * Video Signal: pick the one that corresponds to your video system, NTSC or PAL.
    * Display Throttle Position: shows throttle position as a percent on the OSD.
    * Display Horizon Bar: show/hide cross-hair in center of OSD.
    * Display Horizon Side Bars: show/hide the vertical bars on either side of the virtual horizon bar.
    * Display Battery Evo: ---
    * Reset Stats After Arm: Reset the current flight statistics each time the MultiWii system is armed.
    * Enable OSD Read ADC: enable the OSD board's analog-to-digital converter.
    * RSSI over MW: Show the RSSI reading being sent to the OSD board from the MultiWii board instead of having the OSD board read the RSSI value from the RC receiver directly.
## Save Your Configuration: ##
  * Once you are happy with your settings you can save them to your OSD board by pressing the "WRITE" button in the "OSD Controls" section (lower left).  You may also wish to save a copy of your configuration to your computer, to do this press the "SAVE" button (top left).
  * If you wish to change your configuration later simply reattach the OSD board via the FTDI adapter to your computer, select the COM port as before, and press the "READ" button in the "OSD Controls" section (lower left).  Your previous settings will be read from the OSD board and you can make any changes you wish, then press the "WRITE" button again.
## Simulator Controls: ##
![https://lh6.googleusercontent.com/-432KXyu3KlM/UTKaFiRHdeI/AAAAAAAAHwA/HG5_z5zj3v8/s680/r340GUIsim.png](https://lh6.googleusercontent.com/-432KXyu3KlM/UTKaFiRHdeI/AAAAAAAAHwA/HG5_z5zj3v8/s680/r340GUIsim.png)
> The KV Team OSD GUI comes with a MultiWii simulator which allows you to send values to your OSD board via serial connection, the same way a MultiWii board does.  This lets you simulate MultiWii data to see how it will be displayed on the OSD without having to connect it to a MultiWii board and go flying around.
  * **Note:** In order to have your simulator working correctly with current version you will need to use **BOXNAMES** and press save, now, before you connect it again to your flight controller you have to switch it off and save or you will not have a fully functional OSD**.**


<a href='Hidden comment: 
===Sensors 1:===
* ALT: allows you to set the simulated altitude (click and drag to change).
* VARIO: set the simulated climb/descent rate.
* VBAT: set the simulated battery voltage.
* RSSI: set the simulated RSSI value.
===GPS:===
* GPS Fix: select to simulate a GPS 3D fix.
* SATS: set the number of simulated GPS satellites connected.
* ALT-CM: set the simulated altitude (in cm).
* SPEED-CM/S: set the simulated speed (in cm/second).
* DIST HOME-M: set the simulated distance to home position (in meters).
* HEAD HOME: set the simulated heading back to your home position, adjust the value by clicking and dragging left/right.
'></a>
> ### Radio: ###
    * This section contains two boxes, each has a cross-hair.  You can click and drag the center of the cross-hair to simulate the positions of your RC transmitter sticks.
<a href='Hidden comment: 
===Angle/Heading:===
* Roll Pitch: set the simulated roll/pitch of your aircraft by dragging the cross-hair around.
* Heading: set the simulated heading, adjust the value by clicking and dragging right/left.
'></a>
> ### Modes: ###
    * Modes: set the simulated MultiWii modes.


## Font Tools: ##
With the latest firmware version you can now upload new fonts (character maps) directly to the OSD board through the GUI.  You can also edit/create your own character maps.

  * **Before your OSD will work properly you must update the font.**  If you have used the KV Team OSD Firmware before and are updating to a newer version you will still likely have to update the font.
  * To update the font click the "UPLOAD" button.  This will send the default font to the OSD board. To upload a custom font click the "BROWSE" button and select the .mcm file you want.  Now click "UPLOAD".

  * **NOTE**: every Minim OSD´s need to have the MAX7456 part of the board powered for a successful upload, some don´t have the solder jumper to be powered by the FTDI and need the 12v during this process.

  * To edit a font click "Edit Font".  A new window will open.  Select a character to edit and it will appear much larger on the right.  Click any of the squares to change their color (grey = transparent), click again to change the color again.  After editing each character click the "SAVE" button.  Your edited font will be saved in the same directory as your executable file on the data folder.

## Connect to MultiWii: ##

> To connect your MinimOSD board to your MultiWii flight controller's serial port you will need a 4 wire cable.  Your MultiWii should have a serial port on it which will have 4 pins labeled Tx, Rx, VCC(+5V), and GND (ground).  Your MultiWii may also have a 6 pin port labeled FTDI, this will work too but you only need to connect the four Tx, Rx, VCC(+5V), and GND (ground) pins (if you connect all 6 pins it will still work fine too).  Connect these four pins to your Minim OSD the same way you did before when you uploaded the firmware via the FTDI cable.  If it does not work properly try switching the Tx and Rx cables.
    1. The +5V pins on both devices together
    1. Rx on the OSD to Tx on the MultiWii
    1. Tx on the OSD to Rx on MultiWii
    1. The pins labeled GND, CTS, and BLK are all ground pins and at least one on each device must be connected to at least one on the other device.

> ` `**Note: Your MinimOSD must be connected to your MultiWii flight controller before it will work!**  Do not try and test it before making the serial connection, it will not work.

> Connect your video in and ground lines to their respective pins on the MinimOSD and your video out and ground line from the MinimOSD to your video transmitter's respective inputs.  If you have not done the 5V modification (recommended) and want to use separated batterie to video/camera you need common ground.

> This concludes the basic setup. You should now have a working OSD.

> For more advanced setup and tuning please see the [OSD Pages User Manual](http://code.google.com/p/rush-osd-development/wiki/OSD_pages_User_manual) on the wiki.

## Done! ##