#include <detpic32.h>

void send2displays(unsigned char);
unsigned char toBcd(unsigned char);
void delay(int);

int main(){
    TRISBbits.TRISB4    = 1;    // RB4 digital output disconnected
    AD1PCFGbits.PCFG4   = 0;    // RB4 configured as analog input (AN4)
    AD1CON1bits.SSRC    = 7;    // Conversion trigger selection bits: in this
                                //  mode an internal counter ends sampling and
                                //  starts conversion
    AD1CON1bits.CLRASAM = 1;    // Stop conversions when the 1st A/D converter
                                //  interrupt is generated. At the same time,
                                //  hardware clears the ASAM bit
    AD1CON3bits.SAMC = 16;      // Sample time is 16 TAD (TAD = 100 ns)
    AD1CON2bits.SMPI =  4-1;    // Interrupt is generated after 4 samples
                                //  (replace XX by the desired number of
                                //  consecutive samples)
    AD1CHSbits.CH0SA = 4;       // replace x by the desired input
                                //  analog channel (0 to 15)
    AD1CON1bits.ON = 1;         // Enable A/D converter
                                //  This must the last command of the A/D
                                //  configuration sequence

    TRISB = (TRISB & 0x80FF) | 0xF;     // sets RB8-RB14 as output and RB0-RB as input
    TRISD = TRISD & 0xFF9F;             // sets RB5-RB8 as output
    LATD = (LATD & 0xFF9F) | 0x40;      // sets RD6 and RD5 to 0 then sets RD6 to 1

    int i = 0;
    int count = 0;
    int volts = 0;
    while(1) {
        if(i++ % 25 == 0) {                             // 0, 250ms, 500ms, 750ms, ...
            AD1CON1bits.ASAM = 1;                       // Start conversion
            while(IFS1bits.AD1IF == 0);                 // Wait while conversion not done
            int *p = (int *)(&ADC1BUF0);
            count = 0;
            for (i = 0; i < 4; i++) {                   // Convert analog input (4 samples)
                count += p[i*4];
            }
            volts = ((count*33+511)/1023) / 4;
        }
        send2displays(toBcd(volts));    // Send voltage value to displays
        delay(10);                  // Wait 10 ms (using the core timer)
        IFS1bits.AD1IF = 0;             // Reset AD1IF
    }
    return 0;
}


unsigned char toBcd(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
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
        LATB = (LATB & 0x80FF) | dh << 8;   //  set display high value
    } else {                      // wait
        LATD = (LATD | 0x0020) & 0xFFBF;    //  activate display low & deactivate display high
        LATB = (LATB & 0x80FF) | dl << 8;   //  set display low value
    }
    displayFlag = !displayFlag;
}

void delay(int ms) {
    for (; ms > 0; ms--) {
        resetCoreTimer();
        while (readCoreTimer() < 20000);
    }
}
