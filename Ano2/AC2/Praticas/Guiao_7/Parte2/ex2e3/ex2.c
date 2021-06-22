#include <detpic32.h>

void configureAll();
void setPWM(unsigned int dutyCycle);

        void _int_(12) isr_T3(void) {
    IFS0bits.T3IF = 0;
}

void main(void) {
    configureAll(); // Function to configure all (digital I/O, analog
    // input, A/D module, timers T1 and T3, interrupts)
    // Reset AD1IF, T1IF and T3IF flags
    EnableInterrupts(); // Global Interrupt Enable
    while(1);
}

void setPWM(unsigned int dutyCycle) {
    // duty_cycle must be in the range [0, 100]
    OC1RS = (dutyCycle * (PR3 + 1)) / 100; // Evaluate OC1RS as a function of "dutyCycle"
}

void configureAll(){
    T3CONbits.TCKPS = 2; // 1:4 prescaler (i.e. fout_presc = 5 MHz)
    // PR3 = (5Mhz / 100Hz)-1 = 49999
    PR3 = 49999; // Fout = 20MHz / (4 * (49999 + 1)) = 100 Hz
    TMR3 = 0; // Reset timer T3 count register
    T3CONbits.TON = 1; // Enable timer T3 (must be the last command of the timer configuration sequence)

    IFS0bits.T3IF = 0; // Reset timer T3 interrupt flag
    IPC3bits.T3IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T3IE = 1; // Enable timer T3 interrupts

    // OC1RS = (PR2+1 * duty-cycle) / 100
    // OC1RS = (50000 * 25 / 100) = 12500

    OC1CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC1CONbits.OCTSEL = 1; // Use timer T3 as the time base for PWM generation
    setPWM(25);
    OC1CONbits.ON = 1; // Enable OC1 module
}
