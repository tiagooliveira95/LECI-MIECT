#include <detpic32.h>

#pragma clang diagnostic push
#pragma ide diagnostic ignored "EndlessLoop"

#define BUF_SIZE 8
#define INDEX_MASK (BUF_SIZE - 1)
#define TRUE 1
#define FALSE 0

#define DisableUart2RxInterrupt() IEC1bits.U2RXIE = 0
#define EnableUart2RxInterrupt() IEC1bits.U2RXIE = 1
#define DisableUart2TxInterrupt() IEC1bits.U2TXIE = 0
#define EnableUart2TxInterrupt() IEC1bits.U2TXIE = 1

void comDrv_flushRx(void);
void comDrv_flushTx(void);
void comDrv_puts(char *s);
void comDrv_config(unsigned int baud, char parity, int stopBits);
void comDrv_putc(char ch);
char comDrv_getc(char *pchar);

typedef struct {
    unsigned char data[BUF_SIZE];
    unsigned int head;
    unsigned int tail;
    unsigned int count;
} circularBuffer;

volatile circularBuffer txb; // Transmission buffer
volatile circularBuffer rxb; // Reception buffer


int main(){
    comDrv_flushRx();
    comDrv_flushTx();

    comDrv_config(115200,'N',1);     // default "pterm" parameters
                                     // with TX and RX interrupts disabled
    EnableInterrupts();

//    while(1){
//        comDrv_puts("Teste do bloco de transmissao do device driver!...");
//        comDrv_putc('\n');
//    }

    comDrv_puts("PIC32 UART Device-driver\n");
    char c;
    while(1){
        // Read character from reception buffer
        if(comDrv_getc(&c)){
            // Send character to the transmission buffer
            if(c == 'S'){
                comDrv_puts("Deti for life :) Deti for life");
            }else {
                comDrv_putc(c);
            }
        }
    }
}

#pragma clang diagnostic pop

void comDrv_putc(char ch) {
    while(txb.count == BUF_SIZE){}  // Wait while buffer is full
    txb.data[txb.tail] = ch;        // Copy character to the transmission
                                    // buffer at position "tail"
    txb.tail = (txb.tail + 1) & INDEX_MASK; // Increment "tail" index
                                            // (mod. BUF_SIZE)
    DisableUart2TxInterrupt();              // Begin of critical section
    txb.count++;                            // Increment "count" variable
    EnableUart2TxInterrupt();               // End of critical section
}

char comDrv_getc(char *pchar) {
    if (rxb.count == 0) return FALSE;

    DisableUart2RxInterrupt();                          // Begin of critical section
    *pchar = rxb.data[rxb.head];
    rxb.count--;
    rxb.head = (rxb.head + 1) & INDEX_MASK;             // Increment head variable (mod BUF_SIZE)
    EnableUart2RxInterrupt();                           // End of critical section
    return TRUE;
}

void comDrv_puts(char *s) {
    while(*s != '\0'){
        comDrv_putc(*s);
        s++;
    }
}

void comDrv_flushRx(void) {
    // Initialize variables of the reception buffer
    rxb.head = 0;
    rxb.tail = 0;
    rxb.count = 0;
    DisableUart2RxInterrupt();
}

void comDrv_flushTx(void) {
    // Initialize variables of the transmission buffer
    txb.head = 0;
    txb.tail = 0;
    txb.count = 0;
    DisableUart2TxInterrupt();
}

void _int_(32) isr_uart2(void){
    if(IFS1bits.U2TXIF == 1){
        if(txb.count > 0){
            U2TXREG = txb.data[txb.head];
            txb.head = (txb.head + 1) & INDEX_MASK;
            txb.count--;
        }

        if(txb.count == 0){
            DisableUart2TxInterrupt();
        }
        IFS1bits.U2TXIF = 0;
    }

    if(IFS1bits.U2RXIF == 1){
        rxb.data[rxb.tail] = U2RXREG;
        rxb.tail = (rxb.tail + 1) & INDEX_MASK;

        if(rxb.count < BUF_SIZE) {
            rxb.count++;
        }else{
            rxb.head++;
        }
        IFS1bits.U2RXIF = 0;
    }
}

void comDrv_config(unsigned int baud, char parity, int stopBits) {
    U2BRG = ((PBCLK + 8 * baud) / (16 * baud)) - 1;

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

    U2MODEbits.STSEL = stopBits-1;

    U2MODEbits.BRGH = 0;                // Divide by 16
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
    U2MODEbits.ON = 1;

    IPC8bits.U2IP = 2;                  // Configure Interrupt Priority
    IFS1bits.U2RXIF = 0;
    IFS1bits.U2TXIF = 0;
    EnableUart2RxInterrupt();
    DisableUart2TxInterrupt();
}

