#include <stdio.h>

int main(int argc, char *argv[]){
    char *biggest_string;
    int string_size = 0;
    
    for(int i = 0; i<argc; i++){
        int k = 0;
        int upercase = 0;
        int lowercase = 0;
        
        while(argv[i][k] != '\0'){
            if(argv[i][k] >= 'a' && argv[i][k] <= 'z') lowercase++; else upercase++;
            k++;
        }
        
        if(string_size < k){
            biggest_string = argv[i];
            string_size = k;
        } 
        
        printf("P%d %s length: %d | chars -> uppercase: %d lowecase: %d\n",i, argv[i], k, upercase,lowercase);
    }
    
    printf("The biggest string is: %s",biggest_string);

    return 0;
}