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
Sim, mesmo estando o TRIS activo, ou seja, o tristate em alta impedancia, não impede que nós escrevamos no LAT
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

### 22. O método de transferência de informação entre um CPU e um módulo de E/S (I/O), em que o programa executado no CPU é responsável por iniciar, monitorizar e controlar a transferência de informação, designa-se por:

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


### 25. Os diagramas temporais que se seguem, nas várias figuras, representam operação de transferência de informação (leitura ou escrita) de/para dispositivos que podem estar mapeados em espaços de endereçamento de I/O ou de memória. Identifique, para cada diagrama qual o tido de operação e espaço de endereçamento utilizado: 

1.
```
```
2.
```
```
3.
```
```
4.
```
```
5.
```
```
6.
```
```

### 26. Nos diagramas temporais, incompletos, das duas figuras abaixo, complete a representação gráfica dos mesmos para:

a. uma operação de escrita num dispositivo mapeado no espaço de endereçamento de memória
```
```
b. uma operação de leitura a partir de um dispositivo mapeado no espaço de endereçamento de I/O
```
```


# INTERRUPÇÕES


### 27. No que respeita ao sistema de interrupções do PIC32 é (usado na placa DETPIC32):

a. descreva sucintamente os dois modos de funcionamento do sistema de interrupções

```
POR HARDWARE:

O CPU tem um número de linhas de interrupção, e consegue detetar automaticamente, via hardware, o periférico que originou a interrupção.
Cada uma destas linhas tem uma prioridade fixa, no caso de haver 2 ou mais linhas de interrupção ativas simultaneamente, o CPU atende
em 1º lugar a de mais alta prioridade.

No caso de interrupções vetorizadas:

O CPU tem 1 entrada de interrupção, cada periférico possui um identificador único, designado por vetor.
Durente o processo de atendimento, na fase de identificação da fonte, o periférico gerados da interrupção identifica-se
através do seu vetor.
O vetor sera então utilizado pelo CPU que vai procurar numa tabela que contém o endereço de cada uma das RSI,
ou intruções de salto incondicional para as RSI.

POR SOFTWARE:

Apenas uma entrada de Interrupt request, todas os perifericos tem os seus interrupt requests ligados a uma porta OR que liga à unica
Ireq do CPU.

Via software, é evocada uma rotina de atendimento a interrupção que lê o registo Status de cada um dos periféricos até encontrar um que tenha 
gerado um pedido de interrupção.

A ordem em que os periféricos estão ligados determina a prioridade.

No fim, é feito o reset ao Interrupt Request do dado periférico, se o mesmo se mantiver activo, é porque existe outro periférico com o Interrupt activo, neste
caso o programa repete-se para dar resposta a esse periférico.

```
b. do caso do sistema de interrupções feita por hardware, como descreveria sucintamente o seu funcionamento

```
1. Obter o endereço da RSI (Rotina de Serviço a Interrupção).
2. Salvaguiardar o contexto atual do CPU (valor corrente do PC e flags de estado associadas ao sistema).
3. Desativação das interrupções.
4. Carregamento do PC do endereço da RSI (PC <- Endereço da RSI (salto para a 1º instrução da RSI) )
5. Execução da RSI até encontrar a instrução de retorno.
6. Execução da instrução de retorno da RSI ('eret' no mips)
    - Reposição do contexto salvaguardado (PC e flags)
    - reativação das interrupções, e regreço ao programa interrompido, com a execução da instrução que teria sido executada se não tivesse acontecido a interrupção.
```
c. ainda no caso da alínea anterior, o que determina a ordem pela qual as interrupções são servidas nos casos em que ocorram em simultânea a partir de mais do que uma fonte

```
O que determina é a prioridade de cada interrupção.
```

### 28. Numa RSI, qual o objetivo do conjunto de instruções designado por:
a. "prólogo"?
```
Responsável por salvaguardar o contexto do programa
```
b. "epílogo"?
```
Responsável por repor o contexto do programa.
```

### 29. Descreva, por palavras suas, o que se entende por overhead da transferência de informação por interrupção e as razões que justificam esse overhead.
```
Quando ocorre uma interrupção occorem vários overheads devido à:
- Necessidade de salvaguardar o contexto do programa interrompido
- Antes de abandonar a RSI tem de se repor o contexto

Estas 2 operações requerem, no MIPS do PIC32 cerca de 50 instruções.

A RSI poderá tambem utilizar zonas de memória diferentes das do programa interrompido, o que obriga à atualização das memórias cache com o consequente impacto no número de ciclo de relógico gastos.
No fim da RSI, este cache tambem tem de ser reposto, o que requer mais instruções.
```

### 30. Considere um sistema baseado num CPU a funcionar a uma frequência de 10 MHz com uma taxa de execução de 5 MIPS (5x10^6 instruções por segundo, CPI = 2) que processa por interrupção eventos externos periódicos. Se o overhead total do atendimento a à interrupção for de 20 ciclos de relógio, e a rotina de serviço à interrupção tiver 40 instruções, determine a máxima frequência a que esses eventos podem ocorrer para que todas as interrupções possam ser atendidas.

```
Instruções: 5 M
Freq = 10 MHz
CPI = 2
Overhead =  20 ciclos
Rotina = 40 instruções

Cada instrução demora em média 2 ciclos, logo o overhead é de 10 instruções, assim na interrupção vamos correr 50 instruções

São executadas 5 M instruções por segundo, logo 5x10^6 / 50 = 100k

Em 1 segundo podemos ter no máximo 100k interrupções o que equivale a 100 kHz

```

### 31. Considere um sistema baseado num CPU a funcionar a uma frequência de 40 MHz com uma taxa de execução de 16 MIPS (16x10^6 instruções por segundo, CPI = 2.5). Pretende-se processar por interrupção eventos externos periódicos que ocorrem a uma frequência de 200 kHz. Para cumprir este requisito e sabendo que o overhead total do atendimento a uma interrupção é 75 ciclos de relógio, calcule o número máximo de instruções máquina que a rotina de serviço à interrupção pode ter.

```
Freq = 40 MHz
Instruções: 16 M
CPI = 2.5
Overhead =  75 ciclos
Freq Target = 200 kHz
Rotina = ?

O overhead é composto por 75/2.5 = 30 instruções.

A frequencia target é 200kHz o que equivale a executar 200 k interrupções por segundo.

200k interrupções por segundo resulta em 6,000,000 instruções de overhead


O CPU executa 16 M instruções, logo 16 * 10^6 - 6,000,000 = 10 * 10^6 instruções

Ficamos com espaço para 10,000,000 instruções, logo 10,000,000 / 200,000 = 50

50 é o número de instruções que cada interrupção pode fazer para uma frequencia target de 200 kHz (16M / (50+30) = 200k)

```
### 32. Recalcule a solução para o problema anterior admitindo agora que o CPU a funciona a uma frequência de 100 MHz com uma taxa de execução de 33.3 MIPS (33.3x10^6 instruções por segundo, CPI = 3.0) e que se pretende processar por interrupção eventos externos periódicos que ocorrem a uma frequência de 500 kHz. Admita ainda que o overhead total do atendimento à interrupção é 80 ciclos de relógio.

```
Freq = 100 MHz
Instruções: 33.3 M
CPI = 3
Overhead =  80 ciclos
Freq Target = 500 kHz
Rotina = ?

O overhead é composto por 80/3 = 26.666 instruções.

A frequencia target é 500kHz o que equivale a executar 500 k interrupções por segundo.

500k interrupções por segundo resulta em 13,333,333 instruções de overhead


O CPU executa 33.3 M instruções, logo 33.3 * 10^6 - 13,333,333 = 19,966,667 instruções

Ficamos com espaço para 19,966,667 instruções, logo 19,966,667 / 500,000 = 39.9 ~ 40

40 é o número de instruções que cada interrupção pode fazer para uma frequencia target de 500 kHz (33.3M / (40+26.666) = 499.5 kHz)

```
### 33. Considere um sistema baseado num CPU a funcionar a uma frequência de 10 MHz com uma taxa de execução de 5 MIPS (5x10^6 instruções por segundo, CPI = 2) que processa por interrupção eventos externos periódicos. A rotina de serviço à interrupção tem 70 instruções e verificou-se experimentalmente que a máxima frequência a que os eventos externos podem ocorrer é 50 kHz. Nestas condições determine, em ciclos de relógio, qual o valor máximo que pode que pode ser usado pelo overhead total do atendimento.

```
Freq = 10 MHz
Instruções: 5 M
CPI = 2
Overhead = ? ciclos
Freq Target = 50 kHz
Rotina = 70 instruções

Podem occorrer 50k interrupções, cada interrupção, sem overhead tem 70 instruções logo 50k * 70 = 3,500,000 instruções

5,000,000 - 3,500,000 = 1,500,000 instruções

1,500,000 é o numero de instruções que "sobram" 1,500,000 / 50k = 30.

Cada interrupção pode tem um overhead de 30 instruções o que corresponde a 60 ciclos de relógio.

```

### 34. Considere agora um sistema baseado num CPU a funcionar a uma frequência de 80 MHz com uma taxa de execução de 40 MIPS (40x10^6 instruções por segundo, i.e. CPI = 2) que processa, por interrupção, eventos externos periódicos. Se o overhead total do atendimento à interrupção for de 40 ciclos de relógio, e a rotina de serviço à interrupção tiver 20 instruções, determine a máxima frequência a que esses eventos podem ocorrer para que todas as interrupções possam ser atendidas.

```
Freq = 80 MHz
Instruções: 40 M
CPI = 2
Overhead = 40 ciclos
Freq Target = ?
Rotina = 20 instruções

Cada instrução demora em média 2 ciclos, logo o overhead é de 20 instruções, assim na interrupção vamos correr 40+20 = 60 instruções

São executadas 40 M instruções por segundo, logo 40x10^6 / 60 = 666,666

Em 1 segundo podemos ter no máximo 666,666 interrupções o que equivale a 666.6 kHz

```

### 35. Descreva sucintamente, para o caso de um sistema de interrupções vetorizadas com prioridade estabelecida por “daisy chain”:

a. como é estabelecida a prioridade de resposta a interrupções simultâneas
```
Os periféricos ficam ligados em cadeia, cada um tem um Interrupt Acknowledge IN e um Interrupt Acknowledge OUT, o OUT está ligado ao IN do próximo periférico,
este apenas fica ativo de o periférioco em questão não tiver gerado nenhum Interrupt.

O primeiro a receber um Interrupt Acknowledge que tenha feito requerido a interrupção vai responder com o seu vetor, 
sendo esta a interrupção que vai ser executada. (ou seja, a de maior prioridade)

```
b. como se designa o sinal por hardware que permite estabelecer e assegurar o funcionamento do sistema em “daisy chain”
```
Interrupt Acknowledge
```


###  36. Descreva, sucintamente, as fases temporais de atendimento a uma interrupção num sistema de interrupções vetorizadas.
```
Tempo de latência de resposta à interrupção.
Tempo para executar as instruções de leitura de uma word do módulo I/O do periférico, da escrita dessa word no endereçamento da memória
e da atualização dos endereçoes origem e destino
Para cada intenção, o tempo necessário para verificar se todos os dados foram já transferidos, o que evolve a leitura de um ou mais registos do módulo de
I/O do periférico e a verificação de status necessários.
```

### 37. Como designaria a organização de um sistema de atendimento a interrupções em que a identificação, pelo CPU, do periférico gerador da interrupção é feita por hardware, num ciclo de interrupt acknowledge durante o qual o periférico gerador da interrupção coloca o seu vetor no barramento de dados.
```
Os periféricos ficam ligados em cadeia, cada um tem um Interrupt Acknowledge IN e um Interrupt Acknowledge OUT, o OUT está ligado ao IN do próximo periférico,
este apenas fica ativo de o periférioco em questão não tiver gerado nenhum Interrupt.

Caso o periférico fique com o Interrupt Acknowledge IN ativo, e se ao mesmo tempo tiver requisitado um Interrupt, 
este vai enviar o seu vetor para o barramento de dados.
```

###  38. Descreva, sucintamente, o funcionamento de um sistema de interrupções baseado em "identificação da fonte por software" 

```
O CPU vai ler o registo status de cada um dos periférios para determinar qual dos periféricos requisitou a interrupção.
```


# DMA

### 39. Descreva a sequência de operações para que possa ocorrer uma transferência por DMA, em modo bloco, quando o controlador de DMA pretende dar início a uma transferência
```
1 passo: CPU pede informação ao periférico.
2 passo: CPU programa o DMA para efetuar a transferência.
3 passo: O DMA vai pedir o endereço que quer ler ao periférico e é lida para o DMA.
4 passo: o valor armazenado no DMA é transferido para a memória.
5 passo: No final, o DMA ira ativar o sinal de interrupção para indicar que o processo foi concluido, e que
a informação foi escrita na memória
```
### 40. Qual a operação que, tipicamente, um controlador de DMA executa quando conclui um processo de transferência de informação enquanto bus master.
```
Invoca uma interrupção para informar o CPU que o processo foi concluído.
```
### 41. Descreva, sucintamente, qual a finalidade do sinal busgrant num sistema que suporte transferência de dados por DMA, quem gera esse sinal e em que circunstâncias
```
O DMA pede ao CPU para ser bus master ativando o BusReq, e tera de esperar pelo sinal do CPU (BusGrant), caso o CPU não esteja a utilizar o bus master, é dada autorização ao DMA para ser o bus master, quando o DMA acaba a operação o DMA retira o pedido ao CPU e liberta os 3 barramentos.
```
### 42. Descreva, sucintamente, qual a sequência de eventos que ocorrem muma transferência por DMA, em modo cyclestealing, quando o controlador de DMA pretende dar início a uma transferência elementar.
```
No modo cyclestealing o DMA assume o controlo dos barramentos durante 1 ciclo de relógio, e liberta o logo de seguida.
Neste modo o DMA transfere parcialmente 1 palavra (fetch ou deposit).

O CPU só liberta os barramentos nos ciclos em que não acede à memória (por exemplo no estágio MEM de uma instrução aritmética na arquitetura MIPS, pipelined)

Este tipo de transferencia é mais lento, mas não causa impacto no CPU pois aproveita ciclos que não são, de qualquer modo, usados pelo CPU.
```
### 43. Descreva, sucintamente, qual a diferença entres os modos de operação “bloco” e “burst” de um controlador de DMA.
```
Bloco - O DMA assume o controlo dos barramentos até todos os dados terem sido transferidos

Burst - O DMA transfere até atingir o número de palavras pré-programado ou até o periférico não ter mais informação pronta para ser transferida. 

Se não foi transferida a totalidade da informação:
- O periférico pode desativar o sinal Dreq o que leva o DMA a desativar o sinal BusReq e a libertar os barramentos.
- Logo que o periférico ative de novo o sinal Dreq o DMA volta a ativar o sinal BusReq e, logo que seja bus master, continua no ponto onde interrompeu.
```
### 44. Considere um controlador de DMA não dedicado, a funcionar em modo bloco, em que um bus cycle é realizado em 1 ciclo de relógio. Calcule o tempo necessário para efetuar a transferência de um bloco de dados para as seguintes condições:

a. controlador de 32 bits, frequência de funcionamento do DMA de 500MHz, bloco de 512 words de 32 bits
```
F = 1 / 500 * 10^6 = 2ns

512 * 2 = 1,024 ns

```
b. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 512 words de 32 bits
```
O DMA vai ter de ler 2 vezes o mesmo endereço para ler os 32bits de cada word (16bits de cada vez)

Uma vez que para transferir uma word são necessarios 2 ciclos de clock, cada word é totalmente transferida a uma frequencia de: 1 GHz / 2 = 500 MHz

O que faz com que a resposta seja igual ao exercicio anterior, ou seja 1,024ns
```
c. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 512 words de 16 bits
```
F = 1 / 1 * 10^9 = 1ns

512 * 1 = 512 ns
```

d. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 2K words de 16 bits
```
F = 1 / 500 * 10^6 = 2ns

2,000 * 2 = 4,000 ns
```

### 45. Volte a resolver o problema anterior considerando agora que um bus cycle é realizado em 2 ciclos de relógio e para as seguintes condições:

a. controlador de 32 bits, frequência de funcionamento do DMA de 1GHz, bloco de 1K words de 32 bits
```
A cada 2 cyclos é transferida 1 word, uma vez que o bus cycle é 2 ciclos.

1 GHz / 2 = 500 Mhz

F = 1 / 500 * 10^6 = 2ns

500 * 2 = 1,000 ns
```
b. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 2K words de 32 bits
```
O DMA vai ter de ler 2 vezes o mesmo endereço para ler os 32bits de cada word (16bits de cada vez) e cada word de 16bits necessita de 2 ciclos de relogio.

Logo cada word de 32bits necessita 4 ciclos de relógio

500 MHz / 4 = 125 MHz

F = 1 / 125 * 10^6 = 8ns

2000 * 8 = 16,000ns
```
c. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 256 words de 32 bits
```
O DMA vai ter de ler 2 vezes o mesmo endereço para ler os 32bits de cada word (16bits de cada vez) e cada word de 16bits necessita de 2 ciclos de relógio.

Logo cada word de 32bits necessita 4 ciclos de relógio

1 GHz / 4 = 250 MHz

F = 1 / 250 * 10^6 = 4ns

256 * 4 = 1,024ns

```
d. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 2Kwords de 16 bits 
```
500 Mhz / 2 = 250 MHz

F = 1 / 250 * 10^6 = 4ns

2,000 * 4 = 8,000ns
```

### 46. Resolva as duas primeiras alíneas do problema anterior considerando agora que o controlador é dedicado.

c. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 256 words de 32 bits

```
O DMA vai ter de ler 2 vezes o mesmo endereço para ler os 32bits de cada word (16bits de cada vez) e cada word de 16bits necessita de 1 ciclos de relógio.

Logo cada word de 32bits necessita 3 ciclos de relógio

1 GHz / 3 = 333.3 MHz

F = 1 / 333.3 * 10^6 = ~3ns

256 * 3 = 768ns

```
d. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 2Kwords de 16 bits 
```
F = 1 / 500 * 10^6 = 2ns

2,000 * 2 = 4,000ns
```

### 47. Considere agora um controlador de DMA não dedicado, a funcionar em modo cycle-stealing, em que um bus cycle é realizado em 2 ciclos de relógio e o tempo mínimo entre operações elementares é 1 ciclo de relógio. Calcule o tempo mínimo necessário para efetuar a transferência de um bloco de dados para as seguintes condições:

a. controlador de 32 bits, frequência de funcionamento do DMA de 250 MHz, bloco de 512 words de 32 bits
```
```
b. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 512 words de 32 bits
```
```
c. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 2Kwords de 16 bits
```
```
### 48. Determine o número de bus cycles necessários para efetuar uma transferência por um controlador de DMA dedicado a funcionar em modo bloco, dadas as seguintes condições:

a. controlador de 32 bits, frequência de funcionamento do DMA de 500 MHz, bloco de 512 words de 32 bits
```
```
b. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 4K words de 32 bits
```
```
c. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 512 words de 32 bits
```
```
d. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 1Kwords de 16 bits

```
```

### 49. Determine a taxa de transferência de pico (expressa em Bytes/s) de um DMA não dedicado de 32 bits (i.e. com barramento de dados de 32 bits), a funcionar a 100 MHz em modo "cycle-stealing". Suponha ainda que são necessários 2 ciclos de relógio (equivalente a 2 *TBC) para efetuar uma operação de leitura ou escrita. desse DMA. O tempo mínimo entre operações elementares deverá ser de 1TBC

```
```

### 50. Resolva o problema anterior, mas considerando agora as seguintes condições:

a. controlador de 32 bits, frequência do DMA de 120 MHz, 1TBC = 2 ciclos de relógio, tempo mínimo entre operações elementares de 2 TBC
```
```
b. controlador de 32 bits, frequência do DMA de 80 MHz, 1TBC = 2 ciclos de relógio, tempo mínimo entre operações elementares de 3 TBC
```
```
c. controlador de 16 bits, frequência do DMA de 120 MHz, 1TBC = 2 ciclos de relógio, tempo mínimo entre operações elementares de 2 TBC
```
```
d. controlador de 16 bits, frequência do DMA de 200 MHz, 1TBC = 1 ciclos de relógio, tempo mínimo entre operações elementares de 1 TBC
```
```


### 51. Suponha um DMA não dedicado de 32 bits (i.e. com barramento de dados de 32 bits), a funcionar a 100 MHz. Suponha ainda que são necessários 2 ciclos de relógio para efetuar uma operação de leitura ou escrita (i.e. 1 "bus cycle" é constituído por 2 ciclos de relógio).

a. determine a taxa de transferência desse DMA (expressa em Bytes/s), supondo um funcionamento em modo bloco.

b. determine a taxa de transferência de pico desse DMA (expressa em Bytes/s), supondo um funcionamento em modo "cycle-stealing" e um tempo mínimo entre operações elementares de 1 ciclo de relógio ("fetch", 1T mínimo, "deposit", 1T mínimo).

c. Repita as alíneas anteriores supondo um DMA dedicado com as características referidas anteriormente.

# TIMERS
