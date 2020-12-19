#ifndef __display_h
#define __display_h
// 分别定义P_led1、P_led1、P_led1为p11、p12、p13引脚
#define P_led1 P1_1
#define P_led2 P1_2
#define P_led3 P1_3
// 定义高低电平变量
#define D_ledOn 1  //高电位亮
#define D_ledOff 0 //低点位灭
// Globle Var -----------------------------------------
#ifdef __display_c

#else

#endif

// 定义LED1亮灯、关灯函数
#define F_led1On()  P_led1 = D_ledOn
#define F_led1Off() P_led1 = D_ledOff

// 定义LED2亮灯、关灯函数
#define F_led2On() P_led2 = D_ledOn
#define F_led2Off() P_led2 = D_ledOff

// 定义LED3亮灯、关灯函数
#define F_led3On() P_led3 = D_ledOn
#define F_led3Off() P_led3 = D_ledOff 
// Function ------------------------------------

#endif 