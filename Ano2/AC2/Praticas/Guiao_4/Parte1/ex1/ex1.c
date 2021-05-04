#include "/opt/pic32mx/include/detpic32.h"

void delay(int);

int main(void){
    LATCbits.LATC14 = 0;
    TRISCbits.TRISC14 = 0;

    while(1){
        delay(500);
        LATCbits.LATC14 = !LATCbits.LATC14;
    }
    return 0;
}

void delay(int ms){
    for(; ms > 0; ms--) {
        resetCoreTimer();
        while(readCoreTimer() < 20000);
    }
}