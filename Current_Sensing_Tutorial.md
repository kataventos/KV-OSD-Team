# Current Sensing #

At first site the GUI adjustments can be difficult to understand but in truth it becomes nothing but clear after you read the following explanation. Using this parameters we were able to get 4.6% error.

  * **Sensor sensitivity** Typically is 20mV/A or 40mV/A. This info must be on sensor data sheet.
> NOTE: This param. means that the sensor outout voltage will increase of 20mV (or 40) each
> one Ampere of real current increment flowing through the sensor.

  * **Sensor Off-Set** Value to be set in order to have Zero current indication with No-Load (No Current flow).
Exists two types of sensors, **Unidirectionals and Bidirectionals.**

  * **Unidirectional** "DO NOT SENSE" the current flow direction, so it's not important the versus of positive/negative in/out wire connection.
With No-Load condition, the sensor voltage output theoretically is 0V, but some time due to temperature, tolerance, or even ATmEGA CHIP ADC conversion, it will give 1 or 2 "steps" of ADC convertion value, this will virtually generate a little amperage reading (0.2,  0.3,  0.4A....).

  * **Bidirectional** "SENSE" the current flow direction, but for our use this is not so usefull, but will impact during the current calculation.
With No-Load condition, the output theoretically is 2,5V (half of sensor supply, or 512 steps of ADC conversion), some time due to temperature, tolerance, or ATmEGA CHIP ADC conversion, power supply, will give 510 or 511 or 513, this will virtually generate little amperage reading (-0.2,  +0,2A 0.3,  -0.4A....).

Cause of these tollerances, we need to adjust them  setting a proper value in OFFSET in order to have 0Amps on screen when no current is flowing in the sensors.

Be aware that it's almost impossible permanently 0Amps with No\_load. We can only minimize this effect. In fact for a real consumption situation you must not forget all your gear, mostly your AV TX, camera etc. Typically the normal consumption will be between 250 and 400mah depending on your setup.

**Look [here](http://code.google.com/p/rush-osd-development/wiki/GUI_Usage_Instructions) to better understand how the GUI parameters work.**