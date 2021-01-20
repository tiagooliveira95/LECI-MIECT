#include <stdio.h>
#define SIZE 3 

int main(int argc, char *argv[]){
    
    static char *array[SIZE]={"Array", "de", "ponteiros"};
    char **p;
    char **pultimo;
    
    p = array;
    pultimo = array + SIZE;
    
    for(; p < pultimo; p++){
        printf( "\nString #" );
        printf("%d", i );
        printf( ": " );
        char *c = *p;
        
        while(*c != '\0'){
            printf("%c",*c);
            printf("%c",'-');
            c++;
        }
    }
    return 0;
}