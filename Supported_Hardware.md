![https://lh4.googleusercontent.com/-7I8T4OoKK8w/Up9s7TPDYqI/AAAAAAAABOE/yN1Wh2V8KEQ/s528/10-11-2013_12-21-25_am.jpg](https://lh4.googleusercontent.com/-7I8T4OoKK8w/Up9s7TPDYqI/AAAAAAAABOE/yN1Wh2V8KEQ/s528/10-11-2013_12-21-25_am.jpg)
![https://lh6.googleusercontent.com/-RZqU9X6ApcU/Up9jLFUiRmI/AAAAAAAABNU/4I1gvngbA90/s450/jdminiosd12-2.jpg](https://lh6.googleusercontent.com/-RZqU9X6ApcU/Up9jLFUiRmI/AAAAAAAABNU/4I1gvngbA90/s450/jdminiosd12-2.jpg)

# Details JDrones Minim OSD #

Both work straight out of the box if you follow the wiki carefully.

  * **[JDrones](http://www.jdrones.com/)** OSD was originally designed to other project so, if you are using the KVTeam dev\_r370 or below you will not have your ADC´s working, for full compatibility you need KV Team 2.2 or above.


# Details WiteSpy Minim OSD #

  * **[WiteSpy ](http://www.readytoflyquads.com/)** _v5 will be immediately 100% working because it was specifically designed to work with the KVTeam Software._

This first batch have a small design error on a simple trace that need to be cut, you can see it here on the following pic:

**Note:** To know if your board is from this batch or not, simply connect a multimeter set for continuity and check between the two pins, if it beeps or goes zero cut the trace, if not you are good to go.

![https://lh5.googleusercontent.com/-ao4bTGGrg4s/Up9uJPkF40I/AAAAAAAABOM/u3zjGhfpglI/s508/Paul%2520B_Minim%2520OSD.png](https://lh5.googleusercontent.com/-ao4bTGGrg4s/Up9uJPkF40I/AAAAAAAABOM/u3zjGhfpglI/s508/Paul%2520B_Minim%2520OSD.png)

**Cut the trace as close as possible to any of the two contacts (where the pins will be) carefully, without cutting any other line.**

**Note: do this before any soldering.**

  * **EXTREMELY IMPORTANT NOTICE**
**The JDrones OSD does not have voltage dividers, you can ready only up to 5volts.**

**WiteSpyOSDv5 already have voltage dividers and it´s capable to read up to 4s Batts for main and video voltage pins, and up to 5v on the RSSI/Amperage pin´s .**
  * **(never go wrong on this or you will burn to smoke your OSD)**

**[Wiki Contents List](http://code.google.com/p/rush-osd-development/w/list)**