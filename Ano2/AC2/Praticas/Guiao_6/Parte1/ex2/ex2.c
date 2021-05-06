#include <detpic32.h>

void delay(int);
void send2displays(unsigned char);
unsigned char toBcd(unsigned char);

volatile unsigned char voltage = 0;

// Interrupt Handler
void _int_(27) isr_adc(void){ // Replace VECTOR by the A/D vector number - see "PIC32 family data sheet" (pages 74-76)
    int *p = (int *)(&ADC1BUF0);
    int i;
    int tempV = 0;
    for( i = 0; i < 8; i++ ) {
        tempV += (p[i*4]*33+511)/1023;
    }

    tempV /= 8;
    voltage = toBcd(tempV);
    IFS1bits.AD1IF = 0;                    // Reset AD1IF flag
}

int main(void) {
    unsigned int cnt = 0;
    TRISB = (TRISB & 0x80FF) | 0xF;     // sets RB8-RB14 as output and RB0-RB as input
    TRISD = TRISD & 0xFF9F;             // sets RD5-RD8 as output
    LATD = (LATD & 0xFF9F) | 0x40;      // sets RD6 and RD5 to 0 then sets RD6 to 1
    // Configure A/D module
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 8 - 1;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;


    // Configure interrupt system
    IPC6bits.AD1IP = 2;  // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0;  // clear A/D interrupt flag
    IEC1bits.AD1IE = 1;  // enable A/D interrupts
    EnableInterrupts(); // Global Interrupt Enabled



    while (1){
        if(cnt % 25  == 0){
            AD1CON1bits.ASAM = 1;           // Start conversion
        }
        send2displays(voltage);
        cnt++;
        delay(10);
    }

    return 0;                               // useless return 🤷‍
}


void send2displays(unsigned char value) {
    static char displayFlag = 0;
    char display7Scodes[] = {
            0x3F, //0
            0x06, //1
            0x5B, //2
            0x4F, //3
            0x66, //4
            0x6D, //5
            0x7D, //6
            0x07, //7
            0x7F, //8
            0x6F, //9
            0x77, //A
            0x7C, //b
            0x39, //C
            0x5E, //d
            0x79, //E
            0x71  //F
    };

    unsigned char dh = display7Scodes[value >> 4];      // Get the value at 7..4
    unsigned char dl = display7Scodes[value & 0x0F];    // Get the value at 3..0

    if (displayFlag == 1) {
        LATD = (LATD | 0x0040) & 0xFFDF;    //  activate display high & deactivate display low
        LATB = (LATB & 0x00FF) | dh  << 8;   //  set display high value
    } else {                      // wait
        LATD = (LATD | 0x0020) & 0xFFBF;    //  activate display low & deactivate display high
        LATB = (LATB & 0x80FF) | dl<< 8;   //  set display low value
    }
    displayFlag = !displayFlag;
}

unsigned char toBcd(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
}

void delay(int ms) {
    for (; ms > 0; ms--) {
        resetCoreTimer();
        while (readCoreTimer() < 20000);
    }
}

