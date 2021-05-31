#include <detpic32.h>


void main(void)
{
    // Configure Timer T3 with interrupts enabled
    EnableInterrupts();
    while(1);
}


void _int_(VECTOR) isr_T3(void) // Replace VECTOR by the timer T3
// vector number
{
    putChar('.');
    // Reset T3 interrupt flag
}