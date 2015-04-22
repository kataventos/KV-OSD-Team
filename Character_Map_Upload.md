# Introduction: #

Rushduino OSD and Minim OSD use the MAX7456 On-Screen Display chip.
This chip has an internal EEPROM that contains a kind of image called a character map that stores all the OSD's icons and characters within it.
The icons and characters that come with the MAX chip are not suitable for use with an OSD so KV Team  have created a new map with the team and MultiWii logo´s.

This new character map is what we need to upload to your OSD in order for it to display the proper characters and icons used by the KV Team OSD firmware, and is available on your downloaded dev zip file.


# Requirements: #

  * FTDI adapter.  If you do not have a FTDI adapter but have another Arduino you may be able to use it instead.

  * Max 7456 Font update\_1.0: http://rush-osd-development.googlecode.com/files/Max7456_Font_Update_1.0.zip

  * Real Term software: http://rush-osd-development.googlecode.com/files/Realterm_1-99-27.zip

  * Tera Term software: http://rush-osd-development.googlecode.com/files/TeraTerm.zip
> - **NOTE:**   If you use Windows 7 please use Tera Term.

  * Arduino 1.0 or higher: http://arduino.cc/en/main/software



# Instructions: #

  * **NOTE:**  To run the update properly the 12V side of your Minim board must also be powered if you have not already connected it to the 5V side of the board (which is recommended to prevent overheating).  If the 12V side is powered properly the LED on the board labeled "A PWR" will be lit.

## Arduino Instructions: ##
  * If you have a Minim OSD please uncomment it and comment the default Rushduino OSD.

```
//#define MINIMOSD
#define RUSHDUINO

```


  1. Connect your OSD board to your FTDI adapter and your FTDI adapter to your computer as seen in the image below. Typically the FTDI adapter will have a 6 pin connector that fits right on your OSDs 6 pin connector.  If that is not the case at the minimum to connect your FTDI adapter to your OSD you will have to connect: the GRN pins on both devices together, the +5V pins on both devices together, Rx on the OSD to Tx on the FTDI, and Tx on the OSD to Rx on FTDI.  The pins labeled GND, CTS, and BLK are all ground pins and at least one on each device must be connected to at least one on the other device.  Please note that some FTDI adapters may have their Rx and Tx pins labeled backwards, if you can't get your sketch to upload try swapping the Tx and Rx pins on one device.  ![https://lh4.googleusercontent.com/-Btbq2ecLIdg/UQLeTsL_u8I/AAAAAAAAHQ4/qHpHMWraYC0/s1540/ftdi.png](https://lh4.googleusercontent.com/-Btbq2ecLIdg/UQLeTsL_u8I/AAAAAAAAHQ4/qHpHMWraYC0/s1540/ftdi.png)
  1. Open "Max7456\_Font\_Update.ino" with Arduino 1.0 or higher.
  1. Click the "Tools" drop down menu and choose "Board >" select "Arduino Pro or Pro Mini (5V,16MHz) w/ATmega328"
  1. Click the "Tools" drop down menu and choose "Serial Port >" There will likely only be one port available if so select it.  If there are multiple ports you may have to try them all.
  1. Click the "File" drop down menu and choose "Upload".
  1. The blue horizontal bar at near bottom of the screen will read "Compiling Sketch" and then "Uploading", once it is complete it will read "Done uploading.", make sure there are no errors in red text below the blue bar!

## Real Term Instructions: ##
**Note:** do not use Real Term if you have Windows 7, use Tera Term.

  1. Open Real Term and go to the « PORT » tab ![https://lh5.googleusercontent.com/-Lrr-nGZ1gfs/UOYnIgL4-sI/AAAAAAAAAC4/BgOmQ4yH2Uc/s702/Real%2520term_1.jpg](https://lh5.googleusercontent.com/-Lrr-nGZ1gfs/UOYnIgL4-sI/AAAAAAAAAC4/BgOmQ4yH2Uc/s702/Real%2520term_1.jpg)
  1. Set the baud rate to 19200
  1. Choose your com port
  1. Go to the « Send » tab and choose the .mcn file ![https://lh5.googleusercontent.com/-SCmRFprfduM/UOYpJso0qVI/AAAAAAAAADg/0NXCcTPJLpo/s702/Real%2520term_2.jpg](https://lh5.googleusercontent.com/-SCmRFprfduM/UOYpJso0qVI/AAAAAAAAADg/0NXCcTPJLpo/s702/Real%2520term_2.jpg)
  1. Go back in the « Port » tab and click « OPEN » and « CHANGE » to open the com port
  1. Go back AGAIN into the « Send » tab and click « Send File » Wait for 100% done

## Tera Term Instructions: ##
> (Windows 7 compatible)

  1. Open Tera Term, it will prompt you to create a new connection.  Choose "Serial" (instead of default TCP/IP) and select the COM port your Minim is connected to, click OK.
  1. Click the "Setup" drop down menu and select "Serial port...", a new window will open.  In this window change "Baud rate" to 19200 then click OK.
  1. Click the "File" drop down menu and select "Send file...", select the Rushduino.mcm file you downloaded earlier.  Now click "Open".
  1. Tera Term will now send the character map update to the board, wait until it reports being 100% done.

# Re-Upload the KV Team OSD Firmware: #

The character map update is now complete but you must now re-upload the latest KV Team OSD firmware package to your MinimOSD board!  To do this get the latest update [from here](http://code.google.com/p/rush-osd-development/downloads/list) and use Arduino 1.0 or higher to upload it to your MinimOSD board via an FDTI adapter (Do this the same way you uploaded Max7456\_Font\_Update.ino to the Minim before.