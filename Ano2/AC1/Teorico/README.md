### 1. Quais são os 3 blocos fundamentais de um sistema computacional? 
    Um sistema computacional é constituído principalmente por 3 blocos:
     
    CPU:      Responsável por processar instruções armazenadas na memória
    Memória:  Armazena os dados de um programa e os seus resultados
    I/O:      Responsável pela comunicação com os periféricos
    
### 2. Quais são os 3 principais blocos funcionais que integram um CPU?
    ALU:              Unidade aritmética
    Registos:         Unidade responsável por guardar valores de um programa
    Unidade Controlo: Unidade responsável por controlar o fluxo do CPU

### 3. Qual a função do registo Program Counter? 
    O PC(Program Counter) contem nele armazenado o endereço da instrução que o processador deve executar.
  
### 4. Quais os passos mais importantes em que se decompõe a execução de uma instrução no CPU? 
    Fetch:          Obtem a instrução a ser executada.
    Decode:         Descodifica a instrução.
    Operand Fetch:  Obtem se os valores dos operandos.
    Execute:        Executa a instrução.
    Store:          Guarda o resultado.
  

### 5. Descreva de forma sucinta a função de um compilador. 
    O compilador traduz a linguagem de alto-nivel para código de máquina.

### 6. Descreva de forma sucinta a função de um assembler. 
    O assembler traduz assembly em código de máquina.

### 7. Quantos registos internos de uso geral tem o MIPS? 
    O MIPS contem 32 registos 
  
### 8. Qual a dimensão, em bits, que cada um dos registos internos do MIPS pode armazenar? 
    Cada registo interno do MIPS pode armazenar 32bits.
  
  
### 9. Qual a sintaxe, em Assembly, de uma instrução aritmética no MIPS? 
    inst Rdst, Rsrc1, Rsrc2 
  
  
### 10. O que distingue a instrução SRL da instrução SRA do MIPS? 
  - SRL <i>Shift Right Logical</i>: Executa um shift-right inserindo no bit mais significativo um 0x0
  - SRA <i>Shift Right Arithmetic</i>: Executa um shift-right inserindo no bit mais significativo um bit igual ao MSB, mantendo assim o sinal original.<br>
     `1010 -> SRL -> 0101` <br>
     `1010 -> SRA -> 1101`

### 11. Se $5=0x81354AB3, qual o resultado, expresso em hexadecimal, das instruções:
`srl $3,$5,1`<br>
`sra $4,$5,1`

    10000001001101010100101010110011 <=> 0x81354AB3
    // 1 instrução faz um shift right logical de 1 casa ficando assim o $3 igual a
    01000000100110101010010101011001 <=> 0x409AA559
    // 2 instrução faz um shift right arithmetic de 1 casa ficando assim o $4 igual a
    11000000100110101010010101011001 <=> 0xC09AA559
    
### 12. System calls:
    - O que é uma system call?
    Um system call é uma pedido feito pelo CPU ao sistema operativo para que este realize uma determinada função.<br>
     
    - No MIPS, qual o registo usado para identificar a system call a executar?
    O registo que identifica a system call a executar é o `$v0`
      
    - Qual o registo ou registos usados para passar argumentos para as systems calls?
    Os registos utilizados pelo MIPS para passar argumentos são os: `$a0 -> $a3` e `$f12 -> $f14`

    - Qual o registo usado para obter o resultado devolvido por uma system call nos casos em que isso se aplica?
    O resultado é obtido no registo `$v0` ou `$f0`  

### 13. Em Arquitetura de Computadores, como definiria o conceito de endereço?
    Um endereço é o local onde esta guardado um bloco de instruções ou dados, 
    no caso do MIPS este bloco (ou WORD) tem o um tamanho de 32bits

### 14. O que é o espaço de endereçamento de um processador?
    È a gama total de endereços que um CPU pode aceder.

### 15. Como se organiza internamente um processador? Quais são os blocos fundamentais da secção de dados? Para que serve a unidade de controlo? 
     A secção de dados contem, 3 blocos fundamentais, a ALU, Registos e Multiplexers.
     A unidade de controlo é responsável por controlar o fluxo da informação dentro da secção de dados
 

### 16. Qual é o conceito fundamental por detrás do modelo de arquitetura "stored-program"?  
    A arquitetura stored-program, ou Von Neuman é caracterizada por ter o segmento de texto (programa) e o segmento de data juntos num único bloco.

### 17. Como se codifica uma instrução? Que informação fundamental deverá ter o código de uma instrução? 
    As instruções são codificadas tendo em conta o seu formato, R, I ou J
    
    R: [OPCODE (6)] [Rs (5)]  [Rt (5)]  [Rd (5)]  [Shamt (5)] [Funct (6)]  
    I: [OPCODE (6)] [Rs (5)]  [Rt (5)]  [         Immediate(16)         ]    
    J: [OPCODE (6)] [                 word address (26)                 ]
    
    


### 18. Descreva pelas suas próprias palavras o conceito de ISA.
    O ISA é um conjunto de instruções suportadas pelo CPU.
    
### 19. Quantas e quais são as classes de instruções que agrupam as diferentes instruções de uma dada arquitetura?
    
    Processamento, Transferência de informação e Controlo de fluxo

### 20. O que carateriza e distingue as arquiteturas do tipo "register-memory" e "load-store"? De que tipo é a arquitetura MIPS?
    
    A arquitetura register-memory possibilita que as operações sejam executadas a partir da memória e/ou registos.
    A arquitetura load-store divide as instruções em 2 categorias, load e store entre a memória e registos.
    
    Em load-store, ambos os operandos tem de ser registos, o que difere da register-memory em que podemos ter um operando na memória e outro num registo.
    
    O MIPS usa a arquitetura load-store.
 
### 21. O ciclo de execução de uma instrução é composto por uma sequência ordenada de operações. Quantas e quais são essas operações (passos de execução)? 
 
    1. Cálculo do endereço de memória que contém a instrução
    2. Leitura da instrução
    3. Descodificação da instrução
    4. Cálculo do endereço dos operandos
    5. Leitura do operando (Operand Fetch)
    6. Execução da operação
    7. Armazenamento do resultado num endereço de memória
    

### 22. Como se designa o barramento que permite identificar, na memória, a origem/destino da informação transferida? 
    
    Address Bus

### 23. Qual a finalidade do barramento normalmente designado por Data Bus?
    
    É o bus que contem a informação lida ou para ser escrita no segmento de dados, ou nos registos
    

### 24. Os processadores da arquitetura hipotética ZWYZ possuem 4 registos internos e todas as instruções são codificadas em 24 bits. Num dos formatos de codificação existem 5 campos: um OpCode com 5 bits, três campos para identificar registos internos em operações aritméticas e lógicas e um campo para codificar valores constantes imediatos em complemento para dois. Qual a gama de representação destas constantes? 

    Opcode      ->  5   bits
    RS,Rt e Rd  ->  2   bits
    Imm         ->  13  bits

### 25. A arquitetura hipotética ZPTZ tem um barramento de endereços de 32 bits e um barramento de dados de 16 bits. Se a memória desta arquitetura for bit_addressable:
    
    A: Qual a dimensão do espaço de endereçamento desta arquitetura?
        - 32 bits
    
    B: Qual a dimensão máxima da memória suportada por esta arquitetura expressa em bytes?
        - Bit addressable, cada endereço faz corresponder 1 bit logo o tamanho máximo é 2^32bits = 4 Gbits
    

### 26. Considere agora uma arquitetura em que o respetivo ISA especifica uma organização de memória do tipo word-addressable, em que a dimensão da word é 32 bits. Tendo o espaço de endereçamento do processador 24 bits, qual a dimensão máxima de memória que este sistema pode acomodar expresso em bytes? 

    O processador pode endereçar 2^24 endereços cada um com 32bits, logo a memória máxima é 2^24 * 32 bits =  64MB


### 27. Relativamente à arquitetura MIPS:

    - Com quantos bits são codificadas as instruções no MIPS? 
        Cada instrução do MIPS esta codificada em 32 Bits.
        
    - O que diferencia o registo $0 dos restantes registos de uso geral?
        O registo $0 tem um valor permanente definido a 0x0 não podendo este ser alterado.
        
    - Qual o endereço do registo interno do MIPS a que corresponde a designação lógica $ra?
        O registo interno $ra esta associado ao registo número 31

### 28. No MIPS, um dos formatos de codificação de instruções é designado por R:
    
    Quais os campos em que se divide este formato de codificação? 
        [OPCODE (6)] [Rs (5)]  [Rt (5)]  [Rd (5)]  [Shamt (5)] [Funct (6)]
     
    Qual o significado de cada um desses campos?
        
        [OPCODE (6)]    ->  Código de operação
        [Rs (5)]        ->  Registo operando 1
        [Rt (5)]        ->  Registo operando 2
        [Rd (5)]        ->  Registo destino
        [Shamt (5)]     ->  Quantidade shift
        [Funct (6)]     ->  Operação ALU
    
    Qual o valor do campo opCode nesse formato? 
        Em operações do tipo R o OPCODE é sempre 0x0
        
    O que faz a instrução cujo código máquina é: 0x00000000?
        
        1 passo decompor:
            00000000000000000000000000000000
        2 passo descodificar:
            00000 00000 00000 00000 00000 0000000
        
        Como o opcode é 0x0 estamos perante uma operação R que é do tipo aritmético, o registo de destino é o $0
            uma vez que não é possível alterar o registo $0 esta instrução não vai fazer nada.  
     

### 29. O símbolo ” >> “ da linguagem C significa deslocamento à direita e é traduzido por SRL ou SRA (no caso do MIPS). Em que casos é que o compilador gera um SRL e quando é que gera um SRA?
        
        O compilador vai usar SRL ou SRA dependendo do tipo de operando, no caso dos operandos serem unsigned o copilador vai usar SRL,
            se os operandos forem signed usara o SRA

### 30. Qual a instrução nativa do MIPS em que é traduzida a instrução virtual move $4,$15 ?
    
    addu $4,$0,$15
    
    
### 31. Determine o código máquina das seguintes instruções (verifique a tabela na última página):

    a) xor $5,$13,$24
    b) sub $25,$14,$8
    c) sll $3,$9,7
    d) sra $18,$9,8
    
    Instruções aritméticas logo usam o tipo R
    
    a)  000000  01101   11000   00101   00000   100110  <=> 0x01B82826
    b)  000000  01110   01000   11001   00000   100010  <=> 0x01C8C822
    c)  000000  01001   00000   00011   00111   000000  <=> 0x012019C0
    d)  000000  01001   00000   10010   01000   000011  <=> 0x01209203
        
    
### 32. Traduza para instruções Assembly do MIPS a seguinte expressão aritmética, supondo x e y são inteiros e residentes em $t2 e $t5, respetivamente (apenas pode usar instruções nativas e não deverá usar a instrução de multiplicação): 

`y = -3 * x + 5;`

       add  $t5,$t2,$t2     # y = x + x
       add  $t5,$t5,$t2     # y = x + x + x
       nor  $t5,$t5,$0      # y = y NOR 0x0
       addi $t5,$t5,6       # y = -(x*3) + 5
       
       # Nota, é somado 6 pois na instrução NOR os bytes são invertidos
       # como para inverter o sinal é necessário somar um, após a inversão de bits na ultima operação em vez de somar 5
       # soma se 6, os 5 da operação + 1 da operação de alteração de sinal

### 33. Traduza para instruções assembly do MIPS o seguinte trecho de código:

```
int a, b, c; //a:$t0, b:$t1, c:$t2
unsigned int x, y, z; //x:$a0, y:$a1, z:$a2
z = x >> 2 + y;
c = (a >> 5 – 2) * b;
```

    srl     $a2,$a0,2       # z = x >> 2
    addu    $a2,$a2,$a1     # z = x >> 2 + y
    sra     $t2,$t0,3       # c = a >> 5 - 2
    mul     $t2,$t2,$t1     # c = a >> 5 – 2 * b;
   

### 34. Considere que as variáveis g, h, i e j são conhecidas e podem ser representadas por uma variável de 32 bits num programa em C. Qual a correspondência em linguagem C às seguintes instruções: 

    a.  add h, i, j     # h =  h = i + j
    
    b.  addi j, j, 1    # j++
        add h, g, j     # h = g + j

     
### 35. Assumindo que g=1, h=2, i=3 e j= 4 qual o valor destas variáveis no final das sequências das alíneas da questão anterior? 
    
    a)  h = i + j = 3+4 = 7
    
    b)  j++ = 4 + 1 = 5
        h = g + j = 1 + 5 = 6


### 36. Qual a operação realizada pela instrução "slt" e quais os resultados possíveis?
        
        A instrução SLT define o registo destino a 0x1 se o operando 1 for menor que o operando 2, caso contrario o registo destino assume o valor 0x0

### 37. Qual o valor armazenado no registo $1 na execução da instrução "slt $1, $3, $7", admitindo que:

```
a. $3=5 e $7=23
b. $3=0xFE e $7=0x913D45FC
```

    Uma vez que o $3 e menor que o $7 a instrução SLT vai definir o registo $1 com o valor 0x1


### 38. Com que registo implícito comparam as instruções "bltz", "blez", "bgtz" e "bgez"?
    
    As intruções usam o registo $at
    
    O registo a operar é dado na instrução, ex bltz Rsrc, label
    
    bltz:   executa o branch se o Rsrc for menor que 0
    blez:   executa o branch se o Rsrc for menor ou igual a 0   
    bgtz:   executa o branch se o Rsrc for maior que 0
    bgez:   executa o branch se o Rsrc for maior ou igual que 0

### 39. Decomponha em instruções nativas do MIPS as seguintes instruções virtuais:

```
a. blt $15,$3,exit
b. ble $6,$9,exit
c. bgt $5,0xA3,exit
d. bge $10,0x57,exit
e. blt $19,0x39,exit
f. ble $23,0x16,exit 
```

    a)  slt     $1,$15,$3
        bne     $1,$0,exit
   
    b)  slt     $1,$9,$6
        beq     $1,$0,exit
    
    c)  addi    $1,$0,0xA3
        slt     $1,$1,$5
        bne     $1,$0,exit
    
    d)  slti    $1,$10,0x57
        beq     $1,$0,exit
    
    e)  slti    $1,$19,0x39
        bne     $1,$0,exit
    
    f)  addi    $1,$23,-1
        slti    $1,$1,0x16
        bne     $1,0,exit

### 40. Na tradução e C para assembly, quais as principais diferenças entre um ciclo "while(…){…}" e um ciclo "do{…}while(…);" ? 

    Na operação while(...){...} é verificada a condição antes de ser executado o código dentro de {...}
    Na operação do{...} while(...) a condição é apenas verificada após o código dentro do do{} tiver sido executado
    
### 41. Traduza para assembly do MIPS os seguintes trechos de código de linguagem C (admita que a, b e c residem nos registos $4, $7 e $13, respetivamente):
```
a:

if(a > b && b != 0)
    c = b << 2;
else
    c = (a & b) ^ (a | b);

b:

if(a > 3 || b <= c)
    c = c – (a + b);
else
    c = c + (a – 5); 
```

    a)

    if:     blt $4,$7,else
            beq $7,0,else
            sll $13,$7,2
            j   endif
    else:
            and $13,$4,$7
            or  $14,$4,$7
            xor $13,$13,$14
    endif:  ...
    
    b)      
            
    if:     bgt     $4,3,then
            ble     $7,$13,then
            j       else
    then:   add     $14,$4,$7       # $14 = a+b
            sub     $13,$13,$14     
            j       endif
    else:   addi    $14,$4,-5       # $14 = a-5
            add     $13,$13,$14
    endif: ...
       

### 42. Qual o modo de endereçamento usado pelo MIPS para ter acesso a palavras residentes na memória externa? 
    
    Endereçamento indireto por registo com deslocamento. 

### 43. Na instrução "lw $3,0x24($5)" qual a função dos registos $3 e $5 e da constante 0x24?

    O $5 contem o endereço, a constante 0x24 é o offset em instruções que deve ser sumado ao conteudo de $5
    O registo $3 é o registo destino para onde sera transferida a informação guardada no endereço $5 + (0x24 << 2)

### 44. Qual é o formato de codificação das instruções de acesso à memória no MIPS e qual o significado de cada um dos seus campos?

    O MIPS usa o formato I para codificação das intruções de acesso à memória.
    
    Codificação:    inst   Rt, offset(base)
    
    ex: 
    LW  $t1,0($t2)
    
    I: [OPCODE (6)] [Rs (5)]  [Rt (5)]  [         offset(15)         ]
   
    [OPCODE (6)]    =>  opcode da operação
    [Rs (5)]        =>  registo base
    [Rt (5)]        =>  registo destiono
    [offset(15)]    =>  offset    

### 45. Qual a diferença entre as instruções "sw" e "sb"?
    
    A operação SW guarda uma word de 32 bits no endereço destino
    A operação SB guarda um byte no endereço destino
    
    No caso da operação SB primeiramente são lidos os 32bits para um registo temporário
    
| Endereço |  11 |  10 | 01|  00 |
| :---:|---|---|---|---|
|Registo|0x20|0x40|0x90|0xAE|

| Endereço |  11 |  10 | 01|  00 |
| :---:|---|---|---|---|
|Registo Fonte|0x00|0x00|0x00|0x10|

     De seguida, vamos utilizar os 2 bits menos significativos do endereço para atualizar o registo temporário, exemplo, assumindo o endereço = 0x1001006
     os 2 bits menos significativos são = 10
     
     Assim selecionamos o endereço 10, e escrevemos neste endereço o byte menos significativo do registo fonte


| Endereço |  11 |  10 | 01|  00 |
| :---:|---|---|---|---|
|Registo|0x20|`0x10`|0x90|0xAE|

| Endereço |  11 |  10 | 01|  00 |
| :---:|---|---|---|---|
|Registo Fonte|0x00|0x00|0x00|`0x10`|

   

### 46. O que distingue as instruções "lb" e "lbu"?

    O LB vai preencher os bits mais significativos com 0x1, ou 0x0 dependendo se o bit mais significativo do byte for 0x1 ou 0x0
    desta forma ao executar a operação mantemos o sinal original.
    No caso da operação LBU ao transferir da mémoria para o registo vai colucar todos os bits mais significativos a 0x0

### 47. O que acontece quando uma instrução lw/sw acede a um endereço que não é múltiplo de 4?

    Ocorre uma excepção, pois não é possível aceder a uma word não múltipla de 4

### 48. Traduza para assembly do MIPS os seguintes trechos de código de linguagem C (atribua registos internos para o armazenamento das variáveis i e k ) : 

```
a)

int i, k;
for(i=5, k=0; i < 20; i++, k+=5);

b)

int i=100, k=0;
for( ; i >= 0; ) {
    i--;
    k -= 2;
}

c)

unsigned int k=0;
for( ; ; ) {
    k += 10;
}

d)

int k=0, i=100;
do{
    k += 5;
} while(--i >= 0); 
```

    a) 
    
    # $t1 = i
    # $t2 = k
    
    li  $t1,5                   # i = 5
    li  $t2,0                   # k = 0
    
    for:    ble $t1,20,endfor
            ...
            add $t1,$1,1        # i++
            add $t2,$t2,5       # k+=5
    endfor: ...
    
    b)
    
    # $t1 = i
    # $t2 = k
    
    li  $t1,100                 # i = 100
    li  $t2,0                   # k = 0
    
    for:    bltz    $t1,endfor
            addi    $t1,$t1,-1      # i--
            addi    $t2,$t2,-2      # k -=2
            j       for
    endfor: ...
    
    
    c)
    
    # $t1 = k
    
    for:    addiu  $t1,$t1,10
            j      for
    
    d)
    
    # $t1 = i
    # $t2 = k
    
    li  $t1,100                 # i = 100
    li  $t2,0                   # k = 0
    
    do:     addi   $t2,$t2,5
            
            addi    $t1,$t1,-1
            bgez    do
    
### 49. Sabendo que o OpCode da instrução "lw" é 0x23, determine o código máquina, expresso em hexadecimal, da instrução "lw $3,0x24($5)". 

    100011  00101    00011    0000000001000100 <=> 0x8CA30044
 
### 50. Suponha que a memória externa foi inicializada, a partir do endereço 0x10010000, com os valores 0x01,0x02,0x03,0x04,0x05 e assim sucessivamente. Suponha ainda que $3=0x1001 e $5=0x10010000. Qual o valor armazenado no registo destino após a execução da instrução "lw $3,0x24($5)" admitindo uma organização de memória little endian? 

    Endereço base:      0x10010000
    Offset:             0x24
    Endereço target:    0x10010024
    
    Admitindo que o endereço 0x10010000 tem o valor 0x01, o endereço 0x10010024 tera o valor 0x28 0x27 0x26 0x25
   
    Assim a instrução LW vai copiar a word 0x28 0x27 0x26 0x25 da memória para o registo $5.
 
### 51. Considere as mesmas condições da questão anterior. Qual o valor armazenado no registo destino pelas instruções: 


|lbu| $3,0xA3($5) |
|:---:|:---:|
|lb| $4,0xA3($5)|

    Para $3:
    
    Endereço base:      0x10010000
    Offset:             0xA3
    Endereço target:    0x100100A3
    
    O byte na posição 0x100100A3 é: 0xA4
    
    Assim vamos carregar o ultimo byte em t3 como é uma operação unsigned o valor $3 ficara: 0x000000A7
    
    Para $4 a instrução é a mesma, só que com sinal, logo $4 ficara: 0xFFFFFFA7
    

 
### 52. Quantos bytes são reservados em memória por cada uma das diretivas: 


|L1:| .asciiz "Aulas5&6T"|
|:---:|:---|
|L2:| .byte 5,8,23|
|L3:| .word 5,8,23|
|L4:| .space 5 |


    L1: 10  Bytes
    L2: 3   Bytes
    L3: 12  Bytes
    L4: 5   Bytes

 
### 53. Desenhe esquematicamente a memória e preencha-a com o resultado das diretivas anteriores admitindo que são interpretadas sequencialmente pelo Assembler

|L1\:| 0x41 |
|:---:|:---:|
| | 0x75 |
| | 0x6C |
| | 0x61 |
| | 0x73 |
| | 0x35 |
| | 0x26 |
| | 0x36 |
| | 0x54 |
| | 0x00 |
|L2:| 0x05 |
| | 0x08 |
| | 0x17 |
| | 0x00 |
| | 0x00 |
|L3:| 0x05 |
| | 0x00 |
| | 0x00 |
| | 0x00 |
| | 0x08 |
| | 0x00 |
| | 0x00 |
| | 0x00 |
| | 0x17 |
| | 0x00 |
| | 0x00 |
| | 0x00 |
|L4:| 0x00 |
| | 0x00 |
| | 0x00 |
| | 0x00 |
| | 0x00 |

 
### 54. Supondo que "L1:" corresponde ao endereço inicial do segmento de dados, e que esse endereço é 0x10010000, determine os endereços a que correspondem os labels "L2:", "L3:" e "L4:". 

    L1: 0x10010000
    L2: 0x1001000A
    L3: 0x10010010
    L4: 0x1001001C
 
### 55. Suponha que "b" é um array declarado como "int b[25];":

1. Como é obtido o endereço inicial do array, i.e., o endereço a partir do qual está armazenado o seu
primeiro elemento?

        O endereço inicial do array é obtido atravez de &b

2. Supondo uma memória "byte-addressable", como é obtido o endereço do elemento "b[6]"?

        O b[6] é obtido atravez de &b + 4\*6 pois cada inteiro contem 32bits.
        Uma vez que a memória é byte-addressable temos de multiplicar o indice por 4 (4bytes) e somarao endereço inicial (i * 4) + &b
 
### 56. O que é codificado no campo offset do código máquina das instruções "beq/bne" ? 
        
        O offset é codificado no número de instruções, ou seja, se o branch tiver a uma 6 instruções de distancia, o offset é 6.
        Senso que o MIPS depois ira multiplicar este valor por 4 e somar ao endereço base para obter o endereço da próxima instrução.
 
### 57. A partir do código máquina de uma instrução "beq/bne", como é formado o endereço-alvo (Branch Target Address)?

        O endereço alvo é formado a partir da soma do endereço base com a multiplicação do offset por 4. 
 
### 58. Qual o formato de codificação de cada uma das seguintes instruções: "beq/bne", "j", "jr"?

        As instruções J e JR usam o a codificação tipo J
        [OPCODE (6)]    [  word address (26)    ]
        
        [OPCODE (6)]    =>  Código da execução
        [Word Address]  =>  Endereço Target
        

### 59. A partir do código máquina de uma instrução "j", como é formado o endereço-alvo (Jump Target Address)?

        O endereço target é formado ao concatenar os 4 bits mais significativos do *Program Counter* aos 26 bits menos significativos do Target Address 
        com um shift 2 para a esquerda

### 60. Dada a seguinte sequência de declarações:

```
int b[25];
int a;
int *p = b; 
```

1. Identifique qual ou quais das seguintes atribuições permitem aceder ao elemento de índice 5 do array "b":
    

| B | a = b[5] |  a =\*p + 5 | a = \*(p + 5)  | a = \*(p + 20) |
|:---:|:---:|:---:|:---:|:---:|

    As atribuições que premitem aceder ao elemento 5 são:
        a = b[5] e 
        a = *(p + 5)
        
        
 ### 61. Assuma que as variáveis f, g, h, i e j correspondem aos registos $t0, $t1, $t2, $t3 e $t4 respetivamente. Considere que o endereço base dos arrays A e B está contido nos registos $s0 e $s1. Considere ainda as seguintes expressões:
 
 |Expressão|
 |:---:|
 |f = g + h + B[2]|
 |j = g - A[B[2]] |

 
 1. Qual a tradução para assembly de cada uma das instruções C indicadas? 
 
        lw  $t0,8($s1)      # f = B[2]
        add $t0,$t0,$t1     # f = B[2] + g
        add $t0,$t0,$t2     # f = B[2] + g + h
        
        lw      $t4,8($s2)      # j = *B[2]
        sll     $t4,$t4,2       # f = B[2] * 4
        addu    $t4,$t4,$s0     # f = B[2] * 4 + A = &A[B[2]]
        lw      $t4,0($t4)      # f = A[B[2]]
        
 
 2. Quantas instruções assembly são necessárias para cada uma das instruções C indicadas? E quantos registos auxiliares são necessários? 
 
        Para a expressão 1 foram utilizadas 3 instruções, e para a espressão 2 foram utilizadas 4
        
        Neste caso não foi necessário usar registos auxiliares.
 
 3. Considerando a tabela seguinte que representa o conteúdo byte-a-byte da memória, nos endereços correspondentes aos arrays **A** e **B**, indique o valor de cada elemento dos arrays assumindo uma organização *little endian.* 
  
<table>
    <tr><th>Tabela 1</th><th>Tabela 2</th></tr>
   <tr><td>
        
|Endereço|Valor| 
|:---:|:---:|    
|A+12 |    |     
|A+11 |0x00|     
|A+10 |0x00|     
|A+9  |0x00|     
|A+8  |0x01|     
|A+7  |0x22|     
|A+6  |0xED|     
|A+5  |0x34|     
|A+4  |0x00|     
|A+3  |0x00|     
|A+2  |0x00|     
|A+1  |0x00|     
|A+0  |0x12|
        
</td><td>

|Endereço|Valor|
|:---:|:---:|
|B+12  |    |
| B+11 |0x00|
| B+10 |0x00|
| B+9  |0x00|
| B+8  |0x02|
| B+7  |0x00|
| B+6  |0x00|
| B+5  |0x50|
| B+4  |0x02|
| B+3  |0xFF|
| B+2  |0xFF|
| B+1  |0xFF|
| B+0  |0xFE| 

</td></tr>

</table>


<table>
    <tr><th>Exercício 1</th><th>Exercício 2</th></tr>
   <tr><td>
        
|Endereço|Valor| 
|:---:|:---:|    
|A[0] |0x00000012|     
|A[1] |0x22ED3400|     
|A[2] |0x00000001|     
        
</td><td>

|Endereço|Valor|
|:---:|:---:|
|B[0]  |0xFFFFFFFE|
| B[1] |0x00005002|
| B[2] |0x00000002|

</td></tr>

</table>


4. Assumindo que g = -3 e h = 2, qual o valor final das variáveis f e j?

        B2      =   0x00000002  <=> 2dec
        A[B[2]] =   0x00000001  <=> 1dec 
        
        f <=> -3 + 2 + 2 = 1
        j <=> 2 - 1 = 1
        
        



### 62. Pretende-se escrever uma função para a troca do conteúdo de duas variáveis (troca(a, b);). Isto é, se, antes da chamada à função, a=2 e b=5, então, após a chamada à função, os valores de a e b devem ser: a=5 e b=2.

**Uma solução incorreta para o problema é a seguinte:**

```
void troca(int x, int y){
    int aux;
    aux = x;
    x = y;
    y = aux;
} 
```

**Identifique o erro presente no trecho de código e faça as necessárias correções para que a função tenha o
comportamento pretendido**

    Resolução:
    
    void troca(int *x, int *y){
        int aux;
        aux = *x;
        *x = *y;
        *y = aux;
    } 



### 63. Na instrução "jr $ra", como é obtido o endereço-alvo? 

    O endereço alvo é obtido lendo o registo $ra


### 64. Qual é o menor e o maior endereço para onde uma instrução "j", residente no endereço de memória 0x5A18F34C, pode saltar? 

    A operação J é do tipo J, o operando de endereço tem um tamanho de 26bits o que equivale a uma gama de 2^26 instruções.
    
    0x5A18F34C <=> 0101-10100001100011110011010011-00
     
    Minimo = 0101-100000000000000000000000000-00 <=> 0xB0000000
    Máximo = 0101-111111111111111111111111111-00 <=> 0xBFFFFFFC
    

### 65. Qual é o menor e o maior endereço para onde uma instrução "beq", residente no endereço de memória 0x5A18F34C, pode saltar?

    A operação BEQ é do tipo I, o campo offset tem 16 bits logo podemos saltar para 2^16 instruções = [-32 768, 32 767]
    
    [OPCODE (6)] [Rs (5)]  [Rt (5)]  [offset(16)]
    
    0x5A18F34C <=> 01011010000110001111001101001100

    Minimo = 0x5A18F34C - 0x00008000 <=> 0x5A18734C
   
    01011010000110001111001101001100
    11111111111111111000000000000000 # 00000000000000001000000000000000
    01011010000110000111001101001100   <=> 5A18734C
                      
    1511584588 - 32 767 = 1511551820 = 5A18734C

    
    Máximo = 0x5A18F34C + 0x00007FFF <=> 0x5A19734B
    
    01011010000110001111001101001100
    00000000000000000111111111111111
    01011010000110010111001101001011       
    
    1511584588 +  32767 = 1511617355 = 0x5A19734B
    
  

### 66. Qual é o menor e o maior endereço para onde uma instrução "jr", residente no endereço de memória 0x5A18F34C pode saltar? 
    
    A instrução JR pode saltar para qualquer endereço desque este seja múltiplo de 4
    


### 67. Qual a gama de representação da constante nas instruções aritméticas imediatas?

        O operando Imm tem um tamanho de 16bits logo pode representar 2^16 constantes diferentes


### 68. Qual a gama de representação da constante nas instruções lógicas imediatas?

        O operando Imm tem um tamanho de 16bits logo pode representar 2^16 constantes diferentes


### 69. Por que razão não existe, no ISA do MIPS, uma instrução que permita manipular diretamente uma constante de 32 bits?

    Cada instrução esta códificada em 32bits, e todas necessitam de um OPCODE de 6 bits, isto faz com que não haja espaço
        para acomudar uma constante de 32bits


### 70. Como é que, no assembly do MIPS, se podem manipular constantes de 32 bits?

    Referenciando se a elas via registos, usando, por exemplo as instruções LUI e OR, para inserir valores nos bits mais significativos e menos significativos.


### 71. Apresente a decomposição em instruções nativas das seguintes instruções virtuais:

|Instrução|Nativa|
|:---|:---|
|LI     $6,0x8B47BE0F|  `LUI $6, 0x8B47` <br> `ORI $6, 0xBE0F`|
|XORI   $3,$4,0x12345678| `LUI $1,0x1234` <br> `ORI $1, 0x5678` <br> `XOR $3,$4, $t1`|
|ADDI   $5,$2,0xF345AB17| `LUI $1,0xF345` <br> `ADD $5,$2, 0xAB17`|
|BEQ    $7,100,L1| `ORI $1,100` <br> `BEQ $7,$1,L1` |
|BLT    $3,0x123456,L2|  `LUI $1,0x0012` <br> `ORI $1,$1,0x3456`  <br> `SLT $1,$1,$3` <br> `BNE $t1,$0,L2` |



### 72. O que é uma sub-rotina? 

    Uma sob-rotina, é um trecho de código que pode ser chamado mais que uma vez, e após a sua execução volta para o endereço+4 do qual foi chamada.
    
### 73. Qual a instrução do MIPS usada para saltar para uma sub-rotina? 

    JAL - jump and link, faz o jump e guarda em $ra o endereço para returnar a próxima instrução após conclusão da sub-rotina


### 74. Por que razão não pode ser usada a instrução "j" para saltar para uma sub-rotina?

    No fim de uma sub-rotina é chamado o `jr $ra`, se usarmos a instrução J o campo $ra não ficara com o endereço de retorno, 
    no fim da sub-rotina o programa vai fechar em vez de voltar para o endereço + 4 que chamou a sub-rotina.
    
    Para evitar isto é usado a instrução JAL.

 
### 75. Quais as operações que são sequencialmente realizadas na execução de uma instrução "jal"? 

    A instrução JAL é usada quando pretendemos chamar uma sub-rotina.


### 76. Qual o nome virtual e o número do registo associado à execução dessa instrução?

    O nome virtual é $ra e o número do registo é 31


### 77. No caso de uma sub-rotina ser simultaneamente chamada e chamadora (sub-rotina intermédia) que operações é obrigatório realizar nessa sub-rotina?

    A sub-rotina deve salvaguardar o registo $ra, e deve salvar antes de usar qualquer um dos registos $s0..$s7
    Deve tambem alucar o espaço na pilha que necessitar.
    
    No fim da sub-rotina, antes de chamar jr $ra, deve repor todos os campos alterados, o $ra e, caso tenha alterado, os registos $s0..$s7.


### 78. Qual a instrução usada para retornar de uma sub-rotina? 

    jr $ra


### 79. Que operação fundamental é realizada na execução dessa instrução? 

    A operação jr $ra volta para o endereço + 4 que chamou a sub-rotina.

### 80. O que é uma stack e qual a finalidade do stack pointer?

    O stack pointer é um endereço inicial onde a sub-rotina atual pode guardar campos.
    O stack é utilizado para salvaguardar campos que as sub-rotinas necessitem.


### 81. Como funcionam as operações de push e pop? 

    A operação puch vai alocar espaço na stack.
    A operação pop vai libertar o espaço anteriormente alocado da stack.


### 82. Por que razão as stacks crescem normalmente no sentido dos endereços mais baixos? 

    Permite uma gestão simplificada da fronteira entre os segmento de dados e stack.
    Assim não temos de defeiir um limite para o nosso segmento de dados e o limite onde acaba a stack. 

### 83. Quais as regras para a implementação em software de uma stack no MIPS?

    1: O $sp contem o endereço da ultima posição ocupada pela stack
    2: A stack deve crescer no sentido decrescente.
    
    Para introduzir algo na stack deve se subtrair ao $sp o número de bytes que vamos utilizar,
        no fim devemos repor a stack somando esse mesmo número


### 84. Qual o registo usado, no MIPS, como stack pointer? 
    
    O registo usado é o $sp


### 85. De acordo com a convenção de utilização de registos no MIPS: 

1. Que registos são usados para passar parâmetros e para devolver resultados de uma sub-rotina?

        Para passar parâmetros são usados os registos: $a0..$a3
        Para devolver resultados são usados os registos: $v0..$v1

2. Quais os registos que uma sub-rotina pode livremente usar e alterar sem necessidade de prévia salvaguarda? 

        Pode alterar os registos:
        $t0..$t9
        $a0..$a3
        $v0..$v1
        
        $f0..$f18
        
3. Quais os registos que uma sub-rotina não pode alterar? 
        
        Uma sub-rotina não pode alterar (sem salvaguardar):
        
        $s0..$s7
        $f20-$f30
        
        
        Não pode alterar:
        $at
        $zero
        $k
        
4. Quais os registos que uma sub-rotina chamadora tem a garantia que a sub-rotina chamada não altera? 
    
        $s0..$s7
        $f20-$f30

5. Em que situação devem ser usados registos **$sn**? 
        
        Devem ser usados os registos $sn em todas as variáves que sejam necessárias após a chamada da sub-rotina.
        
6. Em que situação devem ser usados os restantes registos: **$tn**, **$an** e **$vn**?    
        
        $tn: registos de uso temporário.
        $an: usado para passar argumentos.
        $vn: usado para devolver valores.

### 86. De acordo com a convenção de utilização de registos do MIPS:

1. Que registos podem ter que ser copiados para a stack numa sub-rotina intermédia?

        Registos $ra e registos $sn que sejam utilizados.
    
2. Que registos podem ter que ser copiados para a stack numa sub-rotina terminal? 

        Nenhum, pois não existe necessidade de usar registos $sn e como não é chamado nenhuma outra sub-rotina não é necessário salvaguardar o $ra.

### 87. Para a função com o protótipo seguinte indique, para cada um dos parâmetros de entrada e para o valor devolvido, qual o registo do MIPS usado para a passagem dos respetivos valores: 

`char fun(int a, unsigned char b, char *c, int *d);`
        
        O resultado é devolvido em $v0
        int a   ->  $a0
        char b  ->  $a1
        char *c ->  $a2
        int *d  ->  $a3

### 88. Para uma codificação em complemento para 2, apresente a gama de representação que é possível obter com **3**, **4**, **5**, **8** e **16** bits (indique os valores-limite da representação em binário, hexadecimal e em decimal com sinal e módulo). 

## POR FAZER

|Decimal|Decimal com sinal|Binário|Hexadecimal|Módulo|
|:---:|:---:|:---:|:---:|:---:|
|3| [-4,3] | [] | [0xFC,0x3] | 2^3 |
|4| [-8,7] | [] | [0xF8,0x7] | 2^4 |
|5| [-16,15] | [] | [0xF0,0x0] | 2^5 |
|8| [-255,254] | [] | [0xF01,0x0] | 2^8 |
|16| [-65 538,65 537]| [] | [0xFFFEFFFE,0x10001] | 2^16 |


### 89. Traduza para assembly do MIPS a seguinte função “fun1()”, aplicando a convenção de passagem de parâmetros e salvaguarda de registos: 

```
char *fun2(char *, char);

char *fun1(int n, char *a1, char *a2){
    int j = 0;
    char *p = a1;

    do{
        if((j % 2) == 0)
            fun2(a1++, *a2++);
    } while(++j < n);
    *a1='\0';
    return p;
    } 
```
            .data
            .text
            .globl  fun1
       
        # $s0 -> n
        # $s1 -> a1
        # $s2 -> a2
        # $s3 -> j
        # $s4 -> p
        
        fun1:   addiu   $sp,$sp,-24
                sw      $ra,0($sp)
                sw      $s0,0($sp)
                sw      $s1,0($sp)
                sw      $s2,0($sp)
                sw      $s3,0($sp)
                sw      $s4,0($sp)
                move    $s4,$a1         # *p = a1
                li      $s3,0           # j = 0
         do:    rem     $t0,$s3,2       # (j % 2)
         if:    bnez    $t0,endif       # if((j % 2) == 0)    
                lb      $a1,0($a2)      # a1 = *a2
                addi    $s2,$s2,1       # *a2++
                move    $a0,$s1
                jal     fun2   
                addiu   $s1,$s1,1       # a1++  
                addi    $s3,$s3,1       # j++
         endif: blt     $s3,$s0,do
                sb      '\0', 0($s1)
                move    $v0,$s4         # return p                       
                lw      $ra,0($sp)
                lw      $s0,0($sp)
                lw      $s1,0($sp)
                lw      $s2,0($sp)
                lw      $s3,0($sp)
                lw      $s4,0($sp)
                addiu   $sp,$sp,24
                jr      $ra
        

### 90. Determine a representação em complemento para 2 com 16 bits das seguintes quantidades: 

|5,| -3, |-128, |-32768,| 31,| -8, | 256,| -32 |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|


### 91. Determine o valor em decimal representado por cada uma das quantidades seguintes, supondo que estão codificadas em complemento para 2 com 8 bits: 

|0b00101011| 0xA5| 0b10101101| 0x6B| 0xFA| 0x80|
|:---:|:---:|:---:|:---:|:---:|:---:|
|43| -91 |-83| 107 | -6 |-128|


### 92. Determine a representação das quantidades do exercício anterior em hexadecimal com 16 bits (também codificadas em complemento para 2).

|0b00101011| 0xA5| 0b10101101| 0x6B| 0xFA| 0x80|
|:---:|:---:|:---:|:---:|:---:|:---:|
|0x002B| 0xFFA5| | 0xFFAD| 0xFFFA| 0xFF80|


### 93. Como é realizada a deteção de overflow em operações de adição com quantidades sem sinal?

        O overflow ocorre se houver um bit de carry-out no fim da adição.

### 94. Como é realizada a deteção de overflow em operações de adição com quantidades com sinal (codificadas em complemento para 2)? 

        O overflow é detectado se o but mais significativo é diferente do carry-out.

### 95. Considere os seguintes pares de valores em **$s0** e **$s1**:

```
a) $s0 = 0x70000000 $s1 = 0x0FFFFFFF
b) $s0 = 0x40000000 $s1 = 0x40000000 
```

1. Qual o resultado produzido pela instrução add $t0, $s0, $s1? 

        a) 0x70000000 + 0x0FFFFFFF = 0x7FFFFFFF
        b) 0x40000000 + 0x40000000 = 0x80000000

2. Para a alínea anterior os resultados são os esperados ou ocorreu overflow? 
        
        Houve overflow na operação b), a soma de 2 positivos deu 1 negativo.
        
3. Qual o resultado produzido pela instrução sub $t0, $s0, $s1?

        a) 0x70000000 - 0x0FFFFFFF = 0x60000001
        b) 0x40000000 - 0x40000000 = 0x00000000

4. Para a alínea anterior os resultados são os esperados ou ocorreu overflow? 
        
        Não houve overflow em nenhuma das operações.
        
5. Qual o resultado produzido pelas instruções:

    ```
    add $t0, $s0,$s1
    add $t0, $t0,$s1 
    ```

        a)  0x70000000 + 0x0FFFFFFF = 0x7FFFFFFF
            0x7FFFFFFF + 0x0FFFFFFF = 0x8FFFFFFE 
            
        b)  0x40000000 + 0x40000000 = 0x80000000
            0x80000000 + 0x40000000 = 0xC0000000
        

6. Para a alínea anterior os resultados são os esperados ou ocorreu overflow?

        Houve overflow na operação a) e b), a soma de 2 positivos deu 1 negativo.

### 96. Para a multiplicação de dois operandos de "m" e "n" bits, respetivamente, qual o número de bits necessário para o armazenamento do resultado? 

## POR FAZER

### 97. Apresente a decomposição em instruções nativas das seguintes instruções virtuais:


## POR FAZER

| Instrução |
| mul  $5,$6,$7 |
|:---:|
| la   $t0,label c/ label = 0x00400058 |
| div  $2,$1,$2 |
| rem  $5,$6,$7 |
| ble  $8,0x16,target|
| bgt  $4,0x3F,target |

### 98. Determine o resultado da instrução **mul $5,$6,$7**, quando 

`$6=0xFFFFFFFE e $7=0x00000005.`


               |1111 1111 1111 1111 1111 1111 1111 1110
            X  |0000 0000 0000 0000 0000 0000 0000 0101
           --------------------------------------------
               |1111 1111 1111 1111 1111 1111 1111 1110
             11|1111 1111 1111 1111 1111 1111 1111 10
            100|1111 1111 1111 1111 1111 1111 1111 0110 => 4FFFFFFF6 > 32bits houve overflow!
             
             No Registo $5 é guardado o valor: 0xFFFFFFF6 


### 99. Determine o resultado da execução das instruções virtuais **div $5,$6,$7** e **rem $5,$6,$7** quando **$6=0xFFFFFFF0** e **$7=0x00000003**

        div:
        FFFFFFF0 / 3
        
## POR FAZER

### 100. Admita que pretendemos executar, em Assembly do MIPS, as operações:

`$t0 = $t2/$t3 e $t1 = $t2 % $t3.`

1. Escreva a sequência de instruções em Assembly que permitem realizar estas duas operações. Use apenas instruções nativas 

        div     $t2,$t3     # faz a divisão e guarda o resto em HI e o quociente em LO
        mflo    $t0         # transfere para $t0 o resto guardado em LO
        mfli    $t1         # transfere para $t1 o qouciente guardado em HI       

### 101. Descreva as regras que são usadas, na ALU do MIPS, para realizar uma divisão inteira entre duas quantidades com sinal. 

        - Dividem-se dividendo por divisor em módulo
        - O qouciente tem sinal negativo se os sinais de dividendo e divisor forem diferentes
        - O resto tem mesmo sinal do dividendo
        
        Exemplos:
        
        -7 / 3 = -2         resto = -1
         7 / -3 = -2        resto =  1
        
        Dividendo = Divisor * Qouciente + Resto
        

### 102. Considerando que **$t0=-7** e **$t1=2**, determine o resultado da instrução **div $t0,$t1** e o valor armazenado respetivamente nos registos **HI** e **LO**. 

        -7 / 2 = -3     resto = -1
        
        HI: 0xFFFFFFFF
        LO: 0xFFFFFFFD

### 103. Repita o exercício anterior admitindo agora que **$t0=0xFFFFFFF9** e **$t1=0x00000002**.

        0xFFFFFFF9 >> 1 = 0xFFFFFFFC
        
        1111111....1100  1001
        
        HI: 0x00000000
        LO: 0xFFFFFFFC

### 104. Considerando que **$5=-9** e **$10=2**, determine o valor que ficará armazenado no registo destino pela instrução virtual **rem $6, $5, $10**. 

### 105. Para a implementação de uma arquitetura de multiplicação de 32 bits são necessários, entre outros, registos para o multiplicador e multiplicando, e ainda uma ALU. Determine a dimensão exata, em bits, de cada um destes três elementos funcionais. 

### 106. As duas sub-rotinas seguintes permitem detetar overflow nas operações de adição com e sem sinal, no MIPS. Analise o código apresentado e determine o resultado produzido, pelas duas sub-rotinas, nas seguintes situações:

```
a) $a0=0x7FFFFFF1, $a1=0x0000000E;
b) $a0=0x7FFFFFF1, $a1=0x0000000F;
c) $a0=0xFFFFFFF1, $a1=0xFFFFFFFF;
d) $a0=0x80000000, $a1=0x80000000;

# Overflow detection, signed
# int isovf_signed(int a, int b);

isovf_signed:   ori         $v0,$0,0
                xor         $1,$a0,$a1
                slt         $1,$1,$0
                bne         $1,$0,notovf_s
                addu        $1,$a0,$a1
                xor         $1,$1,$a0
                slt         $1,$1,$0
                beq         $1,$0,notovf_s
                ori         $v0,$0,1
notovf_s:       jr          $ra

# Overflow detection, unsigned
# int isovf_unsigned(unsigned int a, unsigned int b);

isovf_unsig:    ori         $v0,$0,0
                nor         $1,$a1,$0
                sltu        $1,$1,$a0
                beq         $1,$0,notovf_u
                ori         $v0,$0,1
                notovf_u:   jr $ra
```




### 156. Admita uma implementação pipelined da arquitetura MIPS com unidade de forwarding para EX e ID. Identifique, para as seguintes sequências de instruções, de onde e para onde deve ser executado o forwarding para que não seja necessário realizar qualquer stall ao pipeline:

```
a.
    add $t0,$t1,$t2
    lw $t1,0($t3)
    beq $t3,$t0,LABEL

b.
    sub $t0,$t1,$t2
    addi $t3,$t0, 0x20

c.
    lw $t0,0($t2)
    sw $t3,0($t0)

d.
    lw $t3,0($t6)
    xori $t0,$t4,0x20
    sw $t3,($t0)
```
    a)
    b)
    c) Sem solução
    d)
