#include <detpic32.h>

void delay(int ms);
void putc(char byte2send);
void configUart(unsigned int baud, char parity, unsigned int stopbits);
char getc(void);

int main(void){
    configUart(115200,'N',1);

    while(1){
        putc(getc());
    }
}

void puts(char *str){
    while (*str != '\0'){
        putc(*str);
        str++;
    }
}

char getc(void){
    // If OERR == 1 then reset OERR
    if(U2STAbits.OERR == 1)
        U2STAbits.OERR = 0;

    // Wait while URXDA == 0
    while(U2STAbits.URXDA == 0);
    // If FERR or PERR then
    if(U2STAbits.PERR == 1 || U2STAbits.FERR == 1) {
        // read UxRXREG (to discard the character) and return 0
        char collect = U2RXREG;
        return 0;
    } else {
        return U2RXREG;
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
