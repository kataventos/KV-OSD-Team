
//   KV Team OSD GUI
//   http://code.google.com/p/rush-osd-development/
//   December  2013  V_2.2
//   This program is free software: you can redistribute it and/or modify
//   it under the terms of the GNU General Public License as published by
//   the Free Software Foundation, either version 3 of the License, or
//   any later version. see http://www.gnu.org/licenses/

              /*********************************************************************/
              /*                           KV_OSD_Team                             */
              /*                                                                   */
              /*    KATAVENTOS                ITAIN                 CARLONB        */
              /*     POWER67                 LIAM2317             NEVERLANDED      */
              /*********************************************************************/


import processing.serial.Serial; // serial library
import controlP5.*; // controlP5 library
import java.io.File;
import java.lang.*; // for efficient String concatemation
import javax.swing.SwingUtilities; // required for swing and EDT
import javax.swing.JFileChooser;// Saving dialogue
import javax.swing.filechooser.FileFilter; // for our configuration file filter "*.mwi"
import javax.swing.JOptionPane; // for message dialogue
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream; 
import java.io.FileOutputStream;
import java.io.FileInputStream;
import java.util.*;
import java.io.FileNotFoundException;
import java.text.DecimalFormat;

String KV_OSD_GUI_Version = "2.2";


PImage img_Clear,RadioPot;
  
int DisplayWindowX = 598;
int DisplayWindowY = 40; 
int WindowAdjX = -84; 
int WindowAdjY = -31;
int WindowShrinkX = 8;
int WindowShrinkY = 48;

int currentCol = 0;
int currentRow = 0;  

ControlP5 controlP5;
ControlP5 SmallcontrolP5;
ControlP5 ScontrolP5;
ControlP5 FontGroupcontrolP5;
ControlP5 GroupcontrolP5;
Textlabel txtlblWhichcom; 
ListBox commListbox;


boolean PortRead = false;
boolean PortWrite = false;
ControlGroup messageBox;
Textlabel MessageText;

// Int variables
String OSname = System.getProperty("os.name");
String LoadPercent = "";
//String CallSign = "";

int init_com = 0;
int commListMax = 0;
int whichKey = -1;  // Variable to hold keystoke values
int inByte = -1;    // Incoming serial data
int[] serialInArray = new int[3];    // Where we'll put what we receive


int serialCount = 0;                 // A count of how many bytes we receive
int ConfigEEPROM = -1;
int ConfigVALUE = -1;

int windowsX    = 855;       int windowsY    =440;
int xGraph      = 10;         int yGraph      = 325;
int xObj        = 520;        int yObj        = 293;
int xCompass    = 920;        int yCompass    = 341;
int xLevelObj   = 920;        int yLevelObj   = 80;
int xParam      = 120;        int yParam      = 5;
int xRC         = 690;        int yRC         = 10;
int xMot        = 690;        int yMot        = 155;
int xButton     = 845;        int yButton     = 231; 
int xBox        = 415;        int yBox        = 10;
//int xGPS        = 853;        int yGPS        = 438;
int XSim        = DisplayWindowX+WindowAdjX;        int YSim        = 288-WindowShrinkY + 85;

// Box locations -------------------------------------------------------------------------
int Col1Width = 180;        int Col2Width = 200;  int Col3Width = 155;

int XEEPROM    = 120;        int YEEPROM    = 5;  //hidden do not remove
int XBoard     = 120;        int YBoard     = 5;
int XRSSI      = 120;        int YRSSI      = 45;
int XVolts     = 305;        int YVolts    = 152;
int XAmps      = 695;        int YAmps    = 152;
int XVVolts    = 490;        int YVVolts  = 152;
int XTemp      = 305;        int YTemp    = 5;
int XGPS       = 305;        int YGPS     = 45;
int XCS        = 120;        int YCS      = 472;
int XOther     = 490;        int YOther    = 5;
int XVolume    = 120;        int YVolume   = 182;
int XPortStat  = 5;          int YPortStat = 272;
int XControlBox     = 5;     int YControlBox   = 310;  
int XRCSim    =   XSim;      int YRCSim = 430;


String FontFileName = "data/MW_OSD_Team.mcm";

//File FontFile;
int activeTab = 1;
int xx=0;
int YLocation = 0;
int Roll = 0;
int Pitch = 0;

int OnTimer = 0;
int FlyTimer = 0;
float SimItem0= 0;
int Armed = 0;
int Showback = 1;
int del = 0;
// int variables

// For Heading
char[] headGraph={
  0x1a,0x1d,0x1c,0x1d,0x19,0x1d,0x1c,0x1d,0x1b,0x1d,0x1c,0x1d,0x18,0x1d,0x1c,0x1d,0x1a,0x1d,0x1c,0x1d,0x19,0x1d,0x1c,0x1d,0x1b};

static int MwHeading=0;
char MwHeadingUnitAdd=0xbd;


String[] ConfigNames = {
  "EEPROM Loaded",
  
  "RSSI Min",
  "RSSI Max",
  "RSSI Alarm",
  "Input", //MW ADC
  "PWM",
  "PWM Divider",
  "Main&Video Alarm",
  "Battery Cells",
  "Divider Ratio",
  "Input", //MW ADC  
  "Divider Ratio",
  "Input", //Mw ADC
  "Temperature Max",
  
  
  "", // for Board type do not remove
  
  "GPS",
  "Coords",
  "Heading",
  "Unit",   //unit
  "Video",  // signal
  "Stats",
  "OSD ADC",
  " ",
  "Blink Frequency",
  "Input",
  "Sensitivity",
  "OffSet High",
  "OffSet Low",
  "Descend Alarm (m/s)",
  "Volume Dist Max (x100)",
  "Volume Alt Max",
  "Volume Alt Min",
  
  "S_CS0",
  "S_CS1",
  "S_CS2",
  "S_CS3",
  "S_CS4",
  "S_CS5",
  "S_CS6",
  "S_CS7",
  "S_CS8",
  "S_CS9",
};

String[] ConfigHelp = {
  "EEPROM Loaded",
  
  "RSSI Min",
  "RSSI Max",
  "RSSI Alarm",
  "RSSI",
  "PWM RSSI", 
  "Voltage Min",
  "Battery Cells",
  "Main Voltage Devider",
  "Main Voltage MW",
  "Video Voltage Devider",
  "Video Voltage MW",
  "Temperature Max",
  
  "", // for Board type do not remove
  
  "GPS",
  "Coords",
  "Display Heading 360",
  "Units",
  "Video Signal",
  "Reset Stats After Arm",
  "ADC",
  " ",
  "Blink Frequency",
  "Amps",
  "Sensitivity",
  "OffSet High",
  "OffSet Low",
  "CLimb Rate Alarm",
  "Volume Distance Max",
  "Volume Altitude Max",
  "Volume Altitude Min",
  
  "S_CS0",
  "S_CS1",
  "S_CS2",
  "S_CS3",
  "S_CS4",
  "S_CS5",
  "S_CS6",
  "S_CS7",
  "S_CS8",
  "S_CS9",
  
  };


static int CHECKBOXITEMS=0;
int CONFIGITEMS=ConfigNames.length;
static int SIMITEMS=6;
  
int[] ConfigRanges = {
1,   // used for check             0

255, // S_RSSIMIN                   1
255, // S_RSSIMAX                   2
70,  // S_RSSI_ALARM                3
1,   // S_MWRSSI                    4
1,   // S_PWMRSSI                   5
8,   // S_PWMRSSIDIVIDER            6
135,  // S_VOLTAGEMIN               7
4,   // S_BATCELLS                  8
110, // S_DIVIDERRATIO              9
1,   // S_MAINVOLTAGE_VBAT          10
110, // S_VIDDIVIDERRATIO           11
1,   // S_VIDVOLTAGE_VBAT           12 
255, // S_TEMPERATUREMAX            13
1,   // S_BOARDTYPE                 14
1,   // S_DISPLAYGPS                15
1,   // S_COORDINATES               16
1,   // S_HEADING360                17
1,   // S_UNITSYSTEM                18
1,   // S_VIDEOSIGNALTYPE           19
1,   // S_RESETSTATISTICS           20
1,   // S_ENABLEADC                 21
1,   // S_USE_BOXNAMES              22
10,  // S_BLINKINGHZ                23
1,   // S_MWAMPERAGE                24
60,  // S_CURRSENSSENSITIVITY       25
512, // S_CURRSENSOFFSET_H          26
512, // S_CURRSENSOFFSET_L          27
8,   // S_CLIMB_RATE_ALARM          28
255, // S_VOLUME_DIST_MAX           29
255, // S_VOLUME_ALT_MAX            30
50,  // S_VOLUME_ALT_MIN            31


 255,      //Call sign 10 chars 32 to 41
 255,
 255,
 255,
 255,
 255,
 255,
 255,
 255,
 255,

};

int[] ItemLocationPAL = {
  // ROW= Row position on screen (255= no action)
// COL= Column position on screen (255= no action)
// DSPL= Display item on screen
2,   // L_GPS_NUMSATPOSITIONROW LINE02+2
2,   // L_GPS_NUMSATPOSITIONCOL
1,   // L_GPS_NUMSATPOSITIONDSPL
3,   // L_GPS_DIRECTIONTOHOMEPOSROW LINE03+14
14,  // L_GPS_DIRECTIONTOHOMEPOSCOL
1,   // L_GPS_DIRECTIONTOHOMEPOSDSPL
2,   // L_GPS_DISTANCETOHOMEPOSROW LINE02+24
24,  // L_GPS_DISTANCETOHOMEPOSCOL
1,   // L_GPS_DISTANCETOHOMEPOSDSPL
3,   // L_SPEEDPOSITIONROW LINE03+24
24,  // L_SPEEDPOSITIONCOL
1,   // L_SPEEDPOSITIONDSPL
4,   // L_GPS_ANGLETOHOMEPOSROW LINE04+12
12,  // L_GPS_ANGLETOHOMEPOSCOL
1,   // L_GPS_ANGLETOHOMEPOSDSPL
4,   // L_MW_GPS_ALTPOSITIONROW LINE04+24
24,  // L_MW_GPS_ALTPOSITIONCOL
1,   // L_MW_GPS_ALTPOSITIONDSPL
3,   // L_SENSORPOSITIONROW LINE03+2
2,   // L_SENSORPOSITIONCOL
1,   // L_SENSORPOSITIONDSPL
2,   // L_MW_HEADINGPOSITIONROW LINE02+19
19,  // L_MW_HEADINGPOSITIONCOL
1,   // L_MW_HEADINGPOSITIONDSPL
2,   // L_MW_HEADINGGRAPHPOSROW LINE02+10
10,  // L_MW_HEADINGGRAPHPOSCOL
1,   // L_MW_HEADINGGRAPHPOSDSPL
11,  // L_TEMPERATUREPOSROW LINE11+2
2,   // L_TEMPERATUREPOSCOL
0,   // L_TEMPERATUREPOSDSPL

8,   // L_MW_ALTITUDEPOSITIONROW LINE08+2
2,   // L_MW_ALTITUDEPOSITIONCOL
1,   // L_MW_ALTITUDEPOSITIONDSPL
8,   // L_CLIMBRATEPOSITIONROW LINE08+24
24,  // L_CLIMBRATEPOSITIONCOL
1,   // L_CLIMBRATEPOSITIONDSPL
6,   // L_HORIZONPOSITIONROW LINE06+8
8,   // L_HORIZONPOSITIONCOL
1,   // L_HORIZONPOSITIONDSPL
255, // L_HORIZONSIDEREFROW,
255, // L_HORIZONSIDEREFCOL,
1,   // L_HORIZONSIDEREFDSPL,
255, // L_HORIZONCENTERREFROW,
255, // L_HORIZONCENTERREFCOL,
1,   // L_HORIZONCENTERREFDSPL,  
  
14,   // L_CURRENTTHROTTLEPOSITIONROW LINE14+22
22,   // L_CURRENTTHROTTLEPOSITIONCOL
1,    // L_CURRENTTHROTTLEPOSITIONDSPL
15,   // L_FLYTIMEPOSITIONROW LINE15+22
22,   // L_FLYTIMEPOSITIONCOL
1,    // L_FLYTIMEPOSITIONDSPL
15,   // L_ONTIMEPOSITIONROW LINE15+22
22,   // L_ONTIMEPOSITIONCOL
1,    // L_ONTIMEPOSITIONDSPL
14,   // L_MOTORARMEDPOSITIONROW LINE14+11
11,   // L_MOTORARMEDPOSITIONCOL
1,    // L_MOTORARMEDPOSITIONDSPL
12,   // L_MW_GPS_LATPOSITIONROW  LINE12+2
2,    // L_MW_GPS_LATPOSITIONCOL
1,    // L_MW_GPS_LATPOSITIONDSPL
12,   // L_MW_GPS_LONPOSITIONROW  LINE12+15
15,   // L_MW_GPS_LONPOSITIONCOL
1,    // L_MW_GPS_LONPOSITIONDSPL
14,   // L_RSSIPOSITIONROW LINE14+2
2,    // L_RSSIPOSITIONCOL
1,    // L_RSSIPOSITIONDSPL
15,   // L_VOLTAGEPOSITIONROW LINE15+3
3,    // L_VOLTAGEPOSITIONCOL
1,    // L_VOLTAGEPOSITIONDSPL
255,  // L_MAINBATLEVEVOLUTIONROW,
255,  // L_MAINBATLEVEVOLUTIONCOL,
1,    // L_MAINBATLEVEVOLUTIONDSPL,  
13,   // L_VIDVOLTAGEPOSITIONROW LINE13+3
3,    // L_VIDVOLTAGEPOSITIONCOL
0,    // L_VIDVOLTAGEPOSITIONDSPL
15,   // L_AMPERAGEPOSITIONROW LINE15+10
10,   // L_AMPERAGEPOSITIONCOL
0,    // L_AMPERAGEPOSITIONDSPL
15,   // L_PMETERSUMPOSITIONROW LINE15+16
16,   // L_PMETERSUMPOSITIONCOL
0,    // L_PMETERSUMPOSITIONDSPL
14,   // L_CALLSIGNPOSITIONROW LINE14+10
10,   // L_CALLSIGNPOSITIONCOL
0,    // L_CALLSIGNPOSITIONDSPL
};

int[] ItemLocationNTSC = {
2,   // L_GPS_NUMSATPOSITIONROW LINE02+2
2,   // L_GPS_NUMSATPOSITIONCOL
1,   // L_GPS_NUMSATPOSITIONDSPL
3,   // L_GPS_DIRECTIONTOHOMEPOSROW LINE03+14
14,  // L_GPS_DIRECTIONTOHOMEPOSCOL
1,   // L_GPS_DIRECTIONTOHOMEPOSDSPL
2,   // L_GPS_DISTANCETOHOMEPOSROW LINE02+24
24,  // L_GPS_DISTANCETOHOMEPOSCOL
1,   // L_GPS_DISTANCETOHOMEPOSDSPL
3,   // L_SPEEDPOSITIONROW LINE03+24
24,  // L_SPEEDPOSITIONCOL
1,   // L_SPEEDPOSITIONDSPL
4,   // L_GPS_ANGLETOHOMEPOSROW LINE04+12
12,  // L_GPS_ANGLETOHOMEPOSCOL
1,   // L_GPS_ANGLETOHOMEPOSDSPL
4,   // L_MW_GPS_ALTPOSITIONROW LINE04+24
24,  // L_MW_GPS_ALTPOSITIONCOL
1,   // L_MW_GPS_ALTPOSITIONDSPL
3,   // L_SENSORPOSITIONROW LINE03+2
2,   // L_SENSORPOSITIONCOL
1,   // L_SENSORPOSITIONDSPL
2,   // L_MW_HEADINGPOSITIONROW LINE02+19
19,  // L_MW_HEADINGPOSITIONCOL
1,   // L_MW_HEADINGPOSITIONDSPL
2,   // L_MW_HEADINGGRAPHPOSROW LINE02+10
10,  // L_MW_HEADINGGRAPHPOSCOL
1,   // L_MW_HEADINGGRAPHPOSDSPL
9,   // L_TEMPERATUREPOSROW LINE11+2
2,   // L_TEMPERATUREPOSCOL
0,   // L_TEMPERATUREPOSDSPL

7,   // L_MW_ALTITUDEPOSITIONROW LINE08+2
2,   // L_MW_ALTITUDEPOSITIONCOL
1,   // L_MW_ALTITUDEPOSITIONDSPL
7,   // L_CLIMBRATEPOSITIONROW LINE08+24
24,  // L_CLIMBRATEPOSITIONCOL
1,   // L_CLIMBRATEPOSITIONDSPL
5,   // L_HORIZONPOSITIONROW LINE06+8
8,   // L_HORIZONPOSITIONCOL
1,   // L_HORIZONPOSITIONDSPL
255, // L_HORIZONSIDEREFROW,
255, // L_HORIZONSIDEREFCOL,
1,   // L_HORIZONSIDEREFDSPL,
255, // L_HORIZONCENTERREFROW,
255, // L_HORIZONCENTERREFCOL,
1,   // L_HORIZONCENTERREFDSPL,  
  
12,   // L_CURRENTTHROTTLEPOSITIONROW LINE14+22
22,   // L_CURRENTTHROTTLEPOSITIONCOL
1,    // L_CURRENTTHROTTLEPOSITIONDSPL
13,   // L_FLYTIMEPOSITIONROW LINE15+22
22,   // L_FLYTIMEPOSITIONCOL
1,    // L_FLYTIMEPOSITIONDSPL
13,   // L_ONTIMEPOSITIONROW LINE15+22
22,   // L_ONTIMEPOSITIONCOL
1,    // L_ONTIMEPOSITIONDSPL
12,   // L_MOTORARMEDPOSITIONROW LINE14+11
11,   // L_MOTORARMEDPOSITIONCOL
1,    // L_MOTORARMEDPOSITIONDSPL
10,   // L_MW_GPS_LATPOSITIONROW  LINE12+2
2,    // L_MW_GPS_LATPOSITIONCOL
1,    // L_MW_GPS_LATPOSITIONDSPL
10,   // L_MW_GPS_LONPOSITIONROW  LINE12+15
15,   // L_MW_GPS_LONPOSITIONCOL
1,    // L_MW_GPS_LONPOSITIONDSPL
12,   // L_RSSIPOSITIONROW LINE14+2
2,    // L_RSSIPOSITIONCOL
1,    // L_RSSIPOSITIONDSPL
13,   // L_VOLTAGEPOSITIONROW LINE15+3
3,    // L_VOLTAGEPOSITIONCOL
1,    // L_VOLTAGEPOSITIONDSPL
255,  // L_MAINBATLEVEVOLUTIONROW,
255,  // L_MAINBATLEVEVOLUTIONCOL,
1,    // L_MAINBATLEVEVOLUTIONDSPL,  
11,   // L_VIDVOLTAGEPOSITIONROW LINE13+3
3,    // L_VIDVOLTAGEPOSITIONCOL
0,    // L_VIDVOLTAGEPOSITIONDSPL
13,   // L_AMPERAGEPOSITIONROW LINE15+10
10,   // L_AMPERAGEPOSITIONCOL
0,    // L_AMPERAGEPOSITIONDSPL
13,   // L_PMETERSUMPOSITIONROW LINE15+16
16,   // L_PMETERSUMPOSITIONCOL
0,    // L_PMETERSUMPOSITIONDSPL
12,   // L_CALLSIGNPOSITIONROW LINE14+10
10,   // L_CALLSIGNPOSITIONCOL
0,    // L_CALLSIGNPOSITIONDSPL

};
  
String[] SimNames= {
  "Armed:",
  "Acro/Stable:",
  "Bar Mode:",
  "Mag Mode:",
  "GPS Home:",
  "GPS Hold:",
  "Sim 6:",
  "Sim 7:",
  "Sim 8:",
  "Sim 9:",
  "Sim 10:"
};
  
  
PFont font8,font9,font10,font11,font12,font15;

//Colors--------------------------------------------------------------------------------------------------------------------
color yellow_ = color(200, 200, 20), green_ = color(30, 120, 30), red_ = color(120, 30, 30), blue_ = color(50, 50, 100),
grey_ = color(30, 30, 30);
//Colors--------------------------------------------------------------------------------------------------------------------

// textlabels -------------------------------------------------------------------------------------------------------------
Textlabel txtlblconfItem[] = new Textlabel[CONFIGITEMS] ;
Textlabel txtlblSimItem[] = new Textlabel[SIMITEMS] ;
Textlabel FileUploadText, TXText, RXText;
// textlabels -------------------------------------------------------------------------------------------------------------

// Buttons------------------------------------------------------------------------------------------------------------------
Button buttonIMPORT,buttonSAVE,buttonREAD,buttonRESET,buttonWRITE,buttonRESTART;
// Buttons------------------------------------------------------------------------------------------------------------------

// Toggles------------------------------------------------------------------------------------------------------------------
Toggle toggleConfItem[] = new Toggle[CONFIGITEMS] ;
// Toggles------------------------------------------------------------------------------------------------------------------    

// checkboxes------------------------------------------------------------------------------------------------------------------
CheckBox checkboxConfItem[] = new CheckBox[CONFIGITEMS] ;


// Toggles------------------------------------------------------------------------------------------------------------------    
RadioButton RadioButtonConfItem[] = new RadioButton[CONFIGITEMS] ;
RadioButton R_PortStat;

//  number boxes--------------------------------------------------------------------------------------------------------------

Numberbox confItem[] = new Numberbox[CONFIGITEMS] ;
//  number boxes--------------------------------------------------------------------------------------------------------------

Group MGUploadF,
  G_EEPROM,
  G_RSSI,
  G_Voltage,
  G_Amperage,
  G_VVoltage,
  G_Temperature,
  G_Board,
  G_GPS,
  G_UV,
  G_Other,
  G_Volume,
  G_CallSign,
  G_PortStatus
  
  ;

// Timers --------------------------------------------------------------------------------------------------------------------
//ControlTimer OnTimer,FlyTimer;

controlP5.Controller hideLabel(controlP5.Controller c) {
  c.setLabel("");
  c.setLabelVisible(false);
  return c;
}



void setup() {
  size(windowsX,windowsY);
 
OnTimer = millis();
  frameRate(30); 
  font8 = createFont("Arial bold",8,false);
  font9 = createFont("Arial bold",10,false);
  font10 = createFont("Arial bold",11,false);
  font11 = createFont("Arial bold",11,false);
  font12 = createFont("Arial bold",12,false);
  font15 = createFont("Arial bold",15,false);

  controlP5 = new ControlP5(this); // initialize the GUI controls
  controlP5.setControlFont(font10);
  SmallcontrolP5 = new ControlP5(this); // initialize the GUI controls
  SmallcontrolP5.setControlFont(font9); 
  ScontrolP5 = new ControlP5(this); // initialize the GUI controls
  ScontrolP5.setControlFont(font10);  
  GroupcontrolP5 = new ControlP5(this); // initialize the GUI controls
  GroupcontrolP5.setControlFont(font10);
  FontGroupcontrolP5 = new ControlP5(this); // initialize the GUI controls
  FontGroupcontrolP5.setControlFont(font10);


  SetupGroups();


  commListbox = controlP5.addListBox("portComList",5,100,110,260); // make a listbox and populate it with the available comm ports
  commListbox.setItemHeight(15);
  commListbox.setBarHeight(15);

  commListbox.captionLabel().set("PORT COM");
  commListbox.setColorBackground(red_);
  for(int i=0;i<Serial.list().length;i++) {
    String pn = shortifyPortName(Serial.list()[i], 13);
    if (pn.length() >0 ) commListbox.addItem(pn,i); // addItem(name,value)
    commListMax = i;
  }
  commListbox.addItem("Close Comm",++commListMax); // addItem(name,value)
  
  // text label for which comm port selected
  txtlblWhichcom = controlP5.addTextlabel("txtlblWhichcom","No Port Selected",5,65); // textlabel(name,text,x,y)
  
  buttonSAVE = controlP5.addButton("bSAVE",1,5,45,40,19); buttonSAVE.setLabel("SAVE"); buttonSAVE.setColorBackground(red_);
  buttonIMPORT = controlP5.addButton("bIMPORT",1,50,45,40,19); buttonIMPORT.setLabel("LOAD"); buttonIMPORT.setColorBackground(red_); 
  
  buttonREAD = controlP5.addButton("READ",1,XControlBox+30,YControlBox+25,45,16);buttonREAD.setColorBackground(red_);
  buttonRESET = controlP5.addButton("RESET",1,XControlBox+30,YControlBox+50,45,16);buttonRESET.setColorBackground(red_);
  buttonWRITE = controlP5.addButton("WRITE",1,XControlBox+30,YControlBox+75,45,16);buttonWRITE.setColorBackground(red_);
  buttonRESTART = controlP5.addButton("RESTART",1,XControlBox+25,YControlBox+100,55,16);buttonRESTART.setColorBackground(red_);
  
    
    

// EEPROM----------------------------------------------------------------

CreateItem(GetSetting("S_CHECK_"), 5, 0, G_EEPROM);

// RSSI  ---------------------------------------------------------------------------
CreateItem(GetSetting("S_MWRSSI"),  5,0*17, G_RSSI);
BuildRadioButton(GetSetting("S_MWRSSI"),  5,0*17, G_RSSI, "ADC","MWii");
CreateItem(GetSetting("S_PWMRSSI"),  5,1*17, G_RSSI);
BuildRadioButton(GetSetting("S_PWMRSSI"),  5,1*17, G_RSSI, "Off","On");
CreateItem(GetSetting("S_PWMRSSIDIVIDER"),  5,2*17, G_RSSI);
CreateItem(GetSetting("S_RSSIMIN"), 5,3*17, G_RSSI);
CreateItem(GetSetting("S_RSSIMAX"), 5,4*17, G_RSSI);
CreateItem(GetSetting("S_RSSI_ALARM"), 5,5*17, G_RSSI);



// Voltage  ------------------------------------------------------------------------
CreateItem(GetSetting("S_MAINVOLTAGE_VBAT"), 5,0*17, G_Voltage);
BuildRadioButton(GetSetting("S_MAINVOLTAGE_VBAT"),  5,0*17, G_Voltage, "ADC","MWii");
CreateItem(GetSetting("S_BATCELLS"), 5,1*17, G_Voltage);
CreateItem(GetSetting("S_VOLTAGEMIN"), 5,2*17, G_Voltage);
CreateItem(GetSetting("S_DIVIDERRATIO"), 5,3*17, G_Voltage);




// Video Voltage  ------------------------------------------------------------------------
CreateItem(GetSetting("S_VIDVOLTAGE_VBAT"),  5,0*17, G_VVoltage);
BuildRadioButton(GetSetting("S_VIDVOLTAGE_VBAT"),  5,0, G_VVoltage, "ADC","MWii");
CreateItem(GetSetting("S_VIDDIVIDERRATIO"),  5,2*17, G_VVoltage);

//  Temperature  --------------------------------------------------------------------
CreateItem(GetSetting("S_TEMPERATUREMAX"),  5,0*17, G_Temperature);

//  Board ---------------------------------------------------------------------------
CreateItem(GetSetting("S_BOARDTYPE"),  5,0, G_Board);
BuildRadioButton(GetSetting("S_BOARDTYPE"),  5,0, G_Board, "Rush","Minim");


//  GPS  ----------------------------------------------------------------------------
CreateItem(GetSetting("S_DISPLAYGPS"), 5,0, G_GPS);
BuildRadioButton(GetSetting("S_DISPLAYGPS"),  5,0, G_GPS, "Off","On");
CreateItem(GetSetting("S_COORDINATES"),  5,1*17, G_GPS);
BuildRadioButton(GetSetting("S_COORDINATES"),  5,1*17, G_GPS, "Off","On");
CreateItem(GetSetting("S_HEADING360"),  5,2*17, G_GPS);
BuildRadioButton(GetSetting("S_HEADING360"),  5,2*17, G_GPS, "180°","360°");




//  OTHER  ---------------------------------------------------------------------------
CreateItem(GetSetting("S_UNITSYSTEM"),  5,0, G_Other);
BuildRadioButton(GetSetting("S_UNITSYSTEM"),  5,0, G_Other, "Metric","Imperial");
CreateItem(GetSetting("S_VIDEOSIGNALTYPE"),  5,1*17, G_Other);
BuildRadioButton(GetSetting("S_VIDEOSIGNALTYPE"),  5,1*17, G_Other, "NTSC","PAL");
CreateItem(GetSetting("S_RESETSTATISTICS"),  5,2*17, G_Other);
BuildRadioButton(GetSetting("S_RESETSTATISTICS"),  5,2*17, G_Other, "Maintain","Reset");
CreateItem(GetSetting("S_ENABLEADC"),  5,3*17, G_Other);
BuildRadioButton(GetSetting("S_ENABLEADC"),  5,3*17, G_Other, "Off","On");
CreateItem(GetSetting("S_USE_BOXNAMES"),  5,4*17, G_Other);
BuildRadioButton(GetSetting("S_USE_BOXNAMES"),  5,4*17, G_Other, "BoxIDs","BoxNames");
CreateItem(GetSetting("S_BLINKINGHZ"),  5,5*17, G_Other);
CreateItem(GetSetting("S_CLIMB_RATE_ALARM"),  5,6*17, G_Other);


// Amperage  ------------------------------------------------------------------------
CreateItem(GetSetting("S_MWAMPERAGE"),  5,0, G_Amperage);
BuildRadioButton(GetSetting("S_MWAMPERAGE"),  5,0, G_Amperage, "ADC","MWii");
CreateItem(GetSetting("S_CURRSENSSENSITIVITY"),  5,1*17, G_Amperage);
CreateItem(GetSetting("S_CURRSENSOFFSET_H"),  5,2*17, G_Amperage);
CreateItem(GetSetting("S_CURRSENSOFFSET_L"),  5,3*17, G_Amperage);

// Volume Flight  -------------------------------------------------------------------
CreateItem(GetSetting("S_VOLUME_DIST_MAX"),  5,0*17, G_Volume);
CreateItem(GetSetting("S_VOLUME_ALT_MAX"),  5,1*17, G_Volume);
CreateItem(GetSetting("S_VOLUME_ALT_MIN"),  5,2*17, G_Volume);



//  Call Sign ---------------------------------------------------------------------------
//CreateItem(GetSetting("S_DISPLAY_CS"),  5,0, G_CallSign);

controlP5.addTextfield("CallSign")
     .setPosition(5,1*17)
     .setSize(105,15)
     .setFont(font10)
     .setAutoClear(false)
     .setGroup(G_CallSign);
     ;
 controlP5.addTextlabel("TXTCallSign","Call Sign",120,1*17)
 .setGroup(G_CallSign);
 CreateCS(GetSetting("S_CS0"),  0,0, G_CallSign);
 CreateCS(GetSetting("S_CS1"),  0,0, G_CallSign);
 CreateCS(GetSetting("S_CS2"),  0,0, G_CallSign);
 CreateCS(GetSetting("S_CS3"),  0,0, G_CallSign);
 CreateCS(GetSetting("S_CS4"),  0,0, G_CallSign);
 CreateCS(GetSetting("S_CS5"),  0,0, G_CallSign);
 CreateCS(GetSetting("S_CS6"),  0,0, G_CallSign);
 CreateCS(GetSetting("S_CS7"),  0,0, G_CallSign);
 CreateCS(GetSetting("S_CS8"),  0,0, G_CallSign);
 CreateCS(GetSetting("S_CS9"),  0,0, G_CallSign);


//*************** Config Items **************//

  for(int i=0;i<CONFIGITEMS;i++) {
    if (ConfigRanges[i] == 0) {
      toggleConfItem[i].hide();
      confItem[i].hide();
    }
    if (ConfigRanges[i] > 1) {
      try{
      toggleConfItem[i].hide();
      }catch(Exception e) {
      }finally {
      }  	
    }
      
    if (ConfigRanges[i] == 1){
      confItem[i].hide();  
    }
  }
  for (int txTimes = 0; txTimes<255; txTimes++) {
    inBuf[txTimes] = 0;
  }

  Font_Editor_setup();
   SimSetup();
  img_Clear = LoadFont(FontFileName);
  LoadConfig();
  
  
}


controlP5.Controller hideCheckbox(controlP5.Controller c) {
  c.hide();
  c.setLabelVisible(false);
  return c;
}

controlP5.Controller CheckboxVisable(controlP5.Controller c) {
  c.isVisible(); 

  c.setLabelVisible(false);
  return c;
}



void BuildRadioButton(int ItemIndex, int XLoction, int YLocation,Group inGroup, String Cap1, String Cap2){
    
  RadioButtonConfItem[ItemIndex] = controlP5.addRadioButton("RadioButton"+ItemIndex)
         .setPosition(XLoction,YLocation+3)
         .setSize(10,10)
         .setNoneSelectedAllowed(false) 
         .setItemsPerRow(2)
         .setSpacingColumn(int(textWidth(Cap1))+10)
         .addItem("First"+ItemIndex,0)
         .addItem("Second"+ItemIndex,1)
         .toUpperCase(false)
        //.hideLabels() 
         ;
    RadioButtonConfItem[ItemIndex].setGroup(inGroup);
    RadioButtonConfItem[ItemIndex].getItem(0).setCaptionLabel(Cap1);
    RadioButtonConfItem[ItemIndex].getItem(1).setCaptionLabel(Cap2 + "    " + ConfigNames[ItemIndex]);
    
    toggleConfItem[ItemIndex].hide();
    txtlblconfItem[ItemIndex].hide();
    
}

void CreateCS(int ItemIndex, int XLoction, int YLocation, Group inGroup){
  //numberbox
  confItem[ItemIndex] = (controlP5.Numberbox) hideLabel(controlP5.addNumberbox("configItem"+ItemIndex,0,XLoction,YLocation,35,14));
  confItem[ItemIndex].setMin(0);
  confItem[ItemIndex].setMax(255);
  confItem[ItemIndex].setDecimalPrecision(0);
  confItem[ItemIndex].setGroup(inGroup);
  confItem[ItemIndex].hide();
  toggleConfItem[ItemIndex] = (controlP5.Toggle) hideLabel(controlP5.addToggle("toggleValue"+ItemIndex));
  toggleConfItem[ItemIndex].hide();
  
}

void CreateItem(int ItemIndex, int XLoction, int YLocation, Group inGroup){
  //numberbox
  confItem[ItemIndex] = (controlP5.Numberbox) hideLabel(controlP5.addNumberbox("configItem"+/*"ItemLocationPAL"+"ItemLocationNTSC"+*/ ItemIndex,0,XLoction,YLocation,35,14));
  confItem[ItemIndex].setColorBackground(red_);
  confItem[ItemIndex].setMin(0);
  confItem[ItemIndex].setDirection(Controller.HORIZONTAL);
  confItem[ItemIndex].setMax(ConfigRanges[ItemIndex]);
  confItem[ItemIndex].setDecimalPrecision(0);
  confItem[ItemIndex].setGroup(inGroup);
  //Toggle
  toggleConfItem[ItemIndex] = (controlP5.Toggle) hideLabel(controlP5.addToggle("toggleValue"+ItemIndex));
  toggleConfItem[ItemIndex].setPosition(XLoction,YLocation+3);
  toggleConfItem[ItemIndex].setSize(35,10);
  toggleConfItem[ItemIndex].setMode(ControlP5.SWITCH);
  toggleConfItem[ItemIndex].setGroup(inGroup);
  //TextLabel
  txtlblconfItem[ItemIndex] = controlP5.addTextlabel("txtlblconfItem"+ItemIndex,ConfigNames[ItemIndex],XLoction+40,YLocation);
  txtlblconfItem[ItemIndex].setGroup(inGroup);
  controlP5.getTooltip().register("txtlblconfItem"+ItemIndex,ConfigHelp[ItemIndex]);

} 


void MakePorts(){
  
  if (PortWrite){  
       TXText.setColorValue(color(255,10,0));
  }
  else
  {
    TXText.setColorValue(color(100,10,0));
  }
  if (PortRead){  
    RXText.setColorValue(color(0,240,0));
  }
   else
  {
    RXText.setColorValue(color(0,100,0));
  }
}

void draw() {
  time=millis();
  if ((init_com==1)  && (toggleMSP_Data == true)) {
    //time2 = time;
    PortRead = true;
    MakePorts();
    MWData_Com();
    if (!FontMode) PortRead = false;
    
  }
  if ((SendSim ==1) && (ClosePort == false)){
 
    if ((init_com==1)  && (time-time5 >5000) && (toggleMSP_Data == false) && (!FontMode)){
      if(ClosePort) return;
      time5 = time;
       
      if (init_com==1){
        SendCommand(MSP_BOXNAMES);
        SendCommand(MSP_BOXIDS);
      }

    }
    if ((init_com==1)  && (time-time4 >200) && (!FontMode)){
      if(ClosePort) return;
      time4 = time; 

      if (init_com==1)SendCommand(MSP_ANALOG);
      if (init_com==1)SendCommand(MSP_STATUS);
      if (init_com==1)SendCommand(MSP_RC);
      if (init_com==1)SendCommand(MSP_ALTITUDE);
      if (init_com==1)SendCommand(MSP_RAW_GPS);
      if (init_com==1)SendCommand(MSP_COMP_GPS);
      
      
    }
    if ((init_com==1)  && (time-time1 >40) && (!FontMode)){
      if(ClosePort) return;
      time1 = time; 
      PortWrite = !PortWrite;
      
      if (init_com==1)SendCommand(MSP_ATTITUDE);

    }
  }
  else
  {
    if (!FontMode) PortWrite = false; 
  }
  if ((FontMode) && (time-time2 >100)){
    SendChar();
   }   
    
  MakePorts();   
  
  
  background(80);
  
  // ------------------------------------------------------------------------
  // Draw background control boxes
  // ------------------------------------------------------------------------

  // Coltrol Box
  fill(80); strokeWeight(2);stroke(100); rectMode(CORNERS); rect(XControlBox,YControlBox, XControlBox+108, YControlBox+123); //108//130
  textFont(font12); fill(255, 255, 255); text("OSD Controls",XControlBox + 15,YControlBox + 15);
  if (activeTab == 1) {
  
  }
  
  fill(60, 40, 40);
  strokeWeight(3);stroke(0);
  rectMode(CORNERS);
  rect(5,5,113,40);
  textFont(font12);
  // version
  fill(255, 255, 255);
  text("KV Team OSD",10,19);
  text("  GUI    V",10,35);
  text(KV_OSD_GUI_Version, 74, 35);
  fill(0, 0, 0);
  strokeWeight(3);stroke(0);
  rectMode(CORNERS);
 
 
  MatchConfigs();
  MakePorts();

  
  if ((ClosePort ==true)&& (PortWrite == false)){ 
    ClosePort();
  }
}

int GetSetting(String test){
  int TheSetting = 0;
  for (int i=0; i<Settings.values().length; i++) 
  if (Settings.valueOf(test) == Settings.values()[i]){ 
      TheSetting = Settings.values()[i].ordinal();
  }
  return TheSetting;
}


void ShowSimBackground(float[] a) {
  Showback = int(a[0]);
}

public void BuildCallSign(){
  String CallSText = "";
  for (int i=0; i<10; i++){ 
    //confItem[GetSetting("S_CS0")+i].setValue(0);
    if (int(confItem[GetSetting("S_CS0")+i].getValue())>0){
    CallSText+=char(int(confItem[GetSetting("S_CS0")+i].getValue()));
    }
  }
  controlP5.get(Textfield.class,"CallSign").setText(CallSText);
}  

public void CheckCallSign() {
  // automatically receives results from controller input
  String CallSText = controlP5.get(Textfield.class,"CallSign").getText().toUpperCase();
  controlP5.get(Textfield.class,"CallSign").setText(CallSText);
    if (CallSText.length()  >10){
      controlP5.get(Textfield.class,"CallSign").setText(CallSText.substring(0, 10));
      CallSText = controlP5.get(Textfield.class,"CallSign").getText();
    } 
    for (int i=0; i<10; i++){ 
    confItem[GetSetting("S_CS0")+i].setValue(0);
    }
    for (int i=0; i<CallSText.length(); i++){ 
      confItem[(GetSetting("S_CS0"))+i].setValue(int(CallSText.charAt(i)));
    }
}


void MatchConfigs()

{
 for(int i=0;i<CONFIGITEMS;i++) {
   try{ 
       if (RadioButtonConfItem[i].isVisible()){
          confItem[i].setValue(int(RadioButtonConfItem[i].getValue()));
       }
        }catch(Exception e) {}finally {}
    
  
     if  (toggleConfItem[i].isVisible()){
       if (int(toggleConfItem[i].getValue())== 1){
       confItem[i].setValue(1);
     }
     else{ 
       confItem[i].setValue(0);
      }
    }
  }
}


//***************************************************************//

// controls comport list click
public void controlEvent(ControlEvent theEvent) {
  
  try{
  if (theEvent.isGroup())
    if (theEvent.name()=="portComList")
      InitSerial(theEvent.group().value()); // initialize the serial port selected
  }catch(Exception e){
    System.out.println("error with Port");
  }
  
  
if (theEvent.name()=="CallSign"){
  CheckCallSign();
}
      
  try{
    if ((theEvent.getController().getName().substring(0, 7).equals("CharPix")) && (theEvent.getController().isMousePressed())) {
        int ColorCheck = int(theEvent.getController().value());
        curPixel = theEvent.controller().id();
    }
    if ((theEvent.getController().getName().substring(0, 7).equals("CharMap")) && (theEvent.getController().isMousePressed())) {
      curChar = theEvent.controller().id();    
    }
   } catch(ClassCastException e){}
     catch(StringIndexOutOfBoundsException se){}
      
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////// BEGIN FILE OPS//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




//save the content of the model to a file
public void bSAVE() {
  updateModel();
  SwingUtilities.invokeLater(new Runnable(){
    public void run() {
     final JFileChooser fc = new JFileChooser(dataPath("")) {

        private static final long serialVersionUID = 7919427933588163126L;

        public void approveSelection() {
            File f = getSelectedFile();
            if (f.exists() && getDialogType() == SAVE_DIALOG) {
                int result = JOptionPane.showConfirmDialog(this,
                        "The file exists, overwrite?", "Existing file",
                        JOptionPane.YES_NO_CANCEL_OPTION);
                switch (result) {
                case JOptionPane.YES_OPTION:
                    super.approveSelection();
                    return;
                case JOptionPane.CANCEL_OPTION:
                    cancelSelection();
                    return;
                default:
                    return;
                }
            }
            super.approveSelection();
        }
    };

      fc.setDialogType(JFileChooser.SAVE_DIALOG);
      fc.setFileFilter(new MwiFileFilter());
      int returnVal = fc.showSaveDialog(null);
      if (returnVal == JFileChooser.APPROVE_OPTION) {
        File file = fc.getSelectedFile();
        String filePath = file.getPath();
        if(!filePath.toLowerCase().endsWith(".osd")){
          file = new File(filePath + ".osd");
        }

        
        FileOutputStream out =null;
        String error = null;
        try{
          out = new FileOutputStream(file) ;
          MWI.conf.storeToXML(out, "RUSH_OSD Configuration File  " + new  Date().toString());
          JOptionPane.showMessageDialog(null,new StringBuffer().append("configuration saved : ").append(file.toURI()) );
        }catch(FileNotFoundException e){
         
          error = e.getCause().toString();
        }catch( IOException ioe){
                /*failed to write the file*/
                ioe.printStackTrace();
                error = ioe.getCause().toString();
        }finally{
                
          if (out!=null){
            try{
              out.close();
            }catch( IOException ioe){/*failed to close the file*/error = ioe.getCause().toString();}
          }
          if (error !=null){
                  JOptionPane.showMessageDialog(null, new StringBuffer().append("error : ").append(error) );
          }
        }
    }
    }
  }
  );
}

public void updateModel(){
  for(int j=0;j<ConfigNames.length;j++) {
         MWI.setProperty(ConfigNames[j],String.valueOf(confItem[j].value()));
  }
}

public void updateView(){
  for(int j=0; j<ConfigNames.length; j++) {
    
    if(j >= CONFIGITEMS)
    return;
  int value = int(MWI.getProperty(ConfigNames[j]));
  confItem[j].setValue(value);
  if (j == CONFIGITEMS-1){
  }  
  if (value >0){
    toggleConfItem[j].setValue(1);
    }
    else {
    toggleConfItem[j].setValue(0);
  }

  try{
    switch(value) {
    case(0):
      RadioButtonConfItem[j].activate(0);
      break;
    case(1):
      RadioButtonConfItem[j].activate(1);
      break;
    }
  }
  catch(Exception e) {}finally {}
  }
  BuildCallSign();
}

public class MwiFileFilter extends FileFilter {
  public boolean accept(File f) {
    if(f != null) {
      if(f.isDirectory()) {
        return true;
      }
      String extension = getExtension(f);
      if("osd".equals(extension)) {
        return true;
      }
    }
    return false;
  }


  public String getExtension(File f) {
    if(f != null) {
      String filename = f.getName();
      int i = filename.lastIndexOf('.');
      if(i>0 && i<filename.length()-1) {
        return filename.substring(i+1).toLowerCase();
      }
    }
    return null;
  } 

  public String getDescription() {
    return "*.osd KVT_OSD configuration file";
  }   
}


//**********************************************************//

// import the content of a file into the model
public void bIMPORT(){
  SwingUtilities.invokeLater(new Runnable(){
    public void run(){
      final JFileChooser fc = new JFileChooser(dataPath(""));
      fc.setDialogType(JFileChooser.SAVE_DIALOG);
      fc.setFileFilter(new MwiFileFilter());
      int returnVal = fc.showOpenDialog(null);
      if (returnVal == JFileChooser.APPROVE_OPTION) {
        File file = fc.getSelectedFile();
        FileInputStream in = null;
        boolean completed = false;
        String error = null;
        try{
          in = new FileInputStream(file) ;
          MWI.conf.loadFromXML(in); 
          JOptionPane.showMessageDialog(null,new StringBuffer().append("configuration loaded : ").append(file.toURI()) );
          completed  = true;
          
        }catch(FileNotFoundException e){
                error = e.getCause().toString();

        }catch( IOException ioe){/*failed to read the file*/
                ioe.printStackTrace();
                error = ioe.getCause().toString();
        }finally{
          if (!completed){
                 // MWI.conf.clear();
                 // or we can set the properties with view values, sort of 'nothing happens'
                 updateModel();
          }
          updateView();
          if (in!=null){
            try{
              in.close();
            }catch( IOException ioe){/*failed to close the file*/}
          }
          
          if (error !=null){
                  JOptionPane.showMessageDialog(null, new StringBuffer().append("error : ").append(error) );
          }
        }
      }
    }
  }
  );
}

//******************************************************************//
//  our model 
static class MWI {
  private static Properties conf = new Properties();
  public static void setProperty(String key ,String value ){
    conf.setProperty( key,value );
  }
  public static String getProperty(String key ){
    return conf.getProperty( key,"0");
  }
  public static void clear( ){
    conf= null; // help gc
    conf = new Properties();
  }
}



public void updateConfig(){
  String error = null;
  FileOutputStream out =null;
  
  ConfigClass.setProperty("StartFontFile",FontFileName);
  
  
  File file = new File(dataPath("GUI.Config"));
  try{
    out = new FileOutputStream(file) ;
    ConfigClass.conf.storeToXML(out, "KV_Team_OSD GUI Configuration File  " + new  Date().toString());
    }catch(FileNotFoundException e){
      error = e.getCause().toString();
      }catch( IOException ioe){
        /*failed to write the file*/
        ioe.printStackTrace();
        error = ioe.getCause().toString();
      }finally{
        if (out!=null){
          try{
            out.close();
            }catch( IOException ioe){/*failed to close the file*/error = ioe.getCause().toString();}
            }
            if (error !=null){
              JOptionPane.showMessageDialog(null, new StringBuffer().append("error : ").append(error) );
    }
  }
}


public void LoadConfig(){
  String error = null;
  FileInputStream in =null;  
  try{
   
    in = new FileInputStream(dataPath("GUI.Config"));
  }catch(FileNotFoundException e){
    System.out.println("Configuration Failed- Creating Default");
    updateConfig();
    }catch( IOException ioe){
      /*failed to write the file*/
      ioe.printStackTrace();
      error = ioe.getCause().toString();
    }//finally{
      if (in!=null){
        try{
          ConfigClass.conf.loadFromXML(in); 
          FontFileName = ConfigClass.getProperty("StartFontFile");
          img_Clear = LoadFont(FontFileName);
          System.out.println("Configuration Successful");
          in.close();
          }catch( IOException ioe){/*failed to close the file*/error = ioe.getCause().toString();}
          }
          if (error !=null){
            JOptionPane.showMessageDialog(null, new StringBuffer().append("error : ").append(error) );
  }
}

//***************************************************************//
//  our configuration 
static class ConfigClass {
  private static Properties conf = new Properties();
  public static void setProperty(String key ,String value ){
    conf.setProperty( key,value );
  }
  public static String getProperty(String key ){
    return conf.getProperty( key,"0");
  }
  public static void clear( ){
    conf= null; // help gc
    conf = new Properties();
  }
}


void mouseReleased() {
  mouseDown = false;
  mouseUp = true;
  if (curPixel>-1)changePixel(curPixel);
  if (curChar>-1)GetChar(curChar);
  ControlLock();
  
} 

        
public void mousePressed() {
                mouseDown = true;
                mouseUp = false;
        }

        public boolean mouseDown() {
                return mouseDown;
        }

        public boolean mouseUp() {
                return mouseUp;
        }
        
        
void SketchUploader(){
  String ArduioLocal = ConfigClass.getProperty("ArduinoLocation");
  if (ArduioLocal == "0"){
   try {  
    SwingUtilities.invokeAndWait(new Runnable(){
    public void run(){
      JFileChooser fc = new JFileChooser();
      fc.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
      fc.setDialogType(JFileChooser.SAVE_DIALOG);
      fc.setDialogTitle("Select Arduino Folder");
      //fc.setFileFilter(new FontFileFilter());
      //fc.setCurrentDirectory();
      int returnVal = fc.showOpenDialog(null);
      if (returnVal == JFileChooser.APPROVE_OPTION) {
        File ArduioFile = fc.getSelectedFile();
        String ArduioLocal = ArduioFile.getPath();
        ConfigClass.setProperty("ArduinoLocation",ArduioLocal);
        updateConfig();
        
        String error = null;
        
      }
    }
  }
  );  
  } catch (Exception e) { }
  }

  toggleMSP_Data = false;
  InitSerial(200.00);
  updateConfig(); 
  
  super.exit();
}


