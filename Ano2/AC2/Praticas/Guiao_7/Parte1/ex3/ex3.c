#include <detpic32.h>

void configIO();

void main(void) {
    configIO();
    // Configure Timer T3 with inte brrupts enabled
    EnableInterrupts();
    while (1);
}

void configIO() {
    T3CONbits.TCKPS = 7; // define o Prescaler ara dividir o clock por 256
    // fOut_PRESC = 20Mhz / 256 = 78125Hz
    // PR3 = (78125Hz / 2 Hz) + 1 = 39061.5
    PR3 = 39062; // Fout = 20MHz / (39062 + 1) = 78125/39063 ~ 1.999 Hz
    TMR3 = 0; // Reset timer T3 count register
    T3CONbits.TON = 1; // Enable timer T3 (must be the last command)

    IFS0bits.T3IF = 0;      // Reset timer T3 interrupt flag, should be set before enabling interrupts
    IPC3bits.T3IP = 2;      // Interrupt priority 2
    IEC0bits.T3IE = 1;      // Enable timer T3 interrupts
}

volatile char flag = 0;

void _int_(12) isr_T3(void) // Replace VECTOR by the timer T3
// vector number
{
    if (flag == 1) {
        putChar('.');
        flag = 0;
    } else {
        flag = 1;
    }

    // Reset T3 interrupt flag
    IFS0bits.T3IF = 0;
}
