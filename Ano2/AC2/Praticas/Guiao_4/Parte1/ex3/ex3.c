#include <detpic32.h>

void delay(int);

int main(void){
    TRISB = TRISB & 0x00FF;
    TRISD = TRISD & 0xFF9F;
    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 0;
    LATB = (LATB & 0x80FF);

    int counter = 0;
    while(1){
        switch (getChar()) {
            case 'A':
            case 'a':
                LATB = (LATB & 0x80FF) | 0x100;
                break;
            case 'B':
            case 'b':
                LATB = (LATB & 0x80FF) | 0x200;
        }

        char c = getChar();
        int val;

        if (c >= 'a' && c <= 'g')
            val = 6 - ('g' - c);
        else if (c >= 'A' && c <= 'G')
            val = 6 - ('G' - c);
        else
            continue;

        LATB = (LATB & 0x80FF) | 0x100 << val;
    }
    return 0;
}

void delay(int ms){
    for(; ms > 0; ms--) {
        resetCoreTimer();
        while(readCoreTimer() < 20000);
    }
}