//=============================================================================
// Name		:isr.c
// Purpose	:Interrupt Service Routines
//=============================================================================
#define __isr_c

#include "includeAll.h"
//=============================================================================
// Function:	void INT0_int(void)
// Purpose:	INT0 pin interrupt vector
// Input:	none
// OutPut:	none
// Author:
//=============================================================================
void INT0_int(void) interrupt 0 {
  IE0 = 0; // clear interrupt flag
}
//=============================================================================
// Function:	void TIMER0_int(void) 
// Purpose:	TIMER0 interrupt vector
// Input:	none
// OutPut:	none
// Author:
//=============================================================================
void TIMER0_int(void) interrupt 1 {
  TF0 = 0; // clear interrupt flag
  //------------
}
//=============================================================================
// Function:	void INT1_int(void)
// Purpose:	INT1 pin interrupt vector
// Input:	none
// OutPut:	none
// Author:
//=============================================================================
void INT1_int(void) interrupt 2 {
  IE1 = 0; // clear interrupt flag
}
//=============================================================================
// Function:	void TIMER1_int(void)
// Purpose:	TIMER1 interrupt vector
// Input:	none
// OutPut:	none
// Author:
//=============================================================================
void TIMER1_int(void) interrupt 3 {
  TF1 = 0; // clear interrupt flag
}
//=============================================================================
// Function:	void UART_int(void)
// Purpose:	UART interrupt vector
// Input:	none
// OutPut:	none
// Author:
//=============================================================================
void UART_int(void) interrupt 4 {
  TI = 0; // clear interrupt flag
  RI = 0; // clear interrupt flag
}
//=============================================================================
// Function:	void TIMER2_int(void)
// Purpose:	TIMER2 interrupt vector
// Input:	none
// OutPut:	none
// Author:
//=============================================================================
void TIMER2_int(void) interrupt 5 {
  TF2 = 0; // clear interrupt flag
  b1ms = 1;
  vData++;
  if (vData == 0xff) {
    vData = 0;
  }
}
//=============================================================================
// Function:	void TIMER3_int(void)
// Purpose:	TIMER3 interrupt vector
// Input:	none
// OutPut:	none
// Author:
//=============================================================================
void TIMER3_int(void) interrupt 7 { INTFLAG &= ~TF3; }
//=============================================================================
// Function:	void P1_int(void)
// Purpose:	P1 pin interrupt vector
// Input:	none
// OutPut:	none
// Author:
//=============================================================================
void P1_int(void) interrupt 8 { INTFLAG &= ~P1IF; }
//=============================================================================
// Function:	void INT2_int(void)
// Purpose:	INT2 pin interrupt vector
// Input:	none
// OutPut:	none
// Author:
//=============================================================================
void INT2_int(void) interrupt 9 { INTFLAG &= ~IE2; }
//=============================================================================
// Function:	void ADC_TK_int(void)
// Purpose:	ADC&TOUCHKEY interrupt vector
// Input:	none
// OutPut:	none
// Author:
//=============================================================================
void ADC_TK_int(void) interrupt 10 {
  INTFLAG &= ~ADIF;
  INTFLAG &= ~TKIF;
  TKCON2 &= ~TKAUTO; // disable touch key auto scan
}
