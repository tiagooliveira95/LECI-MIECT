#include <detpic32.h>

void send2displays(unsigned char);
void delay(int);

int main(void) {
    TRISB = (TRISB & 0x80FF) | 0xF;     // sets RB8-RB14 as output and RB0-RB as input
    TRISD = TRISD & 0xFF9F;             // sets RB5-RB8 as output
    LATD = (LATD & 0xFF9F) | 0x40;      // sets RD6 and RD5 to 0 then sets RD6 to 1

    int i;
    unsigned char cnt = 0;

    while (1) {
        while (1) {
            i++;
            cnt &= 0xff;
            send2displays(cnt);
            delay(10);
            if (i % 20 == 0) cnt++;
        }
    }
    return 0;
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

    if(displayFlag == 1) {
        LATD = (LATD | 0x0040) & 0xFFDF;    //  activate display high & deactivate display low
        LATB = (LATB & 0x80FF) | dh << 8;   //  set display high value
    }else {                      // wait
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
