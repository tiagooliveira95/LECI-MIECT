//
// Created by tiagooliveira95 on 26/04/21.
//

#include "ex2.h"
#include "/opt/pic32mx/include/detpic32.h"

int main(void){
    char c;

    do{
        c = getChar();
        if(c != '\n')
            putChar(c);
    }while(c != '\n');
}
