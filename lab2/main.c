#define __main_c
#include "includeAll.h"


//=============================================================================
void main() {
  SysInit();
  VarsInit();
  F_ledOn();
  D(500);
  while (1) {
    //喂狗
     //F_turnOnWDT();
     //user coding
     //F_ledOff();
     //D(500);
     //F_ledOn();
     //D(500);
   GetKeys();
    if (D_keyValue1 == keyValue) {
      F_ledNeg();
    }
    keyValue = D_keyNull;
  }
}
//=============================================================================
void DelayMs(uint16_t msCount) {
  uint16_t i, j;
  for (i = 0; i < msCount; i++) {
    for (j = 0; j < 1000; j++) {
      /* code */
      // F_turnOnWDT();
    }
  }
}
