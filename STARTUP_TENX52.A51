$NOMOD51
;------------------------------------------------------------------------------
;Description:
;  This code is executed after a reset.  Besides the usual C51 startup 
;  settings, Some specific TM52FXXXX  initializations are done here such as the
;  LCD RAM clear. When the startup code execution is complete, this code jumps to ?C_START that 
;  is typically the main() function in the C code.
;  
;
;  This example demo code is provided as is and has no warranty,
;  implied or otherwise.  You are free to use/modify any of the provided
;  code at your own risk in your applications with the expressed limitation
;  of liability  so long as your product using the code contains
;  at least one TM52FXXXX product (device).
;------------------------------------------------------------------------------
;  User-defined <h> Power-On Initialization of Memory 
;
;  With the following EQU statements the initialization of memory
;  at processor reset can be defined:
;
; <o> IDATALEN: IDATA memory size <0x0-0x100>
;     <i> Note: The absolute start-address of IDATA memory is always 0
;     <i>       The IDATA space overlaps physically the DATA and BIT areas.
IDATALEN        EQU     80H   ; the length of IDATA memory in bytes to clear
;
; <o> XDATASTART: XDATA memory start address <0x0-0xFFFF> 
;     <i> The absolute start address of XDATA memory
;     <i> TM52FXXXX users need to fill this in based on where SRAM memory mapped.
XDATAEND        EQU     0FFFFH ; the absolute end-address of XDATA memory
;
; <o> XDATALEN: XDATA memory size <0x0-0xFFFF> 
;     <i> The length of XDATA memory in bytes.
;     <i> NOTE: The length equates for XDATALEN  should be changed to 
;     <i>       non-zero values indicating the amount of XDATA 
;     <i>       memory to be initialized to 0x00.  The start address equates 
;     <i>       (XDATASTART ) must be set to the respective starting
;     <i>       addresses as mapped in TM52FXXXX if the memory is to be initialized.
XDATALEN        EQU     0H      ; the length of XDATA memory in bytes to clear.
;
; <o> LCDDATASTART: LCD DATA memory start address <0x0-0xFFFF> 
;     <i> The absolute start address of LCD DATA memory
;     <i> TM52XX users need to fill this in based on where LCD DATA memory mapped.
LCDDATASTART    EQU     0F000H  ; the absolute start-address of LCD DATA memory
;
; <o> LCDDATALEN: XDATA memory size <0x0-0xFF> 
;     <i> The length of LCD DATA memory in bytes.
;     <i> NOTE: The length equates for LCDDATALEN should be changed to 
;     <i>       non-zero values indicating the amount of LCD DATA 
;     <i>       memory to be initialized to 0x00.  The start address equates 
;     <i>       (LCDDATASTART) must be set to the respective starting
;     <i>       addresses as mapped in TM52FXXXX if the memory is to be initialized.
LCDDATALEN      EQU     0H      ; the length of XDATA memory in bytes to clear.
;
; <o> PDATASTART: PDATA memory start address <0x0-0xFFFF> 
;     <i> The absolute start address of PDATA memory
PDATASTART      EQU     0H		; the absolute start-address of PDATA memory
;
; <o> PDATALEN: PDATA memory size <0x0-0xFF> 
;     <i> The length of PDATA memory in bytes.
PDATALEN        EQU     0H		; the length of PDATA memory in bytes to clear.
;
;</h>
;------------------------------------------------------------------------------
;
;<h> Reentrant Stack Initialization
;
;  The following EQU statements define the stack pointer for reentrant
;  functions and initialized it:
;
; <h> Stack Space for reentrant functions in the SMALL model.
;  <q> IBPSTACK: Enable SMALL model reentrant stack
;     <i> Stack space for reentrant functions in the SMALL model.
IBPSTACK        EQU     0           ; set to 1 if small reentrant is used.
;  <o> IBPSTACKTOP: End address of SMALL model stack <0x0-0xFF>
;     <i> Set the top of the stack to the highest location.
IBPSTACKTOP     EQU     0xFF +1     ; default 0FFH+1  
; </h>
;
; <h> Stack Space for reentrant functions in the LARGE model.      
;  <q> XBPSTACK: Enable LARGE model reentrant stack
;     <i> Stack space for reentrant functions in the LARGE model.
XBPSTACK        EQU     0           ; set to 1 if large reentrant is used.
;  <o> XBPSTACKTOP: End address of LARGE model stack <0x0-0xFFFF>
;     <i> Set the top of the stack to the highest location.
XBPSTACKTOP     EQU     0xFFFF +1   ; default 0FFFFH+1 
; </h>
;
; <h> Stack Space for reentrant functions in the COMPACT model.    
;  <q> PBPSTACK: Enable COMPACT model reentrant stack
;     <i> Stack space for reentrant functions in the COMPACT model.
PBPSTACK        EQU     0           ; set to 1 if compact reentrant is used.
;
;   <o> PBPSTACKTOP: End address of COMPACT model stack <0x0-0xFFFF>
;     <i> Set the top of the stack to the highest location.
PBPSTACKTOP     EQU     0xFF +1     ; default 0FFH+1  
;</h>
;</h>
;------------------------------------------------------------------------------
;
;  Memory Page for Using the Compact Model with 64 KByte xdata RAM
;  <e>Compact Model Page Definition
;
;  <i>Define the XDATA page used for PDATA variables. 
;  <i>PPAGE must conform with the PPAGE set in the linker invocation.
;
; Enable pdata memory page initalization
PPAGEENABLE     EQU     0           ; set to 1 if pdata object are used.
;
; <o> PPAGE number <0x0-0xFF> 
; <i> uppermost 256-byte address of the page used for PDATA variables.
PPAGE           EQU     0
;
; <o> SFR address which supplies uppermost address byte <0x0-0xFF> 
; <i> most 8051 variants use P2 as uppermost address byte
PPAGE_SFR       DATA    0A0H
;
; </e>
;; </e>
;;------------------------------------------------------------------------------

; Standard SFR Symbols 
ACC     DATA    0E0H
B       DATA    0F0H
SP      DATA    81H
DPL     DATA    82H
DPH     DATA    83H

                NAME    ?C_STARTUP


?C_C51STARTUP   SEGMENT   CODE
?STACK          SEGMENT   IDATA

                RSEG    ?STACK
                DS      1

                EXTRN CODE (?C_START)
                PUBLIC  ?C_STARTUP

                CSEG    AT      0
?C_STARTUP:     LJMP    STARTUP1

                RSEG    ?C_C51STARTUP

STARTUP1:

IF IDATALEN <> 0
                MOV     R0,#IDATALEN - 1
                CLR     A
IDATALOOP:      MOV     @R0,A
                DJNZ    R0,IDATALOOP
ENDIF

IF XDATALEN <> 0
                MOV     DPTR,#(XDATAEND-XDATALEN)+1
                MOV     R7,#LOW (XDATALEN)
  IF (LOW (XDATALEN)) <> 0
                MOV     R6,#(HIGH (XDATALEN)) +1
  ELSE
                MOV     R6,#HIGH (XDATALEN)
  ENDIF
                CLR     A
XDATALOOP:      MOVX    @DPTR,A
                INC     DPTR
                DJNZ    R7,XDATALOOP
                DJNZ    R6,XDATALOOP
ENDIF

IF LCDDATALEN <> 0
                MOV     DPTR,#LCDDATASTART
                MOV     R7,#LCDDATALEN
                CLR     A
LCDDATALOOP:    MOVX    @DPTR,A
                INC     DPTR
                DJNZ    R7,LCDDATALOOP
ENDIF


IF PPAGEENABLE <> 0
                MOV     PPAGE_SFR,#PPAGE
ENDIF

IF PDATALEN <> 0
                MOV     R0,#LOW (PDATASTART)
                MOV     R7,#LOW (PDATALEN)
                CLR     A
PDATALOOP:      MOVX    @R0,A
                INC     R0
                DJNZ    R7,PDATALOOP
ENDIF

IF IBPSTACK <> 0
EXTRN DATA (?C_IBP)

                MOV     ?C_IBP,#LOW IBPSTACKTOP
ENDIF

IF XBPSTACK <> 0
EXTRN DATA (?C_XBP)

                MOV     ?C_XBP,#HIGH XBPSTACKTOP
                MOV     ?C_XBP+1,#LOW XBPSTACKTOP
ENDIF

IF PBPSTACK <> 0
EXTRN DATA (?C_PBP)
                MOV     ?C_PBP,#LOW PBPSTACKTOP
ENDIF

                MOV     SP,#?STACK-1  ; init SP for hardware stack 

; This code is required if you use L51_BANK.A51 with Banking Mode 4
;<h> Code Banking
; <q> Select Bank 0 for L51_BANK.A51 Mode 4
#if 0   
;     <i> Initialize bank mechanism to code bank 0 when using L51_BANK.A51 with Banking Mode 4.
EXTRN CODE (?B_SWITCH0)
                CALL    ?B_SWITCH0      ; init bank mechanism to code bank 0
#endif
;</h>
                LJMP    ?C_START    ;call main() function in the C code

                END
