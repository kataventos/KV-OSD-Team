It is not advised to use 12v to power the video side, not only because you do not need it at all,  but because it may cause several other problems/malfunctions mainly during the character map upload. Another reason is when you’re using a LRS (Long Range systems) operating on UHF (433Mhz). It is known that the switching regulator on the analog side of the MinimOSD (normally responsible for reducing the voltage to 5V) is making noise on 433Mhz, wich will reduce the range of your RC link.

# Required #

**Hardware**

![https://lh3.googleusercontent.com/-gu0M0N68zyA/URFMd_kNRmI/AAAAAAAAAM0/RYOfTvs0Lp8/w1358-h256-no/ftdi.png](https://lh3.googleusercontent.com/-gu0M0N68zyA/URFMd_kNRmI/AAAAAAAAAM0/RYOfTvs0Lp8/w1358-h256-no/ftdi.png)

**Software**


  * [KVTeam up to date Software](http://code.google.com/p/rush-osd-development/downloads/list)
  * KVTeam GUI and font map (inside every release folder)

**Note: These instructions can be used with older versions but they are mostly for KVTeam 2.2 or above releases.**

It´s advised to plug your OSD for the first time with live video output and using a FTDI seated on your desk. You will notice that already have software installed.

# Configurable parameters on config.h #

Before upload the software to your OSD board you can configure the following parameters:

  * Baud Rate; **(Serial port speed)**
  * Calibration delay; **(Time off for calibration proposes)**
  * EEPROM write delay; **(Time off before write new adjustments to the MWii FC board)**
  * Decimal point character.

# Installation procedure #





  * 1 - **Upload the most up to date  [Official KVTeam Version](http://code.google.com/p/rush-osd-development/downloads/list) using Arduino IDE software** ;

Now you need to start your GUI, open the port assigned to your FTDI.

  * 2 - **Press RESET;**

On the FONT TOOLS board browse the character map (inside GUI data folder).

  * 3 - **Press UPLOAD.**


On KVT 2.2 GUI the font upload should take approximately 30 seconds to complete the task, at the end this is the screen you´l see (voltage and RSSI blinking):

  * **NOTE:** This process should put you up and running. If not, clear your EEPROM with this [sketch ](https://code.google.com/p/rush-osd-development/downloads/detail?name=EEPROM_Clear.zip)and repeat.

![https://lh5.googleusercontent.com/-1kAV0Tk1qoY/UrHruv1BdLI/AAAAAAAABV8/dOoUCWTwEUM/s520/Picture%25202.png](https://lh5.googleusercontent.com/-1kAV0Tk1qoY/UrHruv1BdLI/AAAAAAAABV8/dOoUCWTwEUM/s520/Picture%25202.png)