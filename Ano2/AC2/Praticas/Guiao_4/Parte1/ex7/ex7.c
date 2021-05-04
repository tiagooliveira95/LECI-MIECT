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
    TRISB = TRISB & 0x80FF; // sets RB8-RB14 as output
    TRISD = TRISD & 0xFF9F; // sets RB5-RB8 as output
    LATD = (LATD & 0xFF9F) | 0x40;  // sets RD6 and RD5 to 0 then sets RD6 to 1

    while (1) {
        LATD = LATD ^ 0x60;             // inverts RD6 & RD4 with XOR operation

        segment = 1;
        char *code;

        for (code = display7Scodes; code <= display7Scodes + 15; code++) {
            LATB = (LATB & 0x80FF) | *code << 8;
            delay(500);
        }
    }
    return 0;
}

void delay(int ms) {
    for (; ms > 0; ms--) {
        resetCoreTimer();
        while (readCoreTimer() < 20000);
    }
}
