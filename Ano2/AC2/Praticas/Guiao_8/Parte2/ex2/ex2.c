#include <detpic32.h>

volatile int voltage = 0; // Global variable

void configureAll();
void send2displays(unsigned char);
unsigned char toBcd(unsigned char);
void setPWM(unsigned int dutyCycle);
void configUart(unsigned int baud, char parity, unsigned int stopbits);
void putc(char byte2send);

volatile int voltMin = 33;
volatile int voltMax = 0;


void _int_(32) isr_uart2(void){
    char read = U2RXREG;
    putc(read);
    if(read == 'L'){
        putc((voltMin >> 4) + '0');
        putc((voltMin & 0x0F) + '0');
        putc('\n');
    }
    IFS1bits.U2RXIF = 0; // Clear UART2 rx interrupt flag
}

volatile counter = 0;
void _int_(12) isr_T3(void) { // adc_print
    // Send "voltage" global variable to displays
    send2displays(voltage);
    // Reset T3 interrupt flag
    IFS0bits.T3IF = 0;
    if (counter == 99){
        putc((voltage >> 4) + '0');
        putc((voltage & 0x0F) + '0');
        putc('\n');
        counter = 0;
    } else {
        counter++;
    }
}

void _int_(4) isr_T1(void) { // adc_convert
    // Start A/D conversion
    AD1CON1bits.ASAM = 1;           // Start conversion
    // Reset T1 interrupt flag
    IFS0bits.T1IF = 0;
}

void _int_(27) isr_adc(void){ // Replace VECTOR by the A/D vector number - see "PIC32 family data sheet" (pages 74-76)
    int *p = (int *)(&ADC1BUF0);
    int i;
    int tempV = 0;
    for( i = 0; i < 8; i++ ) {
        tempV += (p[i*4]*33+511)/1023;
    }

    tempV /= 8;
    voltage = toBcd(tempV);

    if(voltage > voltMax)
        voltMax = voltage;
    if(voltage < voltMin)
        voltMin = voltage;

    IFS1bits.AD1IF = 0;                    // Reset AD1IF flag
}


void main(void) {
    configureAll(); // Function to configure all (digital I/O, analog
    // input, A/D module, timers T1 and T3, interrupts)
    // Reset AD1IF, T1IF and T3IF flags
    configUart(115200,'N',1);
    EnableInterrupts(); // Global Interrupt Enable
    int portVal;
    int dutyCycle;

    while(1){
        // Read RB1, RB0 to the variable "portVal"
        portVal = PORTB & 3;

        switch(portVal) {
            case 0: // Measure input voltage
                IEC0bits.T1IE = 1;  // Enable T1 interrupts
                setPWM(0); // LED OFF
                break;
            case 1: // Freeze
                IEC0bits.T1IE = 0;  // Disable T1 interrupts
                setPWM(100); // LED ON (maximum bright)
                break;
            default: // LED brightness control
                IEC0bits.T1IE = 1;  // Enable T1 interrupts
                dutyCycle = voltage * 3;
                setPWM(dutyCycle);
                break;
        }
    }
}

void putc(char byte2send) {
    // wait while UTXBF == 1
    while(U2STAbits.UTXBF == 1);
    // Copy byte2send to the UxTXREG register
    U2TXREG = byte2send;
}

void setPWM(unsigned int dutyCycle) {
    // duty_cycle must be in the range [0, 100]
    OC1RS = (dutyCycle * (PR3 + 1)) / 100; // Evaluate OC1RS as a function of "dutyCycle"
}

void send2displays(unsigned char value) {
    static char displayFlag = 0;
    char display7Scodes[] = {
            0x3F, //0
            0x06, //1
            0x5B, //2
            0x4F, //3
            0x66, //4
            0x6D, //5
            0x7D, //6
            0x07, //7
            0x7F, //8
            0x6F, //9
            0x77, //A
            0x7C, //b
            0x39, //C
            0x5E, //d
            0x79, //E
            0x71  //F
    };

    unsigned char dh = display7Scodes[value >> 4];      // Get the value at 7..4
    unsigned char dl = display7Scodes[value & 0x0F];    // Get the value at 3..0

    if (displayFlag == 1) {
        LATD = (LATD | 0x0040) & 0xFFDF;    //  activate display high & deactivate display low
        LATB = (LATB & 0x00FF) | dh  << 8;   //  set display high value
    } else {                      // wait
        LATD = (LATD | 0x0020) & 0xFFBF;    //  activate display low & deactivate display high
        LATB = (LATB & 0x80FF) | dl<< 8;   //  set display low value
    }
    displayFlag = !displayFlag;
}

unsigned char toBcd(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
}

void configureAll() {
    TRISB = (TRISB & 0x80FF) | 0xF;     // sets RB8-RB14 as output and RB0-RB as input
    TRISD = TRISD & 0xFF9F;             // sets RD5-RD8 as output
    LATD = (LATD & 0xFF9F) | 0x40;      // sets RD6 and RD5 to 0 then sets RD6 to 1
    // Configure A/D module
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 8 - 1;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;


    // Configure interrupt system
    IPC6bits.AD1IP = 2;  // configure priority of A/D interrupts
    IFS1bits.AD1IF = 0;  // clear A/D interrupt flag
    IEC1bits.AD1IE = 1;  // enable A/D interrupts

    // T1 = 4Hz
    // T3 = 100Hz

    T1CONbits.TCKPS = 7; // define o Prescaler ara dividir o clock por 256
    T3CONbits.TCKPS = 2; // define o Prescaler ara dividir o clock por 4


    // fOut_PRESC = 20Mhz / 256 = 78125Hz
    // PR1 = (78125Hz / 4 Hz) - 1 = 19531.25
    PR1 = 19531; // Fout = 20MHz / (19531 + 1) = 78125/19532 ~ 3.999 Hz

    // fOut_PRESC = 20Mhz / 4 = 5Mhz
    // PR3 = (5Mhz / 100 Hz) - 1 = 49999
    PR3 = 49999; // Fout = Fout_presc / 49999 + 1= 5*10⁶/50000 ~ 100 Hz

    TMR1 = 0; // Reset timer T1 count register
    TMR3 = 0; // Reset timer T3 count register

    T1CONbits.TON = 1; // Enable timer T1 (must be the last command)
    T3CONbits.TON = 1; // Enable timer T3 (must be the last command)


    IFS0bits.T1IF = 0;      // Reset timer T1 interrupt flag, should be set before enabling interrupts
    IFS0bits.T3IF = 0;      // Reset timer T1 interrupt flag, should be set before enabling interrupts

    IPC1bits.T1IP = 2;      // Interrupt priority 2
    IPC3bits.T3IP = 2;      // Interrupt priority 2

    IEC0bits.T1IE = 1;      // Enable timer T1 interrupts
    IEC0bits.T3IE = 1;      // Enable timer T1 interrupts


    TRISB = TRISB | 0x003;  // enable RB1 and RB0

    OC1CONbits.OCM = 6; // PWM mode on OCx; fault pin disabled
    OC1CONbits.OCTSEL = 1; // Use timer T3 as the time base for PWM generation

    OC1CONbits.ON = 1; // Enable OC1 module
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

    //interrupt setup
    U2STAbits.URXISEL = 0;              // Select interrupt only for receiver
    IPC8bits.U2IP = 1;                  // UART2 Priority
    IEC1bits.U2RXIE = 1;                // U2RX Interrupt Enable
    IFS1bits.U2RXIF = 0;                // U2RX Interrupt Flag

    // Enable UART2
    U2MODEbits.ON = 1;                  // Enable UART2
}

