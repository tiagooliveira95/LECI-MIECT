#include <detpic32.h>

void display(char value);
void delay(int ms);

int main(void){
    TRISB = TRISB && 0x80FF | 0xF;
    TRISD = TRISD & 0xFF9F;

    int i;
    int counter = 0;
    while(1){
        char c = getChar();
        i = 0;

        if(c >= '0' && c <= '3'){
            do{
                display(c-0x30);
                delay(10);
            }while(++i < 20);

        }else{
            do{
                display(0xFF);
                delay(10);
            }while(++i < 100);
        }
        LATD = (LATD & 0x9F);
    }
}

void display(char value){
    char segmentCodes[] =  {
            0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,0x71
    };

    static char flag = 1;

    if(flag == 1){
        LATD = (LATD & 0x9F) | 0x40;
        LATB = (LATB & 0x80FF) | segmentCodes[value >> 4] << 8;
    } else {
        LATD = (LATD & 0x9F) | 0x20;
        LATB = (LATB & 0x80FF) | segmentCodes[value & 0x0F] << 8;
    }
    flag = !flag;
}

void delay(int ms) {
    for (; ms > 0; ms--) {
        resetCoreTimer();
        while (readCoreTimer() < 20000);
    }
}