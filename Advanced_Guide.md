# Advanced Guide #

**Default populated screen**

![https://lh4.googleusercontent.com/-f6rA7I3YWAY/UrHvQfyFBuI/AAAAAAAABWI/tfrtPQIoCzk/s519/Picture%25208_edit.png](https://lh4.googleusercontent.com/-f6rA7I3YWAY/UrHvQfyFBuI/AAAAAAAABWI/tfrtPQIoCzk/s519/Picture%25208_edit.png)


**OSD Full displayable functions list**

**Time**

  * Fly time and on time icon will change from ON MIN to ON HR if you are flying for more then one hour. Useful to FPV gliders and airplanes with big flight autonomy.

**Unit and video signal**

Available options:
  * Metric or Imperial
  * PAL or NTSC

**Voltage and video voltage (ADC´s & MWii Serial protocol)**

Adjustments available to:
  * Number of battery cells;
  * Minim voltage alarm;
  * Divider ratio.

**Amperage  (ADC´s & MWii Serial protocol)**

  * Instant consumed Amperage
  * Total consumed amperage in ma/h

Adjustments available to:
  * Sensitivity;
  * Offset High/Low.
You can configure unidirectional and bidirectional sensors by adjusting according your sensor data-sheet.
Performed tests revealed  a 4.6% calculation error.


**RSSI (ADC´s & MWii Serial protocol)**

  * **NOTE:** PWM uses the same pin as for analogue input.

Adjustments available to:

  * PWM Divider;
  * RSSI Min/Max signal;
  * Minimum RSSI alarm.

**Altitude (Barometric sensing & GPS)**
  * **Climb rate** uses barometric sensor data to calculations that will be displayed in meters/feet per second.

**Heading**

  * Use magnetometer.

**Flight mode**
  * The OSD will only display sensors present, MWii FC sends this information.

Available sensors and displayable functions on flight mode board:
  * ACC;
  * Barometric sensor;
  * Magnetometer;
  * GPS;
  * Flight modes (Acro, Stable and Horizon)
  * GPS (3D fix, Position hold, and Go home)

**GPS related displayable functions**

  * Distance to home;
  * Speed;
  * Altitude;
  * Coordinates;
  * Number of acquired satellites;
  * Heading home indicator arrow.

**Artificial horizon**

It is divided in 3 distinct parts:

  * Horizon;
  * Center reference;
  * Side reference.

**Motors**

  * Armed;
  * Disarmed.

**Throttle usage percentage**

  * It automatically detects your throttle RC stick max and min.

  * **New Gadgets on 2.2dev**

**Stall warning**

  * Stall warning will appear under altitude if your throttle is <= to 15%. This is a gadget for acrobatic FPV pilots  that like to know how much and how long they can be in the edge.

**Climbing rate warning**

  * This is a gadget that warns you when you loose altitude quick, it will make your climbing rate indicator blink. Adjustable on the GUI.