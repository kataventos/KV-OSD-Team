#ifndef TYPES_H_
#define TYPES_H_

#include "Arduino.h"
#include "Config.h"


typedef struct {
	uint16_t cycleTime;
	int16_t I2CError;
	uint16_t  sensorPresent;
	uint32_t  sensorActive;
	uint8_t version;
} MW_status_t;


typedef struct {
	uint8_t fix;
	uint8_t numSat;
	int32_t latitude;
	int32_t longitude;
	int16_t altitude;
	uint16_t speed;
	int16_t ground_course;
	//int32_t distanceToHome;
	int16_t distanceToHome;
	int16_t directionToHome;
} GPS_t;

typedef struct {
	int16_t Angle[2];
	int16_t Heading;
} MW_ATTITUDE_t;

typedef struct {
	int16_t  accSmooth[3];
	int16_t  gyroData[3];
	int16_t  magADC[3];
	//int16_t  gyroADC[3];
	//int16_t  accADC[3];
} MW_imu_t;

typedef struct {
   int32_t Altitude;
   int16_t Vario;
   int16_t SonarAlt;
} MW_ALTTITUDE_t;


typedef struct {
	uint8_t VBat;
	uint16_t pMeterSum;
	uint16_t Rssi;
	uint16_t Amperage;
} MW_ANALOG_t;


struct pid_ {
	uint8_t P8;
	uint8_t I8;
	uint8_t D8;
};

typedef struct {
	pid_    pid[PIDITEMS];
	uint8_t rcRate8;
	uint8_t rcExpo8;
	uint8_t rollPitchRate;
	uint8_t yawRate;
	uint8_t dynThrPID;
	uint8_t thrMid8;
	uint8_t thrExpo8;
}conf_t;


// Settings Locations
enum Setting_ {
  S_CHECK_,					// 0 used for check
  S_RSSIMIN,    			// 1
  S_RSSIMAX,    			// 2
  S_RSSI_ALARM,				// 3
  S_MWRSSI, 				// 4
  S_PWMRSSI,				// 5
  S_PWMRSSIDIVIDER,			// 6
  S_VOLTAGEMIN,				// 7
  S_BATCELLS,				// 8
  S_DIVIDERRATIO, 			// 9
  S_MAINVOLTAGE_VBAT, 		// 10
  S_VIDDIVIDERRATIO,		// 11
  S_VIDVOLTAGE_VBAT,		// 12
  S_TEMPERATUREMAX,			// 13
  S_BOARDTYPE, 				// 14
  S_DISPLAYGPS,				// 15
  S_COORDINATES,			// 16
  S_HEADING360,				// 17
  S_UNITSYSTEM,				// 18
  S_VIDEOSIGNALTYPE, 		// 19
  S_RESETSTATISTICS, 		// 20
  S_ENABLEADC,				// 21
  S_BLINKINGHZ,    			// 22 selectable alarm blink freq
  S_MWAMPERAGE,				// 23
  S_CURRSENSSENSITIVITY, 	// 24
  S_CURRSENSOFFSET_H,		// 25
  S_CURRSENSOFFSET_L,		// 26
  S_CLIMB_RATE_ALARM,		// 27
  S_VOLUME_DIST_MAX, 		// 28
  S_VOLUME_ALT_MAX, 		// 29
  S_VOLUME_ALT_MIN,			// 30
  S_VIDVOLTAGEMIN,			// 31
  S_PITCH_WARNING,			// 32
  S_CALLSIGN,				// 33
  S_CS0,					// 34 - 10 callsign char locations
  S_CS1,					// 35
  S_CS2,					// 36
  S_CS3,					// 37
  S_CS4,					// 38
  S_CS5, 					// 39
  S_CS6,					// 40
  S_CS7,					// 41
  S_CS8,					// 42
  S_CS9,					// 43
  // EEPROM_SETTINGS must be last for H/W settings!
  EEPROM_SETTINGS,  		//44
  
// Screen item Locations
// ********* EEProm enum data position and display On/Off option for all items on screen ****************
// Enum valid for both PAL/NTSC  
  L_GPS_NUMSATPOSITIONROW,    		// 45
  L_GPS_NUMSATPOSITIONCOL,
  L_GPS_NUMSATPOSITIONDSPL,
  L_GPS_DIRECTIONTOHOMEPOSROW,
  L_GPS_DIRECTIONTOHOMEPOSCOL, 
  L_GPS_DIRECTIONTOHOMEPOSDSPL,		// 50
  L_GPS_DISTANCETOHOMEPOSROW,
  L_GPS_DISTANCETOHOMEPOSCOL,
  L_GPS_DISTANCETOHOMEPOSDSPL,
  L_SPEEDPOSITIONROW,
  L_SPEEDPOSITIONCOL,				// 55
  L_SPEEDPOSITIONDSPL,
  L_GPS_ANGLETOHOMEPOSROW,
  L_GPS_ANGLETOHOMEPOSCOL,
  L_GPS_ANGLETOHOMEPOSDSPL, 
  /*L_MW_GPS_ALTPOSITIONROW,          // Do not remove yet
  L_MW_GPS_ALTPOSITIONCOL,
  L_MW_GPS_ALTPOSITIONDSPL,*/
  L_SENSORPOSITIONROW,				// 60
  L_SENSORPOSITIONCOL,
  L_SENSORPOSITIONDSPL,
  L_MODEPOSITIONROW,
  L_MODEPOSITIONCOL, 
  L_MODEPOSITIONDSPL,				// 65
  L_MW_HEADINGPOSITIONROW,
  L_MW_HEADINGPOSITIONCOL,
  L_MW_HEADINGPOSITIONDSPL,
  L_MW_HEADINGGRAPHPOSROW,
  L_MW_HEADINGGRAPHPOSCOL,			// 70
  L_MW_HEADINGGRAPHPOSDSPL,
 /* L_TEMPERATUREPOSROW,              // Do not remove yet
  L_TEMPERATUREPOSCOL,
  L_TEMPERATUREPOSDSPL,*/

  L_MW_ALTITUDEPOSITIONROW,
  L_MW_ALTITUDEPOSITIONCOL,
  L_MW_ALTITUDEPOSITIONDSPL,
  L_CLIMBRATEPOSITIONROW,			// 75
  L_CLIMBRATEPOSITIONCOL,
  L_CLIMBRATEPOSITIONDSPL,
  L_HORIZONPOSITIONROW,
  L_HORIZONPOSITIONCOL,
  L_HORIZONPOSITIONDSPL,			// 80
  L_HORIZONSIDEREFROW,
  L_HORIZONSIDEREFCOL,
  L_HORIZONSIDEREFDSPL,
  L_HORIZONCENTERREFROW,
  L_HORIZONCENTERREFCOL,			// 85
  L_HORIZONCENTERREFDSPL,
  L_CURRENTTHROTTLEPOSITIONROW,
  L_CURRENTTHROTTLEPOSITIONCOL,
  L_CURRENTTHROTTLEPOSITIONDSPL,
  L_FLYTIMEPOSITIONROW,				// 90
  L_FLYTIMEPOSITIONCOL,
  L_FLYTIMEPOSITIONDSPL,
  L_ONTIMEPOSITIONROW,
  L_ONTIMEPOSITIONCOL,
  L_ONTIMEPOSITIONDSPL,				// 95
  L_MOTORARMEDPOSITIONROW,
  L_MOTORARMEDPOSITIONCOL,
  L_MOTORARMEDPOSITIONDSPL,
  L_MW_GPS_LATPOSITIONROW,
  L_MW_GPS_LATPOSITIONCOL,			// 100
  L_MW_GPS_LATPOSITIONDSPL,
  L_MW_GPS_LONPOSITIONROW,
  L_MW_GPS_LONPOSITIONCOL,
  L_MW_GPS_LONPOSITIONDSPL,
  L_RSSIPOSITIONROW,				// 105
  L_RSSIPOSITIONCOL,
  L_RSSIPOSITIONDSPL,
  L_VOLTAGEPOSITIONROW,
  L_VOLTAGEPOSITIONCOL,
  L_VOLTAGEPOSITIONDSPL,			// 110
  L_MAINBATLEVEVOLUTIONROW,
  L_MAINBATLEVEVOLUTIONCOL,
  L_MAINBATLEVEVOLUTIONDSPL,  
  L_VIDVOLTAGEPOSITIONROW,
  L_VIDVOLTAGEPOSITIONCOL,			// 115
  L_VIDVOLTAGEPOSITIONDSPL,
  L_AMPERAGEPOSITIONROW,
  L_AMPERAGEPOSITIONCOL,
  L_AMPERAGEPOSITIONDSPL,
  L_PMETERSUMPOSITIONROW,			// 120
  L_PMETERSUMPOSITIONCOL,
  L_PMETERSUMPOSITIONDSPL,
  L_CALLSIGNPOSITIONROW,
  L_CALLSIGNPOSITIONCOL,
  L_CALLSIGNPOSITIONDSPL,			// 125
  
  // EEPROM_ITEM_LOCATION must be last for Items location!
  EEPROM_ITEM_LOCATION				// 126
};

#endif /* TYPES_H_ */