#include<detpic32.h>

volatile int adc_value;
/*
 * Para a placa DETPIC32-IO foi usado o testpoint OC1 em vez do RE0
 */
// Interrupt Handler
void _int_(27) isr_adc(void){ // Replace VECTOR by the A/D vector number - see "PIC32 family data sheet" (pages 74-76)
    LATDbits.LATD0 = 0;                    // OC1 = 0
    adc_value = ADC1BUF0;
    LATDbits.LATD0 = 1;                    // OC1 = 1

    printInt10(readCoreTimer()*50);
    printStr(" ns\n");

    resetCoreTimer();
    AD1CON1bits.ASAM = 1;                  // Start conversion
    IFS1bits.AD1IF = 0;                    // Reset AD1IF flag
}

int main(void) {
    TRISDbits.TRISD0 = 0;

    // Configure A/D module
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 1 - 1;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    // Configure interrupt system
    IPC6bits.AD1IP = 2;  // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0;  // clear A/D interrupt flag
    IEC1bits.AD1IE = 1;  // enable A/D interrupts
    EnableInterrupts(); // Global Interrupt Enabled


    AD1CON1bits.ASAM = 1;           // Start conversion

    while (1){}

    return 0;
}
