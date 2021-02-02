### 1. Quais são os 3 blocos fundamentais de um sistema computacional? 
    Um sistema computacional é constituido principalmente por 3 blocos:
     
    CPU:      Responsável por processar instruções armazenadas na memória
    Memória:  Armazena os dados de um programa e os seus resultados
    I/O:      Responsável pela comunicação com os periféricos
    
### 2. Quais são os 3 principais blocos funcionais que integram um CPU?
    ALU:        Unidade aritmética
    Registos:   Unidade responsavel por guardar valores de um programa
    Unidade     Controlo: Unidade responsável por controlar o fluxo do CPU

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

### 11. Se `$5=0x81354AB3`, qual o resultado, expresso em hexadecimal, das instruções:
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
