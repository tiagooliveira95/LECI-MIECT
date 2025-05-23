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
     
    Minimo = 0101-000000000000000000000000000-00 <=> 0x50000000
    Máximo = 0101-111111111111111111111111111-00 <=> 0x5FFFFFFC
    

### 65. Qual é o menor e o maior endereço para onde uma instrução "beq", residente no endereço de memória 0x5A18F34C, pode saltar?

## Rever

    A operação BEQ é do tipo I, o campo offset tem 16 bits logo podemos saltar para 2^16 instruções = [-32 768, 32 767]
    
    [OPCODE (6)] [Rs (5)]  [Rt (5)]  [offset(16)]
    
    0x5A18F34C <=> 01011010000110001111001101001100

    Minimo = 0x5A18F34C - 0x00008000 <=> 0x5A18734C
   
    01011010000110001111001101001100
    11111111111111111000000000000000 # 00000000000000001000000000000000
    01011010000110000111001101001100   <=> 5A18734C
                      
    1511584588 - 32 767 = 1511551820 = 5A18734C
    377 896 147 - 32767 = 1 511 453 520

    
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

        O overflow é detectado se o bit mais significativo é diferente do carry-out.

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
|:---|
| mul  $5,$6,$7 |
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

## POR FAZER DUVIDA

        0xFFFFFFF9 >> 1 = 0xFFFFFFFC
        
        1111111....1100  1001
        
        HI: 0x00000000
        LO: 0xFFFFFFFC

### 104. Considerando que **$5=-9** e **$10=2**, determine o valor que ficará armazenado no registo destino pela instrução virtual **rem $6, $5, $10**. 

        -9 / 2 = -4      resto = -1
        
        O valor guardado em HI vai ser transferido para $6 e este assumira o valor de 0xFFFFFFFF

### 105. Para a implementação de uma arquitetura de multiplicação de 32 bits são necessários, entre outros, registos para o multiplicador e multiplicando, e ainda uma ALU. Determine a dimensão exata, em bits, de cada um destes três elementos funcionais. 

    ALU:                        32 Bits
    Multiplicando:              32 Bits
    Multiplicador/Resultado:    64bits (32/32)
   
### 106. As duas sub-rotinas seguintes permitem detetar overflow nas operações de adição com e sem sinal, no MIPS. Analise o código apresentado e determine o resultado produzido, pelas duas sub-rotinas, nas seguintes situações:

## POR FAZER INCOMPLETO


```
a) $a0=0x7FFFFFF1, $a1=0x0000000E;
b) $a0=0x7FFFFFF1, $a1=0x0000000F;
c) $a0=0xFFFFFFF1, $a1=0xFFFFFFFF;
d) $a0=0x80000000, $a1=0x80000000;


# Overflow detection, signed
# int isovf_signed(int a, int b);

isovf_signed:   ori         $v0,$0,0            # return 0
                xor         $1,$a0,$a1          # $1 = a ^ b    
 
                slt         $1,$1,$0            # $t1 = $1 < 0
                bne         $1,$0,notovf_s      # if($1 < 0){
                addu        $1,$a0,$a1          # $t1 = a + b   
                xor         $1,$1,$a0           # $t1 = 1 ^ a
                
                slt         $1,$1,$0            # $t1 = $1 < 0               
                beq         $1,$0,notovf_s      }if($t1 >= 0 ){
                ori         $v0,$0,1            # return 1

notovf_s:       jr          $ra                 # }

# Overflow detection, unsigned
# int isovf_unsigned(unsigned int a, unsigned int b);

isovf_unsig:    ori         $v0,$0,0            # return 0
                nor         $1,$a1,$0           # $1 = a NOR 0
                sltu        $1,$1,$a0           # $1 = $1 < a
                beq         $1,$0,notovf_u      # if($t1 < a)
                ori         $v0,$0,1            # return 1        
                notovf_u:   jr $ra
```


    a)

    7FFFFFF1 => 0111 1111 1111 1111 1111 1111 0001
    0000000E => 0000 0000 0000 0000 0000 0000 1110

    a ^ b = 0111 1111 1111 1111 1111 1111 1111
    (a ^ b) > 0, $t1 = 1

    isovf_signed return 0
    
    


### 107 As duas sub-rotinas anteriores podem ser também escritas alternativamente com o código abaixo. A abordagem á ligeiramente diferente. No caso de operações sem sinal, o overflow pode ser detetado para as operações de soma e subtração. Analise o código apresentado e determine o resultado produzido, pelas duas sub-rotinas, nas condições indicadas nas alíneas da questão anterior:


## POR FAZER


### 108. Ainda no código das sub-rotinas das questões anteriores, qual a razão para não haver salvaguarda de qualquer registo na stack?

        São sub-rotinas terminais, e nenhuma usa os registos $sn

### 109. Na conversão de uma quantidade codificada em formato IEEE 754, precisão simples, para decimal, qual o número máximo de casas decimais com que o resultado deve ser apresentado?
        
        
        Um resultado pode ser representado com um máximo de 6 casas decimais.
        

### 110. Responda à questão anterior admitindo que o valor original se encontra agora representado com precisão dupla no formato IEEE 754.

        Um resultado pode ser representado com um máximo de 15 casas decimais

### 111. Determine a representação em formato IEEE 754, precisão simples, da quantidade real 19,1875. Determine a representação da mesma quantidade em precisão dupla. 

        19.1875
        
        19 => 10011
        0.187510 => ????
        
        0.1875
        x    2
        ------
        0,3750
         x    2
        -------
        0,7500
        x    2
        -------
        1,5000
        x    2
        -------
        1.00
        ----------------------------------
        19 => 10011
        0.1875 => 0011
        
        19.187510 => 10011.0011 * 2^0 <=>
                     
        Mantissa: 1.00110011 * 2^4
        Exp: 4
          
        Exp(Excesso127) = 4 + 127 = 131 <=> 10000011
        
        Single:
        
        IEEE754(Single) de 19.187510 = 0.10000011.00110011000000000000000
        -----------------------------------
        Double:
       
        Expoente = 1023 + 4 = 001100110
        
        IEEE754(Double) = 0.001100110.0011001100000000000000000000000000000000000
        
 ### 112. Determine, em decimal (vírgula fixa), o valor das quantidades representadas em formato IEEE 754, precisão simples. Na alínea b) apresente apenas o valor em notação científica usando base 2. 
 
 ```
a) 0xC19A8000.
b) 0x80580000.
 ```
 
        0xC19A8000 <=> 11000001100110101000000000000000
        
        IEEE754 1.10000011.00110101000000000000000
        
        Exp = 10000011 => 131 - 127 = 4
        Mantissa = 1.00110101000000000000000 * 2^4
        
        <=> 10011.0101000000000000000 * 2^0
        
        -19.3125
        
        
        0x80580000 => 10000000010110000000000000000000
        
        IEEE754 1.00000000.10110000000000000000000
        
        Exp = 0 caso especial
        
        Mantissa = 0.10110000000000000000000 * 2^-126



### 113. Considere que o conteúdo dos dois seguintes registos da FPU representam a codificação de duas quantidades reais no formato IEEE754 precisão simples: 

    ```
    $f0 = 0x416A0000
    $f2 = 0xC0C00000 
    ```

1.Calcule o resultado das instruções seguintes, apresentando o seu resultado em hexadecimal: 

```
a) abs.s $f4,$f2 # $f4 = abs($f2)
b) neg.s $f6,$f0 # $f6 = neg($f0)
c) sub.s $f8, $f0,$f2 # $f8 = $f0 – $f2
d) sub.s $f10,$f2,$f0 # $f10 = $f2 - $f0
e) add.s $f12,$f0,$f2 # $f12 = $f0 + $f2
f) mul.s $f14,$f0,$f2 # $f14 = $f0 * $f2
g) div.s $f16,$f0,$f2 # $f16 = $f0 / $f2
h) div.s $f18,$f2,$f0 # $f18 = $f2 / $f0
i) cvt.d.s $f20,$f2 # Convert single to double
j) cvt.w.s $f22,$f0 # Convert single to integer 
```

        0x416A0000 => 0.10000010.11010100000000000000000
        0xC0C00000 => 1.10000001.10000000000000000000000
        
        
        a) 
        abs(0x416A0000) => 0.10000010.11010100000000000000000 => 0x416A0000
        abs(0xC0C00000) => 0.10000001.10000000000000000000000 => 0x40C00000
        
        b)
        neg(0x416A0000) => 1.10000010.11010100000000000000000 => 0xC16A0000
        neg(0xC0C00000) => 0.10000001.10000000000000000000000 => 0x40C00000
        
        c)
        sub(0x416A0000 - 0xC0C00000)
        
        0.10000010.11010100000000000000000
        1.10000001.10000000000000000000000
        
        Mantissa1 = 1.11010100000000000000000 x 2^3
        Mantissa2 = 1.10000000000000000000000 x 2^2
        
        2 Passo: Igualar expoente ao maior

        Mantissa1 = 1.11010100000000000000000 x 2^3
        Mantissa2 = 0.11000000000000000000000 x 2^3
        -------------------------------------------
                      1.11010100000000000000000
                    + 0.11000000000000000000000 
                    ----------------------------
                     10.10010100000000000000000  x 2^3
                     
        3 Passo: normalizar
        
        1.010010100000000000000000 x 2^4
        
        IEEE754 = 010000011010010100000000000000000 <=> 0x41A50000
        
        d)  
        0xC0C00000 - 0x416A0000
        
        Mantissa1 = 1.10000000000000000000000 x 2^2
        Mantissa2 = 1.11010100000000000000000 x 2^3
        
        2 Passo: Igualar expoente ao maior
        
        Mantissa1 = 0.11000000000000000000000 x 2^3
        Mantissa2 = 1.11010100000000000000000 x 2^3
        
        0.11000000000000000000000
        1.00111111111111111111111
        +                       1
        --------------------------
        1.11000000000000000000000
        

            1.11000000000000000000000
         +  1.11010100000000000000000
         ----------------------------
           10.10010100000000000000000 * 2^3
          
          1.010010100000000000000000 * 2^4
            
         1.10000011.01001010000000000000000 <=> 0xC1A50000
         
         
    e)
    
    0x416A0000 + 0xC0C00000
    
    0x416A0000 => 0.10000010.11010100000000000000000
    0xC0C00000 => 1.10000001.10000000000000000000000
    
    0x416A0000 => 1.11010100000000000000000 x 2^3
    0xC0C00000 => 0.11000000000000000000000 x 2^3
         

      1.11010100000000000000000
    - 0.11000000000000000000000
    ---------------------------
      1.00010100000000000000000 x 2^3
     
   
     0.10000010.00010100000000000000000 <=> 0x410A0000
    
    f)
    0x416A0000 * 0xC0C00000
    
    0x416A0000 => 0.10000010.11010100000000000000000
    0xC0C00000 => 1.10000001.10000000000000000000000
      
      1.11010100000000000000000
    x 1.10000000000000000000000
    ---------------------------
      111010100000000000000000
    +111010100000000000000000
    -------------------------- 
    10.1011111000000000000000 x 2^5
    
    
    1.01011111000000000000000 x 2^6
    
    1.10000101.01011111000000000000000 <=> 0xC2AF8000
     
    
    g)  
    0x416A0000 / 0xC0C00000
    
    POR FAZER
    
    h) 
    0xC0C00000 / 0x416A0000
    
    POR FAZER
    
    i) 
    0xC0C00000 Convert single to double
    
    0xC0C00000 => 1.10000001.10000000000000000000000
    
    Exp: 2 + 1023 = 1025 <=> 10000000001
    
    1.10000000001.1000000000000000000000000000000000000000000000000000 <=> 0xC018000000000000
    
    j) 
    0x416A0000 Convert single to integer 
    
    1.11010100000000000000000 x 2^3
    
    1110.10100000000000000000 x 2^0
    
    1110 => 0xE
    
    

### 114. Considere a sequência de duas instruções Assembly:


```
lui $t0,0xC0A8
mtc1 $t0,$f8 
```

1.Qual o valor que ficará armazenado no registo $f8, expresso em base dez e vírgula fixa, admitindo uma interpretação em IEEE 754 precisão simples?

        $f8 = 0xC0A80000 <=> 1.10000001.01010000000000000000000
        
        1.01010000000000000000000 x 2^2 <=>
        101.010000000000000000000 x 2^0 = -5,25
        


### 115. Considerando que $f2=0x3A600000 e $f4=0xBA600000, determine o resultado armazenado em $f0 pela instrução sub.s $f0,$f2,$f4

        $f2 = 0x3A600000 <=> 0.01110100.11000000000000000000000
        $f4 = 0xBA600000 <=> 1.01110100.11000000000000000000000
        
        $f2 = 11000000000000000000000 x 2^-11
        $f4 = 11000000000000000000000 x 2^-11
        
        $f4 - $f2 = 0x00000000


### 116. Repita o exercício anterior admitindo agora as seguintes condições: 

1. $f4=0x3F100000 e $f6=0x408C0000 e a instrução add.s $f8,$f4,$f6.

        $f4 = 0x3F100000 <=> 0 01111110.00100000000000000000000
        
        1.00100000000000000000000 x 2^-1
        
        <=> 0.00100100000000000000000000 x 2^2

        
        $f6 = 0x408C0000 <=> 0.10000001.00011000000000000000000
       
        1.00011000000000000000000 x 2^2
        
          1.00011000000000000000000
        + 0.00100100000000000000000
        ---------------------------
          1.00111100000000000000000 x 2^2
          
          
          0.10000001.00111100000000000000000 <=> 0x409E0000
        

2. $f2=0x3F900000 e $f4=0xBEA00000 e a instrução mul.s $f0,$f2,$f4

        $f2 = 0x3F900000 <=> 0.01111111.00100000000000000000000
        
        $f2 = 1.00100000000000000000000 x 2^0
        
        $f4 = 0xBEA00000 <=> 1.01111101.01000000000000000000000
        
        1.01000000000000000000000 x 2^-2 
        
            1.00100000000000000000000
        x   1.01000000000000000000000
        ------------------------------
           10010000000000000000000000
          00000000000000000000000000x
       + 10010000000000000000000000xx
        -------------------------------   
         10110100000000000000000000 x 2^-2           
           
         1.01111101.10110100000000000000000 <=> 0xBEDA0000

3. $f2=0x258c0000 e $f4=0x41600000 e a instrução div.s $f0,$f2,$f4

## POR FAZER


### 117 Numa norma hipotética KPT de codificação em vírgula flutuante, a mantissa normalizada após a realização de uma operação aritmética tem o valor 1.1111 1111 1111 1110 1000 0000. Qual será o valor final da mantissa (com 16 bits na parte fracionária) após arredondamento para o ímpar mais próximo? 


        1.1111 1111 1111 1110 1000 0000
                              |||_ Sticky bit
                              ||__ Round bit             
                              |___ Guard bit
                              
        Arredondar: 1.1111 1111 1111 1111
                            
                              
### 118. Assuma que x é uma variável do tipo float residente em $f8 e que o label endWhile corresponde ao endereço da primeira instrução imediatamente após um ciclo while(). Se a avaliação da condição para executar o loop for while (x > 1.5){..} escreva, em Assembly do MIPS, a sequencia de instruções necessárias para determinar esta condição. 
        
        x: .float 1.5
        ...
        l.s $f6,x
        c.le.s $f8,$f6
        bc1t endwhile

### 119. Determine, de acordo com o formato IEEE 754 precisão simples, a representação normalizada, e arredondada para o par mais próximo, do número 100,11011000000000000010110. 


        100,11011000000000000010110 x 2^0 <=>
        
        Arredondado: 1,00110110000000000000110xx x 2^2
                      
        


### 120. Numa implementação single cycle da arquitetura MIPS, a frequência máxima de operação é de 2GHz (para os atrasos de propagação a seguir indicados). Determine o atraso máximo que pode ocorrer nas operações da ALU. Considere que, para o File Register e para as memórias, os tempos de escrita indicados são os tempos de preparação da operação antes de uma transição ativa do sinal de relógio. 

*Memórias externas: leitura – 175ps, escrita – 120ps; 
File register: leitura – 45ps, Escrita – 15ps;
Unidade de Controlo: 10ps; 
Somadores: 40ps; 
Outros: 0ns; 
Setup time do Program Counter: 5ps*

        
        
        tEXEC = tRM + max( tRRF, tCNTL, tSE ) + tALU + tRM + tWRF
 
        tEXEC = 175ps + max( 45ps, 10, 0ns ) + tALU + 175 + 15ps
        
        tALU = 90ps



### 121. Determine, numa implementação single-cycle da arquitetura MIPS, a frequência máxima de operação imposta pela instrução “sw”, assumindo os atrasos a seguir indicados: 


*Memórias externas: leitura – 12ns, escrita – 4ns; 
File register: leitura – 4ns, Escrita – 1ns;
Unidade de Controlo: 1ns; 
ALU (qualquer operação): 5ns; 
Somadores: 2ns; 
Outros: 0ns.
Setup time do Program Counter: 1ns*


        tEXEC = tRM + max( tRRF, tCNTL, tSE ) + tALU + tWM
        
        tEXEC = 12ps + max(4ns,1ns,0ns) + 5ns + 4ns = 25ps


### 122. Determine, numa implementação single-cycle da arquitetura MIPS, a frequência máxima de operação imposta pela instrução "beq", assumindo os atrasos a seguir indicados, é: 

*Memórias externas: leitura – 11ns, escrita – 3ns;
File register: leitura – 3ns, Escrita – 1ns;
Unidade de Controlo: 1ns;
ALU (qualquer operação): 5ns;
Somadores: 2ns; 
Outros: 0ns.
Setup time do Program Counter: 1ns*


    tEXEC = tRM + max( max( tRRF , tCNTL ) + tALU, tSE + tSL2 + tADD ) + tstPC

    tEXEC = 11ns + max( max(3ns , 1ns) + 5ns, 0ns + 0ns + 2ns ) + 1ns
    tEXEC = 11 + 8 + 1 = 20ns

### 123. Determine, numa implementação single cycle da arquitetura MIPS, o período mínimo do sinal de relógio imposto pelas instruções tipo R, assumindo os atrasos a seguir indicados, é:

*Memórias externas: leitura – 12ns, escrita – 4ns;
File register: leitura – 3ns, Escrita – 1ns;
Unidade de Controlo: 1ns; 
ALU (qualquer operação): 6ns; 
Somadores: 2ns; Outros: 0ns.
Setup time do Program Counter: 1ns*

        tEXEC = tRM + max( tRRF, tCNTL ) + tALU + tWRF
        
        tEXEC = 12ns + max( 3ns, 1ns ) + 6ns + 1
        tEXEC = 12 + 3 + 6 + 1 = 22ns
        
        
### 124. Identifique os principais aspetos que caracterizem uma arquitetura single cycle, quer do ponto de vista do modelo da arquitetura, como das características da sua unidade de controlo. 

        Em single cycle:
        
        1. A unidade de controlo é uma maquina combinátoria.
        2. Cada instrução demora 1 ciclo de clock
        3. A memoria esta organizada em Von Neumann, existe apenas 1 memoria para instruções e data
        
        
### 125. Numa implementação single cycle da arquitetura MIPS, no decurso da execução de uma qualquer instrução, a que corresponde o valor presente na saída do registo PC?

        O valor PC corresponde ao endereço da instrução que esta neste momento a ser executada


### 126. Preencha a tabela seguinte, para as instruções indicadas, com os valores presentes à saída da unidade de controlo principal da arquitetura single cycle dada nas aulas.



|Instrução|Opcode|ALUOp[1..0]|Branch|RegDst|ALUSrc|MemtoReg|RegWrite|MemRead|MemWRite|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|lw          |100011| 00 |  0  |  0  |  1  |  1   |  1   |  1   |  0   |
|sw          |101011| 00 |  0  |  x  |  1  |  x   |  0   |  0   |  1   |
|addi        |001000| 00 |  0  |  0  |  1  |  0   |  1   |  0   |  0   |
|slti        |001010| 11 |  0  |  0  |  1  |  0   |  1   |  0   |  0   |
|beq         |000100| 01 |  1  |  x  |  0  |  x   |  0   |  0   |  0   |
|R - Format  |000000| 10 |  0  |  1  |  0  |  0   |  1   |  0   |  0   |





### 127. Admita que na versão single cycle do CPU MIPS dado nas aulas, pretendíamos acrescentar o suporte das instruções jal address e jr $reg. Esquematize as alterações que teria de introduzir no datapath para permitir a execução destas instruções (use o esquema da próxima página). 
 
## POR FAZER


### 128. Admita que na versão single cycle do CPU MIPS, pretendíamos executar a instrução slt $3,$5,$9. Descreva por palavras suas como é esta instrução realizada ao nível da ALU, e qual o conteúdo final no registo $3, admitindo que $5=0xFF120008 e $9=0x00C00FFF.

|Instrução|Opcode|ALUOp[1..0]|Branch|RegDst|ALUSrc|MemtoReg|RegWrite|MemRead|MemWRite|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|slt |001010| 11 |  0  |  0  |  1  |  0   |  1   |  0   |  0   |

    A ALU vai subtrair o valor em $5 com o valor em $9 se o MSB for 0 (positivo) escreve 0 no resgisto de distion, caso contrário escreve 1.
    
    0xFF120008 => 1111 1111 0001 0010 0000 0000 0000 1000
    0x00C00FFF => 0000 0000 1100 0000 1111 1111 1111 1111
    
     11111111000100100000000000001000
    +11111111001111110000000000000001
    ---------------------------------                              
    111111110010100010000000000001001
    
    $3 = 00000001
         
### 129. Suponha que os tempos de atraso introduzidos pelos vários elementos funcionais de um datapath single-cycle são os seguintes:


|||
|:---|:---|
|Acesso à memória para leitura (tRM): 12ns           |Acesso à memória para preparar escrita (tWM): 4ns|
|Acesso ao register file para leitura (tRRF): 5ns   | Acesso ao register file para preparar escrita (tWRF): 2ns|
|Operação da ALU (tALU): 7ns                         |Operação de um somador (tADD): 2ns|
|Multiplexers e restantes elementos funcionais: 0ns | Unidade de controlo (tCNTL): 2ns|
|Tempo de setup do PC (tstPC): 1ns||

1) Determine o tempo mínimo para execução das instruções tipo R, LW, SW, BEQ e J. 

        R: tEXEC = tRM + max( tRRF, tCNTL ) + tALU + tWRF <=>
           tEXEC = 12 + max( 5, 2 ) + 7 + 2 = 26ns       
        
        LW: tEXEC = tRM + max( tRRF, tCNTL, tSE ) + tALU + tRM + tWRF <=>
            tEXEC = 12 + max( 5, 2, 0 ) + 7 + 12 + 2 = 38ns
        
        SW: tEXEC = tRM + max( tRRF, tCNTL, tSE ) + tALU + tWM
            tEXEC = 12 + max( 5, 2, 0 ) + 7 + 4 = 28ns
        
        BEQ: tEXEC = tRM + max( max( tRRF , tCNTL ) + tALU, tSE + tSL2 + tADD )+ tstPC
             tEXEC = 12 + max( max( 5 , 2 ) + 7, 0 + 0 + 2 ) + 1 = 25ns
        
        J: tEXEC = tRM + max(tCNTL, tSL2) + tstPC
           tEXEC = 12 + max(2, 0) + 1 = 15ns


2) Calcule a máxima frequência do relógio que garanta uma correta execução de todas as instruções.

        Instrução maior é LW com 38ns = 26MHz




### 130. Suponha agora que dispunha de uma tecnologia que que o período de relógio podia ser adaptado instrução a instrução, em função da instrução em curso. Determine qual o ganho de eficiência que poderia obter com esta tecnologia face a uma tecnologia em que a frequência do relógio é a que obteve na questão anterior (admita os mesmos atrasos de propagação). Para isso, assuma que o programa de benchmarking tem a seguinte distribuição de ocorrência de instruções: 

*15% de lw, 15% de sw, 40% de tipo R, 20% de branches e 10% de jumps*

##POR FAZER



### 131. Ainda para os tempos utilizados nas duas questões anteriores, determine qual a máxima frequência de trabalho no caso de o datapath ser do tipo multi-cycle. 

    Para a frequencia máxima de um multi-cycle temos de considerar o maior atraso que corresponde ao acesso de memória com 12ns,
    logo a frequencia máxima do multi-cycle é 83MHz





### 132. Considere o datapath multi-cycle presente na figura anterior e a respetiva unidade de controlo. Preencha a tabela abaixo considerando que a coluna da esquerda corresponde ao último ciclo de execução de uma instrução, e que a sequencia em causa é a seguinte: 



```
add $t0, $t2, $t1
sw $t0, 0($t3)
beq $t0, $t1, next
```


|CLOCK| ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|**PCWtriteCond**| 0  | x | 0 | 0 | 0 | x | 0  | 1  |
|**PCWrite**|      0  | 1 | 0 | 0 | 0 | 1 | 0  | x  |
|**MemWrite**|     0  | 0 | 0 | 0 | 1 | 0 | 0  | 0  |
|**MemRead**|      0  | 1 | 0 | 0 | 0 | 1 | 0  | 0  |
|**MemToReg**|     0  | x | x | x | x | x | x  | x  |
|**IRWrite**|      0  | 1 | 0 | 0 | 0 | 1 | 0  | 0  |
|**ALUSelA**|      x  | 0 | 0 | 1 | x | 0 | 0  | x  |
|**ALUSelB**|      x  | 01|11 | 10| xx| 01|11  | xx |
|**ALUOp**|        xx | 00|00 |00 | xx|00 |00  | xx |
|**IorD**|         0  | 0 |x  |x  | 1 | 0 |x   | x  |
|**PCSource**|     xx | 00|xx |xx | xx| 00|xx  | 01 |
|**REGWrite**|     1  | 0 |0  |0  | 0 | 0 |0   |  0 |
|**RegDst**|       1  | x |x  |x  | x | x |x   | x  |




### 133. Repita o exercício anterior para as seguintes sequências de instrução:

```
a)
or $t0, $0, $t1
addi $t0, $t1, 0x20
j label
```

|CLOCK| ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|**PCWtriteCond**| 0 | x  | 0 | 0 | 0 | x  | 0|   0  |
|**PCWrite**|      0 | 1  | 0 | 0 | 0 | 1  | 0|   1  |
|**MemWrite**|     0 | 0  | 0 | 0 | 0 | 0  | 0 |   0  |
|**MemRead**|      0 | 1  | 0 | 0 | 0 | 1  | 0 |   0  |
|**MemToReg**|     0 | x  | x | x | 0 | x  | x |   x  |
|**IRWrite**|      0 | 1  | 0 | 0 | 0 | 1  | 0 |   0  |
|**ALUSelA**|      x | 0  | 0 | 1 | x | 0  | 0 |   x  |
|**ALUSelB**|     xx | 01 |11 | 10| xx| 01 |11 |   xx |
|**ALUOp**|       xx | 00 |00 | 00| xx| 00 |00 |  xx |
|**IorD**|        x  | 0  |x  | x | x | 0  |x  |   x  |
|**PCSource**|    xx | 00 |xx | xx| xx| 00 |xx | 10   |
|**REGWrite**|    1  | 0  |0  | 0 | 1 | 0  |0  |  x   |
|**RegDst**|      1  | x  |x  | x | 0 | x  |x  |  x   |

```
b)
lw $s0, 0($t1)
lw $s1, 4($t1)
add $t2, $s1, $s2
```

|CLOCK| ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|PCWtriteCond|  0  | x   | 0  | 0  | 0  | 0  | x  | 0  |
|PCWrite|       0  | 1   | 0  | 0  | 0  | 0  | 1  | 0  |
|MemWrite|      0  | 0   | 0  | 0  | 0  | 0  | 0  | 0  |
|MemRead|       0  | 1   | 0  | 0  | 1  | 0  | 1  | 0  |
|MemToReg|      1  | x   | x  | x  | x  | 1  | x  | x  |
|IRWrite|       0  | 1   | 0  | 0  | 0  | 0  | 1  | 0  |
|ALUSelA|       x  | 0   | 0  | 1  | x  | x  | 0  | 0  |
|ALUSelB|       xx | 01  |11  | 10 | xx | xx | 01 |11  |
|ALUOp|         xx | 00  |00  | 00 | xx | xx | 00 |00  |
|IorD|          x  | 0   |x   | x  | 1  | x  | 0  |x   |
|PCSource|      xx | 00  |xx  | xx | xx | xx | 00 |xx  |
|REGWrite|       1 | 0   |0   | 0  | 0  |  1 | 0  |0   |
|RegDst|         0 | x   |x   | x  | x  |  0 | x  |x   |

```
c)
sw $t0, 0($t1)
sub $t0, $t3, $t2
slt $t1, $t0, $t2
```

|CLOCK| ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|PCWtriteCond| 0 | x   | 0 | 0  | 0  | x   | 0  |  0  |
|PCWrite|      0 | 1   | 0 | 0  | 0  | 1   | 0  |  0  |
|MemWrite|     1 | 0   | 0 | 0  | 0  | 0   | 0  |  0  |
|MemRead|      0 | 1   | 0 | 0  | 0  | 1   | 0  |  0  |
|MemToReg|     x | x   | x | x  | 0  | x   | x  |  x  |
|IRWrite|      0 | 1   | 0 | 0  | 1  | 1   | 0  |  0  |
|ALUSelA|      x | 0   | 0 | 1  | x  | 0   | 0  |  1  |
|ALUSelB|      xx| 01  |11 | 00 | xx | 01  |11  |  00 |
|ALUOp|        xx| 00  |00 | 10 | xx | 00  |00  |  10 |
|IorD|         1 | 0   |x  | x  | x  | 0   |x   |  x  |
|PCSource|    xx | 00  |xx | xx | xx | 00  |xx  |  xx |
|REGWrite|     0 | 0   |0  | 0  | 1  | 0   |0   |  0  |
|RegDst|       x | x   |x  | x  | 1  | x   |x   |  x  |


### 134. Para as mesmas sequências de instruções apresentadas nos dois exercícios anteriores, preencha, na
forma de um diagrama temporal, a tabela seguinte. 

|CLOCK| ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|PCWtriteCond   |  |   |  |   |   |   |   |   |
|PCWrite|       |   |  |   |   |   |   |   |
|MemWrite|      |   |  |   |   |   |   |   |
|MemRead|       |   |  |   |   |   |   |   |
|MemToReg|      |   |  |   |   |   |   |   |
|IRWrite|       |   |  |   |   |   |   |   |
|ALUSelA|       |   |  |   |   |   |   |   |
|ALUSelB|       |   |  |   |   |   |   |   |
|ALUOp|         |   |  |   |   |   |   |   |
|IorD|          |   |  |   |   |   |   |   |
|PCSource|      |   |  |   |   |   |   |   |
|REGWrite|      |   |  |   |   |   |   |   |
|RegDst|        |   |  |   |   |   |   |   |


### 135. Ainda para as mesmas sequências de instruções apresentadas nos três exercícios anteriores, preencha a tabela abaixo com os valores presentes à saída da ALU e dos elementos de estado indicados. Consulte a tabela da última página se necessário. Admita que, no início de cada sequência, o conteúdo dos registos relevantes é o seguinte: 

*[$t0=0x000013FC],[$t1=0x10010000],[$t2=0x90FFFF64],[$t3=0x00000028] e
que na memória [(0x10010000)=0x00000020] e [(0x10010004)=0x00000038]*


|CLOCK| ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ | ⎍ |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|PCWtriteCond   |  |   |  |   |   |   |   |   |
|PCWrite|       |   |  |   |   |   |   |   |
|MemWrite|      |   |  |   |   |   |   |   |
|MemRead|       |   |  |   |   |   |   |   |
|MemToReg|      |   |  |   |   |   |   |   |
|IRWrite|       |   |  |   |   |   |   |   |
|ALUSelA|       |   |  |   |   |   |   |   |
|ALUSelB|       |   |  |   |   |   |   |   |
|ALUOp|         |   |  |   |   |   |   |   |
|IorD|          |   |  |   |   |   |   |   |
|PCSource|      |   |  |   |   |   |   |   |
|REGWrite|      |   |  |   |   |   |   |   |
|RegDst|        |   |  |   |   |   |   |   |






### 136. Calcule o número de ciclos de relógio que o programa seguinte demora a executar, desde o Instruction fetch da 1ª instrução até à conclusão da última instrução:

```
main:                        # p0 = 0;
        lw      $1,0($0)     # p1 = *p0 = 0x10;
        add     $4,$0,$0     # v = 0;
        lw      $2,4($0)     # p2=*(p0+1)=0x20;
loop:                        # do {
        lw      $3,0($1)     # aux1 = *p1;
        add     $4,$4,$3     # v = v + *p1;
        sw      $4,36($1)    # *(p1 + 9) = v;
        addiu   $1,$1,4      # p1++;
        sltu    $5,$1,$2     #
        bne     $5,$0,loop   # } while(p1 < p2);
        sw      $4,8($0)     # *(p0 + 2) = v;
        lw      $1,12($0)    # aux2 = *(p0 + 3); 
 ```
 
1. Num datapath single-cycle 
        
        3 + 6 + (6 * 4) + 2 = 35 ciclos
    
2. Num datapath multi-cycle

       LW: 5 ciclos
       ADD: 4 ciclos
       SLT: 4 ciclos
       BNE: 3 ciclos
       SW: 4 ciclos
       
       5+4+5 + 5+4+4+4+4+3 + (5+4+5+4+4+3)*4 + 4+5 = 14 + 24 + 24*4 + 9 = 143 ciclos

###  137. Repita o exercício anterior assumindo que o valor armazenado no endereço de memória 0x00000004 é 0x2C. 

        Notas:
        - Ciclo while corre 7 vezes
        
        Single-Cycle: 3 + 6 + (6 * 7) + 2 = 53 ciclos
        Multi-Cycle: 5+4+5 + 5+4+4+4+4+3 + (5+4+5+4+4+3)*7 + 4+5 = 14 + 24 + 24*4 + 9 = 215 ciclos

### 138. Descreva, sucintamente, as principais diferenças, ao nível estrutural, entre os datapath single-cycle e multi-cycle. 

        O single-cycle executa uma instrução a cada ciclo clock, enquanto em multi-cycle uma instrução tem um número váriado de ciclos clock
        podendo esta demorar vários ciclos.
        

### 139. Indique, para o caso de um datapath multi-cycle, quais as operações realizadas pela ALU no decurso dos dois primeiros ciclos de relógio de qualquer instrução. 

    1 clock: 
        - Faz o instruction fetch
         
    2 clock:
        - Atualiza o PC
        - Calcula o endereço branch
         


### 140. Considere o diagrama temporal seguinte relativo à execução de uma sequência de três instruções, das quais apenas a segunda está completamente representada. Obtenha o código assembly desta sequência de três instruções. 

        100011.01110.00101.0000000000100011 LW
        000100.01100.01101.1111111111111100 BEQ
        101010.01101.11011.11000.00000.101010 SLT
        
        lw  $14,35($5)
        beq $11,$12,0xFFFFFFC
        slt $24,$13,$27
        
        
### 142. Considere o datapath multi-cycle e a unidade de controlo fornecidos na figura acima. Admita que os valores indicados no datapath fornecido correspondem à “fotografia” tirada no decurso da execução de uma instrução armazenada no endereço 0x8040000C. Tendo em conta todos os sinais, identifique, em assembly, a instrução que está em execução e a respetiva fase.

        0x295FFFE <=> ....001010010101111111111111111110
        
        0x295FFFE << 2 = 0xA97FFF8
        
        j 0xA97FFF8


### 143 Considere a instrução beq $5 $6,L2 armazenada no endereço 0x0040002C. Admita que $5=0x1001009C e $6=0x100100B0. Identifique os registos representados na figura seguinte e obtenha o código máquina, em hexadecimal, da instrução indicada.

        Linha 1 é o registo $6
        Linha 2 é o PC
        Linha 4 ALUOut
        
        offset: 0x00400044 - 0x00400030 =  0x14
        
        0x14/4 = 5
        
        0001 0000 1010 0110 0000 0000 0101 => 0x10A60005

 
 
 ### 144. Considere o datapath e a unidade de controlo fornecidos na figura acima (com ligeiras alterações relativamente à versão das aulas teórico-práticas). Analise cuidadosamente as alterações introduzidas e identifique quais são as novas instruções que este datapath permite executar quando comparado com a versão fornecida nas aulas TP. 
 
        Instruções jr,jal,sb,bne
 
### 145. Descreva, justificando, as principais características da unidade de controlo numa implementação pipelined da arquitetura MIPS, incluindo a sua natureza (combinatória ou síncrona) os sinais que constituem as variáveis independentes de entrada e as suas saídas. 

        Na implementação pipelined, a unidade de controlo é combinatória, os sinais avançam no pipelina a dace ciclo do clock, tal como os dados.
        
        
### 146. Indique o que determina a máxima frequência de relógio de uma implementação pipelined da arquitetura MIPS com base nos principais elementos operativos que a constituem.         
 
        O que determina a frequencia máxima é definida pela componente mais lenta.
        
        
        
### 147. Calcule, numa implementação pipelined da arquitetura MIPS em que a operação de Write Back é executada a meio do ciclo de relógio, a frequência máxima de operação, assumindo que os elementos operativos apresentam os seguintes atrasos de propagação:

*Memórias externas: Leitura: 10 ns, Escrita: – 8ns; 
File register: Leitura – 2ns, Escrita – 2ns;
Unidade de Controlo: 2ns; 
ALU (qualquer operação): 6ns; 
Somadores: 4ns; 
Outros: 0ns.*

        A operação que demora mais tempo é a de leitura da memória externa, logo 1/10 = 100MHz


*Memórias externas: Leitura: 5 ns, Escrita: – 7ns; 
File register: Leitura – 1ns, Escrita – 1ns;
Unidade de Controlo: 1ns; 
ALU (qualquer operação): 8ns; 
Somadores: 1ns; 
Outros: 0ns.*

        A operação que demora mais tempo é a ALU, logo 1/8 = 125MHz

*Memórias externas: Leitura: 8 ns, Escrita: – 10ns; 
File register: Leitura – 2ns, Escrita – 4ns;
Unidade de Controlo: 2ns; 
ALU (qualquer operação): 6ns; 
Somadores: 2ns; 
Outros: 0ns.*

        A operação que demora mais tempo é a de escrita na memória, logo 1/10 = 100MHz



### 148. Identifique os principais tipos de hazard que podem existir numa implementação pipelined de um processador. 

        Hazard de dados
        Hazard de controlo
        Hazard de Estrutural


### 149. Numa arquitetura pipelined, como se designa a técnica que permite utilizar como operando de uma instrução um resultado produzido por outra instrução que se encontra numa etapa mais avançada do mesmo.

        Forwarding
        
        
### 150. Explique por palavras suas em que circunstâncias pode ocorrer um hazard de dados numa implementação pipelined de um processador.

        Um hazard ocorre quando uma instrução mais atrás no pipeline precisa de um resultado que uma instrução mais a frente do pipeline ainda não acabou de executar.
        
        
### 151. A existência de hazards de controlo pode ser resolvida por diferentes técnicas dependendo da arquitetura em causa. Identifique a técnica usada para o efeito numa arquitetura MIPS com datapath pipelined, como se designa essa técnica e em que consiste. 

        Podemos fazer um stall, que consiste em atrazar a execução de uma dada instrução, ou podemos fazer fowarding que consiste em enviar informação de uma
        instrução mais à frente para uma instrução mais atras no pipeline
        
### 152. Em certas circunstâncias relacionadas com hazards de dados, não é possível resolver o problema sem recorrer a uma paragem parcial do pipeline, através do atraso de um ou mais ciclos de relógio no início da execução de uma instrução. Indique como se designa essa técnica e em que consiste ao nível do controlo do pipeline.

        Consiste em fazer um stall a instrução e aos seus dados e gerar uma bolha nas fazes seguintes (NOP)

### 153. Determine o número de ciclos de relógio que o trecho de código seguinte demora a executar num pipeline de 5 fases, desde o instante em que é feito o Instruction Fetch da 1ª instrução, até à conclusão da última. 

```
add     $1,$2,$3
lw      $2,0($4)
sub     $3,$4,$3
addi    $4,$4,4
and     $5,$1,$5    #"and" em ID, "add" já terminou
sw      $2,0($1)    #"sw" em ID, "add" e "lw" já terminaram
```

        5 + (6-1) = 10 ciclos


### 154. Num datapath single-cycle o código da pergunta anterior demoraria 6 ciclos de relógio a executar. Por
que razão é a execução no datapath pipelined mais rápida? 

        A execução é mais rapida porque a frequencia a que o pipeline pode operar é superior a frequecia que o single-cycle pode operar.

### 155. Quantos ciclos de relógio demora a execução do mesmo código num datapath multi-cycle? 

        4+5+4+4+4+4 = 25 ciclos

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
    sll $t2,$t2,2 
    sw $t3,0($t0)

d.
    lw $t3,0($t6)
    xori $t0,$t4,0x20
    sw $t3,($t0)
```
    a) 1 forwading de BEQ em EX para ID da add
    b) 1 forwading da operação sub para addi
    c) 1 forwading da instrução LW para SW
    d) 1 forwading da instrução XORI para SW


### 157. Descreva, por palavras suas, a função da unidade de forwarding de uma implementação pipelined da
arquitetura MIPS. 


     A unidade forwarding analiza se existe necessidade de fazer forwarding vendo os dados RS e RT em EX e MEM


### 158 Admita o seguinte trecho de código, a executar sobre uma implementação pipelined da arquitetura MIPS com delayed branches, e unidade de forwarding de MEM e WB para o estágio EX.

## por fazer incompleto

1. Identifique os vários hazards neste código e determine se os mesmos podem ser resolvidos por forwarding.

        Existe 2 hazards na 4 que depende da 3, e na 1 que depende da 5

2. Identifique as situações em que é necessário executar stalling do pipeline e o respetivo número de stalls

        2 stalls na beq, não é necessário na lw
        

3. Resolva o problema anterior supondo que a arquitetura suporta forwarding de MEM para ID. 
    
        Trocando a ordem de ORI e SUB
        
        
       
### 159. Para o trecho de código seguinte identifique todas as situações de hazard de dados e de controlo que ocorrem na execução num pipeline de 5 fases, com branches resolvidos em ID. 

```
main:   lw      $1,0($0)
        add     $4,$0,$0
        lw      $2,4($0)
loop:   lw      $3,0($1)
        add     $4,$4,$3
        sw      $4,36($1)
        addiu   $1,$1,4
        sltu    $5,$1,$2
        bne     $5,$0,loop
        sw      $4,8($0)
        lw      $1,12($0) 
```

        Ocorrem hazzards nas linhas 5,6,8,9

### 160. Apresente o modo de resolução das situações de hazard de dados do código da questão 159, admitindo que o pipeline não implementa forwarding

## REVER
        2 stalls para a linha 5
        1 stall na linha 8
        1 stall na linha 9

### 161. Calcule o número de ciclos de relógio que o programa anterior demora a executar num pipeline de 5 fases, sem forwarding, com branches resolvidos em ID e delayed branch, desde o IF da 1ª instrução até à conclusão da última instrução. 









