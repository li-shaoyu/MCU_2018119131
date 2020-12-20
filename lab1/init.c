#define __init_c
#include "includeAll.h"
//=============================================================================
void SysInit() {
 F_clearWDT();  //启动后立即清除看门狗
  //时钟初始化
 CLKCON = 0x03; // Clock div 1// Clock div 1
  STPPCK = 0;
  STPFCK = 0;
  _nop_();
  _nop_();
  _nop_();
  _nop_();
  _nop_();
  SELFCK = 1;
  _nop_();
  _nop_();
  _nop_();
  _nop_();
  _nop_();
  _nop_();
  _nop_();
  _nop_();
  _nop_();
  _nop_();
  

  // IO 模式初始化为推挽输出
 P1MODL = 0xaa;       
  // IO 状态初始化
  F_led1Off();      //LED灯初始化为低电平状态（不亮）
  F_led2Off();
  F_led3Off();
  
}
//=============================================================================
void VarsInit() {} 