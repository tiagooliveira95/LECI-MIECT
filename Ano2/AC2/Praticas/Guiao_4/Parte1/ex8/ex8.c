#include <detpic32.h>

void delay(int);

int main(void) {
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

    int segment;
    TRISB = (TRISB & 0x80FF) | 0xF;     // sets RB8-RB14 as output and RB0-RB as input
    TRISD = TRISD & 0xFF9F;             // sets RB5-RB8 as output
    LATD = (LATD & 0xFF9F) | 0x20;      // sets RD6 and RD5 to 0 then sets RD5 to 1

    while (1) {
        int dipValue = PORTB & 0xF;
        LATB = (LATB & 0x80FF) | *(display7Scodes + dipValue) << 8;
    }
    return 0;
}
