### 1. Quais são os 3 blocos fundamentais de um sistema computacional? 
    Um sistema computacional é constituido principalmente por 3 blocos:
     
    CPU:      Responsável por processar instruções armazenadas na memória
    Memória:  Armazena os dados de um programa e os seus resultados
    I/O:      Responsável pela comunicação com os periféricos
    
### 2. Quais são os 3 principais blocos funcionais que integram um CPU?
    ALU:              Unidade aritmética
    Registos:         Unidade responsavel por guardar valores de um programa
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
     A unidade de controlo é responsavel por controlar o fluxo da informação dentro da secção de dados
 

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
    
    Processamento, Transferencia de informação e Controlo de fluxo

### 20. O que carateriza e distingue as arquiteturas do tipo "register-memory" e "load-store"? De que tipo é a arquitetura MIPS?
    
    A arquitetura register-memory possibilita que as operações sejam executadas apartir da memória e/ou registos.
    A arquitetura load-store divide as instruções em 2 categorias, load e store entre a memória e registos.
    
    Em load-store, ambos os operandos tem de ser registos, o que difere da register-memory em que podemos ter um operando na memoria e outro num registo.
    
    O MIPS usa a arquitetura load-store.
 
### 21. O ciclo de execução de uma instrução é composto por uma sequência ordenada de operações. Quantas e quais são essas operações (passos de execução)? 
 
    1. Cálculo do endereço de memória que contém a instrução
    2. Leitura da instrução
    3. Decodificação da instrução
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
        O registo $0 tem um valor premanente defenido a 0x0 não podendo este ser alterado.
        
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
        
        Como o opcode é 0x0 estamos perante uma operação R que é do tipo aritmético, o registo de destiono é o $0
            uma vez que não é possivel alterar o registo $0 esta instrução não vai fazer nada.  
     

### 29. O símbolo ” >> “ da linguagem C significa deslocamento à direita e é traduzido por SRL ou SRA (no caso do
MIPS). Em que casos é que o compilador gera um SRL e quando é que gera um SRA?
        
        O compilador vai usar SRL ou SRA dependendo do tipo de operando, no caso dos operandos serem unsigned o copilador vai usar SRL,
            se os operandos forem signed usara o SRA

### 30. Qual a instrução nativa do MIPS em que é traduzida a instrução virtual move $4,$15 ?
    
    addu $4,$0,$15
