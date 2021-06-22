#include <detpic32.h>

void putc(char byte2send);
void configUart(unsigned int baud, char parity, unsigned int stopbits);

void _int_(32) isr_uart2(void){
    putc(U2RXREG);
    IFS1bits.U2RXIF = 0; // Clear UART2 rx interrupt flag
}

int main(void){
    configUart(115200,'N',1);
    EnableInterrupts();
    while(1);
}

void putc(char byte2send) {
    // wait while UTXBF == 1
    while(U2STAbits.UTXBF == 1);
    // Copy byte2send to the UxTXREG register
    U2TXREG = byte2send;
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

    //interrupt setup
    U2STAbits.URXISEL = 0;              // Select interrupt only for receiver
    IPC8bits.U2IP = 1;                  // UART2 Priority
    IEC1bits.U2RXIE = 1;                // U2RX Interrupt Enable
    IFS1bits.U2RXIF = 0;                // U2RX Interrupt Flag

    // Enable UART2
    U2MODEbits.ON = 1;                  // Enable UART2
}
