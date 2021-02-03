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
    Fetch:    Obtem a instrução a ser executada
    Decode:   Descodifica a instrução
    Execute:  Executa a instrução
    Store:    Guarda o resultado
  

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
    I: [OPCODE (6)] [Rs (5)]  [Rt (5)]  [         Immediate(15)         ]    
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
c = a >> 5 – 2 * b;
```

    srl     $a2,$a0,2       # z = x >> 2
    addu    $a2,$a2,$a1     # z = x >> 2 + y
    sra     $t2,$t0,3       # c = a >> 5 - 2
    mul     $t2,$t2,$t1     # c = a >> 5 – 2 * b;
   

### 34. Considere que as variáveis g, h, i e j são conhecidas e podem ser representadas por uma variável de 32 bits num programa em C. Qual a correspondência em linguagem C às seguintes instruções: 

    a.  add h, i, j     # h =  h = i + j
    
    b.  addi j, j, 1    # h++
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
    
    O MIPS é byte-addressable 

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
