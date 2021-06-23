#include <detpic32.h>

void config();
void setPwm(int dutyCycle);
void delay(int micros);

int main(void){
    config();

    TRISB = TRISB | 0x9; // set RB3 e RB0 como input

    while(1){
        int dipVal = PORTB & 0xFFF0;
        if(dipVal == 1){
            //25%
            setPwm(25);
        }else if(dipVal == 8){
            //70%
            setPwm(70);
        }

        delay(250); //Delay 250 micro sec
    }

}

void config() {
    T2CONbits.TCKPS = 2;    // 1:2 prescaler (i.e. fout_presc = 5Mhz)
    // PR2 = (5MHz / 280 Hz)-1 = 17856
    PR2 = 17856;            // Fout = 20MHz / (4 * (17856 + 1)) = 280.00 Hz
    TMR2 = 0;               // Reset timer T2 count register
    T2CONbits.TON = 1;      // Enable timer T2 (must be the last command of the
    // timer configuration sequence)

    IFS0bits.T2IF = 0; // Reset timer T2 interrupt flag
    IPC2bits.T2IP = 2; // Interrupt priority (must be in range [1..6])
    IEC0bits.T2IE = 1; // Enable timer T2 interrupts
}

void setPwm(int dutyCycle){
    OC2CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC2CONbits.OCTSEL = 0;// Use timer T2 as the time base for PWM generation
    OC2RS = ( (PR2 + 1) * dutyCycle) / 100;
    OC2CONbits.ON = 1; // Enable OC1 module
}

void delay(int micros){
    for(;micros > 0; micros--){
        resetCoreTimer();
        while(readCoreTimer() < 5000);
    }
}
