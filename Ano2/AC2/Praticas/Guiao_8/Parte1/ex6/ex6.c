#include <detpic32.h>

void delay(int ms);
void putc(char byte2send);
void configUart(unsigned int baud, char parity, unsigned int stopbits);

int main(void){
    configUart(115200,'N',1);

    TRISB = TRISB & 0x8F; // enable RB6
    int time;

    while(1){
        while(U2STAbits.TRMT != 1);
        resetCoreTimer();
        PORTB = PORTB | 0x90; // RB6 = 1
        puts("12345");
        time = 50 * readCoreTimer();
        PORTB = PORTB & 0x8F; // RB6 = 0
        printInt10(time);
        putChar('\n');
    }
}

void puts(char *str){
    while (*str != '\0'){
        putc(*str);
        str++;
    }
}

void putc(char byte2send) {
    // wait while UTXBF == 1
    while(U2STAbits.UTXBF == 1);
    // Copy byte2send to the UxTXREG register
    U2TXREG = byte2send;
}

void delay(int ms) {
    for (; ms > 0; ms--){
        resetCoreTimer();
        while (readCoreTimer() < 20000);
    }
}

void configUart(unsigned int baud, char parity, unsigned int stopbits) {
    // Configure BaudRate Generator
    if (baud >= 600 && baud <= 115200) {
        U2BRG = ((PBCLK + 8 * baud) / (16 * baud)) - 1;
    } else {
        U2BRG = 10;
    }
    // Configure number of data bits (8), parity and number of stop bits

    switch (parity) {
        case 'E':
            U2MODEbits.PDSEL = 1; // 8-bit, even parity
            break;
        case 'O':
            U2MODEbits.PDSEL = 2; // 8-bit, odd parity
            break;
        default:
            U2MODEbits.PDSEL = 0; // 8-bit, no parity
            break;
    }

    if (stopbits == 1 || stopbits == 2) {
        U2MODEbits.STSEL = stopbits - 1;    // stop bit
    }   else {
        U2MODEbits.STSEL = 0;
    }

    U2MODEbits.BRGH = 0;                // divide by 16, 0 -> 16, 1 -> 4
    // Enable the transmitter and receiver modules
    U2STAbits.URXEN = 1;                // Enable Receiver
    U2STAbits.UTXEN = 1;                // Enable Transmitter
    // Enable UART2
    U2MODEbits.ON = 1;                  // Enable UART2
}

