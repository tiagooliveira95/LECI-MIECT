#include <detpic32.h>

void delay(int ms);
void putc(char byte2send);

int main(void){
    // fBRG = 20Mhz / ( UxBRG + 1 )
    // baudrate = f PBCLK / (4 * (UxBRG + 1)) ou baudrate = f PBCLK / (16 * (UxBRG + 1))

    // Configure UART2:
    // 1 - Configure BaudRate Generator
    U2BRG = 10; // U2BRG = (20Mhz / (16*115200))-1 ~ 10

    // 2 – Configure number of data bits, parity and number of stop bits
    // (see U2MODE register)
    U2MODEbits.PDSEL = 0;
    U2MODEbits.STSEL = 0;       // 1 stop bit
    U2MODEbits.BRGH = 0;        // divide by 16, 0 -> 16, 1 -> 4

    // 3 – Enable the transmitter and receiver modules (see register U2STA)
    U2STAbits.URXEN = 1;        // Enable Receiver
    U2STAbits.UTXEN = 1;        // Enable Transmitter

    // 4 – Enable UART2 (see register U2MODE)
    U2MODEbits.ON = 1;          // Enable UART2

    while(1){
        putc('+');
        delay(1000);
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
