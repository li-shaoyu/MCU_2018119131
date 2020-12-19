#define __main_c
#include "includeAll.h"
//=============================================================================

void main() {
  
  SysInit();
  VarsInit();

  //使能看门狗
  F_turnOnWDT();
  while (1) {
  //喂狗
  //流水灯效果
  //点亮LED1随即灭掉
  F_led1On();
  DelayMs(500);
  F_led1Off();
  //点亮LED2随即灭掉
  F_led2On();
  DelayMs(500);
  F_led2Off();
  //点亮LED3随即灭掉
  F_led3On();
  DelayMs(500);
  F_led3Off();

  }
}

//=============================================================================
void DelayMs(uint16_t msCount) {
 uint16_t i,j;
  for ( i = 0; i < msCount; i++) {
          for ( j = 0; j < 1000; j++) {
            F_clearWDT();
    }
          }
  }


