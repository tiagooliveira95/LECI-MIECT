#include <detpic32.h>

void configIO();

void main(void) {
    configIO();
    // Configure Timer T3 with inte brrupts enabled
    EnableInterrupts();
    while (1);
}

void configIO() {
    T1CONbits.TCKPS = 7; // define o Prescaler ara dividir o clock por 256
    T3CONbits.TCKPS = 5; // define o Prescaler ara dividir o clock por 32


    // fOut_PRESC = 20Mhz / 256 = 78125Hz
    // PR1 = (78125Hz / 2 Hz) - 1 = 39061.5
    PR1 = 39062; // Fout = 20MHz / (39062 + 1) = 78125/39063 ~ 1.999 Hz

    // fOut_PRESC = 20Mhz / 32 = 625000Hz
    // PR3 = (625000Hz / 10 Hz) - 1 = 62500
    PR3 = 62500; // Fout = Fout_presc / 62500 + 1= 625000/62501 ~ 9.999 Hz

    TMR1 = 0; // Reset timer T1 count register
    TMR3 = 0; // Reset timer T3 count register

    T1CONbits.TON = 1; // Enable timer T1 (must be the last command)
    T3CONbits.TON = 1; // Enable timer T3 (must be the last command)


    IFS0bits.T1IF = 0;      // Reset timer T1 interrupt flag, should be set before enabling interrupts
    IFS0bits.T3IF = 0;      // Reset timer T1 interrupt flag, should be set before enabling interrupts

    IPC1bits.T1IP = 2;      // Interrupt priority 2
    IPC3bits.T3IP = 2;      // Interrupt priority 2

    IEC0bits.T1IE = 1;      // Enable timer T1 interrupts
    IEC0bits.T3IE = 1;      // Enable timer T1 interrupts
}


void _int_(12) isr_T3(void) {
    putChar('3');

    // Reset T3 interrupt flag
    IFS0bits.T3IF = 0;
}

void _int_(4) isr_T1(void) {
    putChar('1');

    // Reset T1 interrupt flag
    IFS0bits.T1IF = 0;
}
