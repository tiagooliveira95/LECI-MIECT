#include <detpic32.h>

void delay(int);

int main(void){
    unsigned char segment;
    TRISB = TRISB & 0x80FF; // sets RB8-RB14 as output
    TRISD = TRISD & 0xFF9F; // sets RB5-RB8 as output
    LATDbits.LATD5 = 0;     // display low inactive
    LATDbits.LATD6 = 1;     // display high inactive

    while(1){
        LATDbits.LATD5 = !LATDbits.LATD5; //
        LATDbits.LATD6 = !LATDbits.LATD6; // toggle display selection
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
