#include <detpic32.h>

void main(){
    T3CONbits.TCKPS = 7; // 1:256 prescaler (i.e Fout_presc = 78125 KHz)
    PR3 = 39063; // Fout = 20MHz / (32 * (39063 + 1)) = 1.999 Hz
    TMR3 = 0; // Reset timer T3 count register
    T3CONbits.TON = 1; // Enable timer T3 (must be the last command of the

    // Configure Timer T3 (2 Hz with interrupts disabled)
    while(1)
    {
        // Wait until T3IF = 1
        while (IFS0bits.T3IF != 1);
        // Reset T3IF
        IFS0bits.T3IF = 0;
        putChar('.');
    }
}