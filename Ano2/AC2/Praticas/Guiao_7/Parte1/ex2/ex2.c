#include <detpic32.h>


void main(void)
{
    T3CONbits.TCKPS = 7; // 1:256 prescaler (i.e Fout_presc = 78125 KHz)
    PR3 = 39063; // Fout = 20MHz / (32 * (39063 + 1)) = 1.999 Hz
    TMR3 = 0; // Reset timer T3 count register
    T3CONbits.TON = 1; // Enable timer T3 (must be the last command of the

    IPC3bits.T3IP = 2;      // Interrupt priority 2
    IEC0bits.T3IE = 1;      // Enable timer T3 interrupts
    IFS0bits.T3IF = 0;      // Reset timer T3 interrupt flag

    // Configure Timer T3 with interrupts enabled
    EnableInterrupts();
    while(1);
}


void _int_(12) isr_T3(void) // Replace VECTOR by the timer T3
// vector number
{
    putChar('.');
    // Reset T3 interrupt flag
    IFS0bits.T3IF = 0;

}