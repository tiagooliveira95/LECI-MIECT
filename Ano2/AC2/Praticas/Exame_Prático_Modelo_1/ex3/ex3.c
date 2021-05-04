
int main(void){
    int counter = 20;
    PORTB = PORTB && 0x80FF;

    TRISBits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AS1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 0;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    int counter = 20;
    int i = 0;
    while(1){
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0);
        counter = 20;
        i = 0;
        int read = ABC1BUF0;

        while (counter != -1){
            display(counter);
            delay(20);
            if(i % getFreq(read)){
                counter--;
            }
        }
        IFS1bits.AD1IF = 0;
    }
}

void display(char value){
    char segmentCodes[] =  {
            0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,0x71
    };

    int flag = 1;

    if(flag){
        LATD = (LATD & 0x7F) | 0x20;
        LATB = (LATB & 0x80FF) | segmentCodes[value & 0x1] << 8;
    } else {
        LATD = (LATD & 0x7F) | 0x40;
        LATB = (LATB & 0x80FF) | segmentCodes[(value & 0x2) >> 1] << 8;
    }
    flag = !flag;
}


int getFreq(char val){
    return (1 / (1+(val/255))) * 1000;
}