# Introdução

### 1. Num sistema computacional, como definiria com as suas próprias palavras o conceito de espaço de endereçamento?

    O espaço de endereçamento é quantidade de endereços que um CPU consegue endereçar.

### 2. Quando, num sistema computacional, estamos a determinar, em função do endereço presente no barramento, qual o periférico ou memória que deve ser selecionada, estamos perante uma operação que é normalmente designada por?

por fazer...

### 3. Quando nos referimos ao tipo de organização de memória num sistema, o que significa dizer que este é:

1. byte-addressable
```
Numa memória byte-addressable cada endereço corresponde a um byte de memória
``` 
2. bit-addressable
```
Numa memória bit-addressable cada endereço corresponde a um byte de memória.
``` 
3. word-addressable
```
Numa memória word-addressable cada endereço corresponde a uma word de tamanho x.
``` 

### 4. Identifique e descreva pelas suas palavras qual o papel, na arquitetura de um sistema computacional:

1. do Data Bus
```
O bus por onde passa a informação a ser enviada  out recebida pelo cpu e pelos seus periféricos.
```
2. do Address Bus
```
O bus que contem o endereço requisitado
```
3. do Control Bus
```
Responsável por indicar se a operação é uma escrita ou leitura.
```

### 5. Na arquitetura de um sistema computacional, como designa o barramento que permite identificar o registo, na memória ou num periférico, do qual ou para o qual vai ocorrer uma transferência de informação. 

```
O Address Bus tem a responsabilidade de identificar o registo na memória ou periférico.
```


### 6. Na arquitetura de um sistema computacional, como designa o barramento que permite especificar o tipo de operação efetuada sobre a memória ou sobre um periférico. 

```
O Control Bus tem a função de especificar o tipo de operação a ser afetuada no periférico ou na memória, esta pode ser de escrita ou de leitura.
```

# MICROCONTOLADORES (EMBEDED SYSTEMS) 

### 7. Um compilador-cruzado (cross-compiler) é o nome dado a um tipo específico de programa. Como descreveria, nas suas próprias palavras o que caracteriza este tipo de programa?

```
Um cross-compiler é o nome que se dá a um compilador que compila código para uma arquitetura diferente da que o compilador esta a correr.
```

### 8. Identifique qual a função de um bootloader num sistema baseado em microcontrolador?

```
O bootloader é o primeiro programa a ser executado, e é responsável por verificar se existe uma comunicação com o PC e disponibiliza funções básicas como a transferência e execução de um programa.
```

### 9. Quando falamos em microcontroladores, por oposição a um sistema computacional de uso geral, o que podemos afirmar:

a. quanto aos principais aspetos da sua arquitetura interna

```

```

b. quanto à sua frequência de trabalho

```
A frequencia de trabalho é inferior.
```

c. quanto à disponibilização de periféricos

```
```

d. quanto ao custo

```
Um microcontrolador tem um custo inferior a um sistema computacional de uso geral.
```

e. quanto à energia consumida

```
Um microcontrolador consume menos que um sisteme computacional.
```

f. quanto aos seus campos de aplicação

```
O microcontrolador executa uma função específica que lhe foi programada.
```

###  10. Como descreveria as principais caraterísticas de um sistema embebido?

```
É um sistema de baixo custo e executa de forma eficiente a função para a qual foi programado. 
```

### 11. Um microcontrolador PIC32 usa uma arquitetura pipelined semelhante à estudada nas aulas de AC1. Descreva qual o modelo base da arquitetura usada e o tipo ou tipos de memória usadas pelo sistema. 

```
O PIC32 tem um processador MIPS Harvard com um pipeline de 5 estágios, tem interface JTAG para efeitos de programação e Trace para debugging, e 32 registos de 32 bits.

Tem ainda,
512 KB usados para memória de instruções, com words de 128-bits
128Kb de SRAM usada para memória de dados volátil.
Diversos perifericos como o ADC,Uarts,SPI's Timers, RTC, USB OTG, CAN, Ethernet...

```

# MÓDULOS DE I/O

### 12. Na arquitetura de um microcontrolador PIC32 qual a finalidade e funcionalidade dos seguintes registos:

a. TRIS
``` 
O bits definem o comportamento dos pinos, ou seja, se devem ser tratados como input ou output
``` 
b. LAT
``` 
Usado para definir o estado dos pinos.
``` 
c. PORT
``` 
Contem o estado dos pinos.
``` 

### 13. Num porto de I/O do PIC32 (esquema abaixo), quando o porto se encontra configurado como porto de entrada, 

a. continua a ser possível escrever no registo de saída?
``` 
Sim, mesmo estando o TRIS ativo, ou seja, o tristate em alta impedancia, não impede que nós escrevamos no LAT
```
b. continua a ser possível ler o valor que se encontra armazenado no registo LAT?
``` 
Sim, pois o tristate TRIS não tem influencia no registo LAT
```
c. se sim, qual o sinal que permite realizar essa leitura?

``` 
Para fazer a leitura devemos ativar o RD_LAT, este vai ativar a tristate que vai conectar o registo LAT ao Data Line
```

### 14. Num porto de I/O do PIC32 (esquema abaixo), se eu não souber qual a configuração do mesmo (saída ou entrada), 

a. será possível saber essa informação programaticamente?

```
Sim, lendo o registo TRISx
```
b. se sim, qual o sinal de controlo que permite essa operação?
```
É possivel ativando o sinal RD_TRIS o que vai ligar o TRIS ao Data Line
``` 

### 15. Considere que está a decorrer uma operação sobre um porto de I/O de um PIC32 (ver esquema abaixo – considere o instante assinalado no diagrama temporal). 

a. o porto encontra-se configurado como entrada ou saída?
```
O  porto esta configurado como saída, pois o TRIS tem valor 0 (zero).
``` 
b. identifique e descreva qual a operação que está em curso. 
```
É uma operação de escrita, e coloca o porto a 0 (zero).
``` 

### 16. Repita o exercício anterior para o esquema apresentado abaixo


a. o porto encontra-se configurado como entrada ou saída?
```
O  porto esta configurado como entrada, pois o TRIS tem valor 1 (um).
``` 
b. identifique e descreva qual a operação que está em curso. 
```
É uma operação de leitura, o valor enviado para o porto foi o valor 1 (um).
``` 

### 17. Na implementação da parte de dados de um porto de saída, que tipo de dispositivo lógico deve ser usado para armazenar o valor transferido através do barramento de dados durante um ciclo de escrita:

```
Um Flip Flop do tipo D
``` 

### 18. Na implementação de um porto de I/O do PIC32, o registo PORT está associado a um conjunto de dois flip-flops D em série (shift register de dois andares). Qual o objetivo dessa implementação? 

```
O input externo não esta sincronizado com o clock interno (na prespectiva do cpu é assíncrono).
Assim para evitar problemas de meta-estabilidade, são usados um conjunto de flip-flops que sincroniza o input com o clock interno.
```

### 19. Pretende usar-se o porto RB do microcontrolador PIC32MX795F512H para realizar a seguinte função (em ciclo infinito): 

O byte menos significativo ligado a este porto é lido com uma periodicidade de 100ms. Com um atraso de 10ms, o valor lido no byte menos significativo é colocado, em complemento para 1, no byte mais significativo desse mesmo porto. Escreva, em assembly do MIPS, um programa que execute esta tarefa.

a. configure o porto RB para executar corretamente a tarefa descrita
```assembly

    .equ SFR_BASE_HI, 0xBF88        # 16 MSbits of SFR area
    .equ TRISB, 0x6040
 
 main:   lui     $t0, SFR_BASE_HI        #
         lw      $t1, TRISB($t0)         # READ  (Mem_addr = 0xBF880000 + 0x6040)
         ori     $t1, $t1, 0x8001        # MODIFY (RB[15] = 0 & RB[0] = 1 (1 means INPUT 0 means OUTPUT))
         sw      $t1, TRISB($t0)         # WRITE (Write TRISB register
```
b. efetue a leitura do porto indicado
```assembly

    .equ SFR_BASE_HI, 0xBF88        # 16 MSbits of SFR area
    .equ PORTB, 0x6050

main:   lui     $t0, SFR_BASE_HI        #
loop:
        lw      $t1, PORTB($t0)         # READ, t1 = RB
```
c. execute um ciclo de espera de 10ms
```assembly

li      $a0, 10
jal     delay

delay:  ble     $a0,0, endFor               # for(; ms > 0; ms--) {
        li      $v0, resetCoreTimer         #
        syscall                             #   resetCoreTimer();
while2: li      $v0, readCoreTimer          #   while(readCoreTimer()
        syscall                             #
        blt     $v0, 20000, while2          #           < 20000);
        addi    $a0,$a0,-1
        j       delay                       # }
endFor: jr      $ra

```
d. efetue a transformação da informação lida para preparar o processo de escrita naquele porto
```assembly
        # t1 = RB       
        andi    $t1, $t1, 1             # t1 = RB & 1 = RB0
```
e. efetue, no byte mais significativo, o valor resultante da operação anterior
```assembly
# t1 = RB0

    sll     $t1,$t1,15
    
    lw      $t2,LATB($t0)           # READ (Mem_addr = 0xBF880000 + 0x6060)
    or      $t2,$t2,$t1             # R15 = RB0
    sw      $t2,LATB($t0)           # WRITE (Mem_addr = 0xBF880000 + 0x6060)
    
```
f. execute um ciclo de espera de 90ms
```assembly
li      $a0, 90
jal     delay
```
g. regresse ao ponto b 
```assembly
j loop
```


# NOÇÕES BÁSICAS SOBRE PERIFÉRICOS


### 20. A descrição da funcionalidade de um dado dispositivo periférico, o seu conjunto de registos de dados, de controlo e de status é genericamente designada, no contexto de arquitetura de computadores, por uma designação específica. Qual essa designação? 

```
É designada por I/O Module
```


### 21. Quando, no acesso que o CPU faz a um módulo de E/S, é usada a técnica de entrada/saída de dados por software (programada), quais as tarefas que são realizadas pelo CPU?

```
POLLING: 
O CPU toma a iniciativa, aguarda se necessário, inicia e controla a transferência de informação.

Interrupts:
O periféico sinaliza ao CPU que está pronto para trocar informação (leitura ou escrita)
O CPU inicia e controla a trasnferência.
```

### 22. O método de transferência de informação entre um CPU e um módulo de E/S (I/O), em que o programa executado no CPU é responsável por iniciar, monitorizar e controlar a transferência de informação, designa-se por: (4)

```
Esta técnica de acesso é designada por Polling.
```

### 23. Quando nos referimos a um “Módulo de I/O”, estamos a referir-nos especificamente a que parte do periférico de que este módulo faz parte?

```
A parte que interage entre o CPU e o periférico.
```

### 24. Na implementação da parte de dados de um porto de entrada de um módulo de I/O:

a. que tipo de dispositivos lógicos devem ser usados na ligação ao barramento de dados?

```
```

b. por que razão é fundamental usar esses dispositivos?

```
```

