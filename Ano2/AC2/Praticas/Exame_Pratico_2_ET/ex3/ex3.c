#include <detpic32.h>

void initUart();
void putc(char c);
void puts(char *str);

volatile char DS4, DS3, DS2, DS1;

int main(void){
    initUart();

    //interrupt setup
    U2STAbits.URXISEL = 0;              // Select interrupt only for receiver
    IPC8bits.U2IP = 1;                  // UART2 Priority
    IEC1bits.U2RXIE = 1;                // U2RX Interrupt Enable
    IFS1bits.U2RXIF = 0;                // U2RX Interrupt Flag

    TRISB = TRISB | 0x000F;		//RB[0..3] as inputs
    TRISEbits.TRISE4 = 0;
    LATEbits.LATE4 = 1;

    EnableInterrupts();

    while(1) {
        DS4 = (PORTB & 0x0008) >> 3;
        DS3 = (PORTB & 0x0004) >> 2;
        DS2 = (PORTB & 0x0002) >> 1;
        DS1 = PORTB & 0x0001;
    }
}

void _int_(32) isr_uart(void){
    if(IFS1bits.U2RXIF == 1){
        while(U2STAbits.URXDA == 0);
        char c = U2RXREG;
        putChar(c);
        if(c == 'T'){
            LATEbits.LATE4 = !LATEbits.LATE4;
        } else if (c == 'P'){
            puts("DipSwitch=");
            putc(DS4 + '0');
            putc(DS3 + '0');
            putc(DS2 + '0');
            putc(DS1 + '0');
            putc('\n');
        }
    }
    IFS1bits.U2RXIF = 0;
}

void putc(char c){
    while(U2STAbits.UTXBF == 1);
    U2TXREG = c;
}

void puts(char *str){
    while(*str != '\0'){
        putc(*str);
        str++;
    }
}

void initUart(){
    U2BRG = ((PBCLK + 8 * 9600) / (16 * 9600)) - 1;
    U2MODEbits.BRGH = 0;

    U2MODEbits.PDSEL = 2;
    U2MODEbits.STSEL = 1;

    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
    U2MODEbits.ON = 1;
}