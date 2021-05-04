#include <detpic32.h>

void delay(int);

int main(void){
    unsigned char segment;
    TRISB = TRISB & 0x80FF; // sets RB8-RB14 as output
    TRISD = TRISD & 0xFF9F; // sets RB5-RB8 as output
    LATD = (LATD & 0xFF9F) | 0x40;  // sets RD6 and RD5 to 0 then sets RD6 to 1

    while(1){
        LATD = LATD ^ 0x60;             // inverts RD6 & RD4 with XOR operation

        segment = 1;
        int i;
        for(i = 0;i<7;i++){
            LATB = (LATB & 0x80FF) | segment << 8;
            delay(500);
            segment = segment << 1;
        }
    }
    return 0;
}

void delay(int ms){
    for(; ms > 0; ms--) {
        resetCoreTimer();
        while(readCoreTimer() < 20000);
    }
}
