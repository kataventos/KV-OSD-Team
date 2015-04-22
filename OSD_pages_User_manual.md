This guide will show you how to use the on screen Configuration Menu and guide you through the functions of the pages it contains.


For this software to work your OSD must be properly connected to a functioning MultiWii flight controller via a serial connection.

> After entering on your Configuration Menu use your transmitter's sticks as follows:
  * **To navigate between pages and options use your Roll and Pitch**;
  * **To select or change options/values use your Yaw**.


# Introduction Screen and Main Page #

When you fire up the OSD you will have a **Introduction page** with the team logo, that **mainly tells you the  OSD / Multiwii software versions, and how to enter on the configuration menu**.



![https://lh3.googleusercontent.com/-R-RBfHz_-Hs/UP30fJJtSPI/AAAAAAAAAGE/s0y6Q7Ci03c/s632/Intro.png](https://lh3.googleusercontent.com/-R-RBfHz_-Hs/UP30fJJtSPI/AAAAAAAAAGE/s0y6Q7Ci03c/s632/Intro.png)


**After 4 seconds, you will see your main page/flight page.**

  * **NOTE** The image below shows every available option turned on.

  * This information can be selected by you using GUI, and configured after uploading with stick inputs.


![https://lh6.googleusercontent.com/-vEHW3hT1bPw/UP30f_t98pI/AAAAAAAAAGM/I6WNalcfEsU/s633/Main%2520Page_1.png](https://lh6.googleusercontent.com/-vEHW3hT1bPw/UP30f_t98pI/AAAAAAAAAGM/I6WNalcfEsU/s633/Main%2520Page_1.png)



# Configuration Menu and PID Adjustment 1/6 #


**As you saw on introduction screen, to enter on the configuration screen you will need to:**

  * Put your throttle in the middle, your yaw right and your pitch full (forward).

You now see your menu page 1/6 that will be used for PID adjustment.


![https://lh3.googleusercontent.com/-KmeU1JZdTjQ/UP30hpVrjuI/AAAAAAAAAGU/-LrV1fVT0gs/s632/Page%25201%253A6.png](https://lh3.googleusercontent.com/-KmeU1JZdTjQ/UP30hpVrjuI/AAAAAAAAAGU/-LrV1fVT0gs/s632/Page%25201%253A6.png)

After adjusting your PID´s you will have to save your new configuration with SAVE-EXIT, **but this new adjustments will not be saved to your FC EEPROM**, for that you will need to navigate to page 5/6 and select MW EEPROM WRITE.

  * **Why the two steps for saving ?**

  * Imagine that you make 3 adjustments, with flights between them  and at the end you decide that none of them are better than the settings you had before starting but you just can´t remember your original settings...  this way the only thing you need to do is to restart your multicopter and your original settings will be restored.
  * If however you are happy with your new settings, just do as told before and select MW EEPROM WRITE on page 5.



> # RC Tuning 2/6 #

On this page you can adjust your Multiwii rates, throttle ATT, see your actual cycle time and if you´re having I2C errors.

  * As before, **to save any adjustments to your FC EEPROM**, follow the same steps as for PID´s.


![https://lh4.googleusercontent.com/-gWVgKefY9aY/UP30kMbiKEI/AAAAAAAAAGc/DsRzgQ5XJlE/s632/Page%25202%253A6.png](https://lh4.googleusercontent.com/-gWVgKefY9aY/UP30kMbiKEI/AAAAAAAAAGc/DsRzgQ5XJlE/s632/Page%25202%253A6.png)


> # Display & Alarm 3/6 #

Here you can select information to be displayed on screen, as well as your alarms.

  * Adjust your voltage alarm for desired value, **ex. for 10.5V you need to have a value of 105.**
  * For temperature use your desired Unit value.

  * **GPS**: Turning Display GPS ON/OFF controls related information as well:

  * a) **GPS altitude will always be on screen when you have it ON**;
  * b) **Coordinates will only be on screen if you selected it on GUI**;

  * **If you select GPS OFF on this page, neither  will be displayed**.


![https://lh3.googleusercontent.com/-Abesn6zzyfo/UP30lZ4ALGI/AAAAAAAAAGk/EVE70ferKbE/s632/Page%25203%253A6.png](https://lh3.googleusercontent.com/-Abesn6zzyfo/UP30lZ4ALGI/AAAAAAAAAGk/EVE70ferKbE/s632/Page%25203%253A6.png)



> # Display 4/6 #


On this page you can find your RSSI values and change your Unit System.

**To get your RSSI on screen select ON and to adjust it do as follows:**

  * **With your RC TX close to your RX, select MAX**;
  * **To get your RSSI MIN, select it first and turn your TX off, wait for the count down to finish, done**.



![https://lh5.googleusercontent.com/-b2IB8kM_fCo/UQC1kCk4uaI/AAAAAAAAAHo/kWn7ApOOa6U/s632/Page%25204-6.png](https://lh5.googleusercontent.com/-b2IB8kM_fCo/UQC1kCk4uaI/AAAAAAAAAHo/kWn7ApOOa6U/s632/Page%25204-6.png)


> # Calibration 5/6 #

This page allows you to  calibrate your ACC and MAG, visualize they´re values and write any new adjustments to your FC EEPROM.

  * **For ACC calibration select it with your Drone on a flat surface**;
  * **For MAG calibration, select and you will have a time count down to start your calibration, this way you can prepare yourself**.

  * **For FC EEPROM write, you will also have a 5sec time countdown**.

![https://lh3.googleusercontent.com/-AzFy71xeBEU/UP30nju7ewI/AAAAAAAAAG0/NgTodoMbCu8/s632/Page%25205%253A6.png](https://lh3.googleusercontent.com/-AzFy71xeBEU/UP30nju7ewI/AAAAAAAAAG0/NgTodoMbCu8/s632/Page%25205%253A6.png)


> # Statistics 6/6 #

This page shows you flight statistics, and will be displayed automatically after flight, if you have selected that option on GUI.

  * **After you disarm your copter statistics will be automatically displayed on your screen, to leave this screen give some throttle**.

> ![https://lh5.googleusercontent.com/-W9qbULyefpU/UP30otrxT7I/AAAAAAAAAG8/gJy6yQ9qfjM/s632/Page%25206%253A6.png](https://lh5.googleusercontent.com/-W9qbULyefpU/UP30otrxT7I/AAAAAAAAAG8/gJy6yQ9qfjM/s632/Page%25206%253A6.png)





