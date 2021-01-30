    .data
a:  .space 40
s1: .asciiz "Median: "
    .eqv read_double,7
    .eqv print_double,3
    .eqv print_string,4
    .eqv SIZE 5
    .text
    .globl main

#    $t0 -> i
#    $t1 > &a[i]
#    $t2-> a
main:   addiu    $sp,$sp, -4          #
        sw       $ra,0($sp)           #
        li       $t0,0                # i = 0    
        la       $t2,a                #
for:    bge      $t0,SIZE,endfor      # for(i = 0; i < SIZE; i++) {
        li       $v0, read_double     #
        syscall                       # read_double();
        mov.d   $f12,$f0              #
        sll     $t1,$t0,3             # i  * 8
        addu    $t1,$t1,$t2           #
        s.d     $f12,0($t1)           #a[i] = (double)read_int();        
        addiu   $t0,$t0,1             #i++
        j       for                   #
endfor: la      $a0,s1                #print("max")
        li      $v0,print_string      #
        syscall                       #
        move    $a0,$t2               #
        li      $a1,SIZE              #
        jal     median                # double median(*double,size)
        mov.d   $f12,$f0              #
        li      $v0, print_double     #
        syscall                       # print(median(*double,size))
        li      $v0,0                 # return 0;
        lw      $ra,0($sp)            #
        addiu   $sp,$sp, 4            #
        jr      $ra                   #