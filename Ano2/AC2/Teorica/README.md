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

Cada instrução demora em média 2 ciclos, logo o overhead é de 20 instruções, assim na interrupção vamos correr 20+20 = 40 instruções

São executadas 40 M instruções por segundo, logo 40x10^6 / 40 = 1 MHz

Em 1 segundo podemos ter no máximo 1,000,000 interrupções o que equivale a 1 MHz

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
Cada bus-cycle demora 1 ciclo de clock, e são necessarios 2 bus-cycles para fazer fetch e deposit

500 / 2 = 250MHz é frequencia do deposit

F = 1 / 250 * 10^6 = 4ns

512 * 4 = 2,048 ns

```
b. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 512 words de 32 bits
```
O DMA vai ter de ler 2 vezes o mesmo endereço para ler os 32bits de cada word (16bits de cada vez)

Uma vez que para transferir uma word são necessarios 2 ciclos de clock, cada word é totalmente transferida a uma frequencia de: 1 GHz / 2 = 500 MHz

O que faz com que a resposta seja igual ao exercicio anterior, ou seja 2,048 ns
```
c. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 512 words de 16 bits
```

1 GHz / 2 = 500 MHz é frequencia do deposit

F = 1 / 500 * 10^6 = 2ns

512 * 2 = 1,024 ns
```

d. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 2K words de 16 bits
```

500 / 2 = 250MHz é frequencia do deposit

F = 1 / 250 * 10^6 = 4ns

2,000 * 4 = 8,000 ns
```

### 45. Volte a resolver o problema anterior considerando agora que um bus cycle é realizado em 2 ciclos de relógio e para as seguintes condições:

a. controlador de 32 bits, frequência de funcionamento do DMA de 1GHz, bloco de 1K words de 32 bits
```
A cada 4 ciclos é transferida 1 word, uma vez que o bus cycle é 2 ciclos (fetch - deposit).

1 GHz / 4 = 250 Mhz

F = 1 / 250 * 10^6 = 4ns

1000 * 4 = 4,000 ns
```
b. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 2K words de 32 bits
```
O DMA vai ter de ler 2 vezes o mesmo endereço para ler os 32bits de cada word (16bits de cada vez) e cada word de 16bits necessita de 4 ciclos de relogio.

Logo cada word de 32bits necessita 8 ciclos de relógio

500 MHz / 8 = 62.5 MHz

F = 1 / 62.5 * 10^6 = 16ns

2000 * 16 = 32,000ns
```
c. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 256 words de 32 bits
```
O DMA vai ter de ler 2 vezes o mesmo endereço para ler os 32bits de cada word (16bits de cada vez) e cada word de 16bits necessita de 4 ciclos de relógio.

Logo cada word de 32bits necessita 8 ciclos de relógio

1 GHz / 8 = 125 MHz

F = 1 / 125 * 10^6 = 8ns

256 * 8 = 2,048ns

```
d. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 2Kwords de 16 bits 
```
500 Mhz / 4 = 125 MHz

F = 1 / 125 * 10^6 = 8ns

2,000 * 8 = 16,000ns
```

### 46. Resolva as duas primeiras alíneas do problema anterior considerando agora que o controlador é dedicado.

a. controlador de 32 bits, frequência de funcionamento do DMA de 1GHz, bloco de 1K words de 32 bits
```
A cada 1 cyclo é transferida 1 word, uma vez que por ser dedicado o bus cycle é de 1 ciclo.

F = 1 / 1 * 10^9 = 1ns

500 * 1 = 500 ns
```
b. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 2K words de 32 bits
```
O DMA vai ter de ler 2 vezes o mesmo endereço para ler os 32bits de cada word (16bits de cada vez) e cada word de 16bits necessita de 1 ciclo de relogio.

Logo cada word de 32bits necessita 3 ciclos de relógio

500 MHz / 3 = 166.6 MHz

F = 1 / 166.6 * 10^6 = 6ns

2000 * 6 = 12,000ns
```

### 47. Considere agora um controlador de DMA não dedicado, a funcionar em modo cycle-stealing, em que um bus cycle é realizado em 2 ciclos de relógio e o tempo mínimo entre operações elementares é 1 ciclo de relógio. Calcule o tempo mínimo necessário para efetuar a transferência de um bloco de dados para as seguintes condições:

a. controlador de 32 bits, frequência de funcionamento do DMA de 250 MHz, bloco de 512 words de 32 bits
```
O tempo entre poperações é de 1 ciclo, o que significa que o DMA corre intermitentemente, ou seja, 250 MHz / 2 = 125MHz é a frequencia a que o DMA corre.

Cada word necessita de 2 ciclos relógio: 125 / 2 = 62.5 MHz é a frequencia de escrita de uma word pelo DMA.

F = 1 / 62.55 * 10^6 ~ 16ns

512 * 16 = 8,192ns
```
b. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 512 words de 32 bits
```
O DMA vai ter de ler 2 vezes o mesmo endereço para ler os 32bits de cada word (16bits de cada vez) e cada word de 16bits necessita de 2 ciclos de relogio.

O DMA fica é ativado a frequencia de: 1 GHz / 2 = 500 MHz

Cada word de 16 bit necessita de 2 ciclos clock: 500 MHz / 2 = 250 Mhz é a frequencia a que o DMA completa uma operação de 16 bits

Para transferir os 16bits são necessarios 2 execuções do DMA: 250 MHz / 2 = 125 MHz é a frequencia a que o DMA completa uma operação de 32 bits

F = 1 / 125 * 10^6 = 8ns

512 * 8 = 4,096ns


```
c. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 2Kwords de 16 bits
```
O tempo entre poperações é de 1 ciclo, o que significa que o DMA corre intermitentemente, ou seja, 500 MHz / 2 = 250 MHz é a frequencia a que o DMA corre.

Cada word necessita de 2 ciclos relógio: 250 / 2 = 125 MHz é a frequencia de escrita de uma word pelo DMA.

F = 1 / 125 * 10^6 = 8ns

2000 * 8 = 16,000ns
```

### 48. Determine o número de bus cycles necessários para efetuar uma transferência por um controlador de DMA dedicado a funcionar em modo bloco, dadas as seguintes condições:

a. controlador de 32 bits, frequência de funcionamento do DMA de 500 MHz, bloco de 512 words de 32 bits
```
Um DMA didicado de 32bits necessita de 1 ciclo para transferir 32bits
```
b. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 4K words de 32 bits
```
Um DMA didicado de 16bits necessita de 2 ciclos para transferir 32bits
```
c. controlador de 16 bits, frequência de funcionamento do DMA de 1GHz, bloco de 512 words de 32 bits
```
Um DMA didicado de 16bits necessita de 2 ciclos para transferir 32bits
```
d. controlador de 16 bits, frequência de funcionamento do DMA de 500MHz, bloco de 1Kwords de 16 bits

```
Um DMA didicado de 16bits necessita de 1 ciclo para transferir 16bits
```

### 49. Determine a taxa de transferência de pico (expressa em Bytes/s) de um DMA não dedicado de 32 bits (i.e. com barramento de dados de 32 bits), a funcionar a 100 MHz em modo "cycle-stealing". Suponha ainda que são necessários 2 ciclos de relógio (equivalente a 2 *TBC) para efetuar uma operação de leitura ou escrita. desse DMA. O tempo mínimo entre operações elementares deverá ser de 1TBC

```
O DMA executa 1 vez por cada 2 ciclos de clock, logo 100 MHz / 2 = 50 Mhz é a frequencia a que o DMA fica ativo.

O DMA necessita de 2 ciclos de relógio para fazer uma transferencia, 50 / 2 = 25 MHz é a frequencia de transferencia por word

32 bits * 25 MHz / 8 =  100,000,000 bytes/s ~ 97,6 MB/s

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
```
```

b. determine a taxa de transferência de pico desse DMA (expressa em Bytes/s), supondo um funcionamento em modo "cycle-stealing" e um tempo mínimo entre operações elementares de 1 ciclo de relógio ("fetch", 1T mínimo, "deposit", 1T mínimo).
```
```

c. Repita as alíneas anteriores supondo um DMA dedicado com as características referidas anteriormente.
```
```

# TIMERS

### 52. Considere um timer em que a relação entre as frequências de entrada e de saída é uma constante k configurável. Se colocar dois desses timers em cascata (i.e., ligados em série) com constantes de divisão k1 e k2, determine a expressão algébrica que estabelece a relação entre a frequência à entrada do primeiro (fin) e a frequência à saída do segundo (fout). 

```
fout = fin / k1*k2
```

### 53. Descreva, por palavras suas o que se entende por Duty Cycle de um sinal digital periódico. Dê alguns exemplos em que a manipulação dinâmica deste valor pode ser usado em aplicações práticas.

```
O Duty Cycle é a razão entre o tempo que o sinal do timer esta ativo e o período, podemos fazer uso do Duty Cycle para, por exemplo, controlar a 
luminosidade de um led, ou controlar a velocidade de um motor.

Este processo é tipicamente designado por PWM.
``` 

### 54. Considere um timer em que a relação entre as frequências de entrada e de saída é dada por(k+1) em que k é uma constante configurável. Determine o período do sinal de saída para os valores seguintes:

a. frequência de entrada do timer for 20MHz e k = 1999
```
Constante = k + 1 = 2000

fout = 20 MHz / 2000 = 10 kHz

```
b. frequência de entrada do timer for 40MHz e k = 1249
```
Constante = k + 1 = 1250

fout = 40 MHz / 1250 = 32 kHz
```
c. frequência de entrada do timer for 80MHz e k = 32767
```
Constante = k + 1 = 32768

fout = 80 MHz / 32768 = 2.441 kHz
```
d. frequência de entrada do timer for 2MHz e k = 1023
```
Constante = k + 1 = 1024

fout = 2 MHz / 1024 = 1.953 kHz
```

### 55. Alguns dos timers que estudou e utilizou têm, como último andar do temporizador, um divisor por dois. Descreva, sucintamente, qual a razão e finalidade desse divisor por dois.

```

``` 

### 56. Considere um timer e uma unidade OC como o da figura abaixo (semelhante aos dos PIC32). Admita que a frequência do relógio TCLK é de 20MHz, que o fator de divisão do prescaler é 4, que o valor armazenado em PR é 2499 e que o valor em OCK é 834. Determine o período do sinal de saída e o respetivo duty cycle. 

```
Prescaler: 4
PR: 2499
TCLK: 20 MHz
OCK: 834

Fpresc = 20 MHz / 4 = 5 MHz

Fout = 20 Mhz / Prescaler * 2500 <=> 20 MHz / 4 * 2500 = 2 kHz

OCK = (PR + 1) * DutyCycle / 100

834 = 2500 * DutyCycle / 100

83400 = 2500 * DutyCycle

DutyCycle = 83400 / 2500 = 33.36%

``` 

### 57. Pretende-se gerar um sinal com uma frequência de 85 Hz. Usando o Timer T2 e supondo PBCLK = 50 MHz:

a. calcule o valor mínimo da constante de divisão a aplicar ao prescaler e indique qual o valor efetivo dessa constante
```
Kmin = 50 MHz / 65536 * 85 Hz = 8.9

O K minimo é 16
``` 
b. calcule o valor da constante PR2
```
(5 MHz / 85 Hz) - 1 = 3124
``` 

### 58. Repita o exercício anterior, supondo que se está a usar o Timer T1

a. calcule o valor mínimo da constante de divisão a aplicar ao prescaler e indique qual o valor efetivo dessa constante
```
Kmin = 20 MHz / 65536 * 85 Hz = 2.7

O K minimo é 8
``` 
b. calcule o valor da constante PR2
```
(2.5 MHz / 85 Hz) - 1 = 29410.7 ~ 29411
``` 

### 59. Pretende-se gerar um sinal com uma frequência de 100 Hz e 25% de "duty-cycle". Usando o módulo "output compare" OC5 e como base de tempo o Timer T3 e supondo ainda PBCLK = 40 MHz:

a. determine o valor efetivo da constante de prescaler que maximiza a resolução do sinal PWM
``` 
Kmin = 40 MHz / 65536 * 100 Hz = 6.1

O K minimo é 8
``` 
b. determine o valor das constantes PR3 e OC5RS
``` 
PR3 = (5 MHz / 100 Hz) - 1 = 49999

OC5RS = 50000 * 25 / 100 = 12500 
``` 
c. determine a resolução do sinal de PWM obtido

``` 
OCK = (PR + 1) * DutyCycle / 100

12500 = 50000 * DutyCycle / 100

1250000 = 50000 * DutyCycle

DutyCycle = 1250000 / 50000 = 25%
``` 

### 60. Considere ainda um timer como o da figura acima (semelhante aos dos PIC32) com a sua saída ligada uma unidade OC. Admita que a frequência do relógio TCLK é de 20MHz e que o fator de divisão do prescaler é 8. Determine quais os valores que deverá colocar nos registos em PR e OCK para obter na saída O1 um sinal periódico com uma mfrequência de 200Hz e um duty cycle de 25%: 

```
Prescaler_out = 20 MHz / 8 = 2.5 MHz

PR = (2.5 MHz / 200) - 1 = 12499

OCxRS = 12500 * 25 / 100 = 3125

``` 

### 61. Considere um timer do tipo A do PIC32 (semelhante ao da figura) e um PBCLK = 20MHz. Determine o fator divisão do prescaler e o valor a colocar em PR1 para que o período de fout seja de 15ms, com a melhor precisão possível: 

```

F = 1 / 35*10^-3 = 66.66 Hz

Prescaler = 20 MHz / 65536 * 66.66 = 4.5 

K = 8

PR1 = (2.5 Mhz / 66.66) - 1 = 37499 

```


### 62. Considere um timer com reset síncrono em que a relação entre as frequências de entrada e de saída é dada por (k+1), sendo k uma constante configurável. Determine o valor de k para as seguintes condições:

a. frequência de entrada do timer for 20MHz e período do sinal à saída de 5ms
``` 
F = 1 / 5 * 10^-3 = 200 Hz

Kmin = (20MHz / 65536 * 200Hz) + 1 = 2.5 ~ Kmin = 4
```
b. frequência de entrada do timer for 25MHz e período do sinal à saída de 1ms
``` 
F = 1 / 1 * 10^-3 = 1 kHz

Kmin = (25 MHz / 65536 * 1 kHz) + 1 = 1.38 ~ Kmin = 2
```
c. frequência de entrada do timer for 40MHz e período do sinal à saída de 250ms
``` 
F = 1 / 250 * 10^-3 = 4 Hz

Kmin = (25 MHz / 65536 * 4 Hz) + 1 = 96.36 ~ Kmin = 256
```

### 63. Calcule qual o tempo máximo entre resets ao um sistema de watchdog timer que gera um sinal de reset ao processador sempre que a contagem atinge o valor máximo. Admita as seguintes condições:

a. frequência de entrada de 100 kHz, contador crescente de 16 bits
``` 
1 / 100 kHz  = 10us

2^16 = 65536

65536 * 10us = 655360us = 655.36ms

```
b. frequência de entrada de 20 kHz, contador crescente de 10 bits
``` 
1 / 20 kHz  = 50us

2^10 = 1024

1024 * 50us = 51200us = 51.2ms
```
c. frequência de entrada de 50MHz, contador crescente de 24 bits
``` 
1 / 50 MHz  = 20ns

2^24 = 16777216

16777216 * 20ns = 335.544ms
```

### 64. Um determinado microcontrolador disponibiliza um watchdog timer com uma frequência de entrada de 100 kHz. O programa em execução faz, por software, um reset ao watchdog timer com uma periodicidade que pode variar entre [10ms … 170ms]. Determine o número mínimo de bits do contador do watchdog timer por forma a que este nunca gere um reset ao processador
``` 
1 / 10 kHz  = 0.1ms

170 / 0.1 = 1700

O contador deve ter no minímo log2(1700) ~ 11 bits

```

### 65. Repita o problema anterior admitindo agora que a frequência de entrada do watchdog timer é de 250 kHz e que o programa em execução faz, por software, um reset ao watchdog timer com uma periodicidade que pode variar entre [125ms … 480ms]
``` 
1 / 250 kHz  = 0.001ms

480 / 0.001 = 480000

O contador deve ter no minímo log2(480000) ~ 19 bits
```

### 66. O programa em execução num microcontrolador faz, por software, um reset ao watchdog timer com uma periodicidade que pode variar entre [50ms … 150ms]. O watchdog desse microcontrolador usa um gerador de relógio próprio e um contador binário de 16 bits que, ao chegar ao fim de contagem, gera um reset por hardware ao microcontrolador. Dadas estas condições, e por forma a que o sistema de supervisão funcione adequadamente, determine qua a máxima frequência de relógio aplicada na entrada do watchdog. 

``` 

16 bits => 65536

150ms / 65536 = 0.00228

F = 1 / 0.00228 = 436.9 Hz

```

# NOÇÕES BÁSICAS DE BARRAMENTOS / DESCODIFICAÇÃO DE ENDEREÇOS

### 67. Para um barramento de endereço como o indicado abaixo, que seleciona blocos de memória com 1Kbyte, suponha que no descodificador apenas se consideram os bits A15, A13 e A11, com os valores 1, 0 e 0, respetivamente.

a. apresente a expressão lógica que implementa este descodificador:

i. em lógica positiva
```

```

ii. em lógica negativa
```
```

b. indique os endereços inicial e final da gama-base descodificada e de todas as réplicas 
```
```

### 68. Considere o exemplo de um espaço de endereçamento indicado na figura abaixo, em que os blocos de memória têm uma dimensão de 4Kbyte. Admita agora não vamos descodificar os bits A14 e A12 do bloco dos 4 bits mais significativos, resultando na expressão CS\ = A15 + A13\

a. determine as gamas do espaço de endereçamento de 16 bits ocupadas pela memória.
```
```
b. determine os endereços possíveis para aceder à 15ª posição da memória. 
```
```

### 69. Escreva as equações lógicas dos 4 descodificadores necessários para a geração dos sinais de seleção para cada um dos dispositivos identificados na figura ao lado. 


### 70. Para o exemplo da figura abaixo, determine a gama de endereços em que cada uma das linhas CS_x está ativa, com a constante de comparação 0x00102 e admitindo que o valor de S é composto por 3 bits e N=32bits. 


### 71. Para um barramento de endereço de 20 bits, semelhante ao indicado na figura, pretende-se gerar os sinais de seleção para 4 memórias de 8 kByte, a mapear em gamas de endereços consecutivas, de modo a formar um conjunto de 32 kByte. O endereço inicial deve ser configurável. Para um espaço de endereçamento de 20 bits: 
a. indique o número de bits dos campos K, S e R, supondo descodificação total
b. esboce o circuito digital que implementa este descodificador
c. indique os endereços inicial e final para a primeira, segunda e última gamas de endereços possíveis de serem descodificadas
d. para a última gama de endereços, indique os endereços inicial e final atribuídos a cada uma das 4 memórias de 8kbyte
e. suponha que o endereço 0x3AC45 é um endereço válido para aceder ao conjunto de 32k. Indique os endereços inicial e final da gama que inclui este endereço. Indique os endereços inicial e final da memória de 8KByte à qual está atribuído este endereço 


### 72. Pretende-se gerar os sinais de seleção para os seguintes 4 dispositivos: 1 porto de saída de 1 byte, 1 memória RAM de 1 kByte (byte-addressable), 1 memória ROM de 2 kByte (byte-addressable), 1 periférico com 5 registos de 1 byte cada um. O espaço de endereçamento a considerar é de 20 bits.
a. desenhe o gerador de linhas de seleção para estes 4 dispositivos, baseando-se no modelo discutido nos slides anteriores e usando a mesma sub-gama para o periférico e para o porto de saída de 1 byte.
b. especifique a dimensão de todos os barramentos e quais os bits que são usados
c. desenhe o mapa de memória com o endereço inicial e final do espaço efetivamente ocupado por cada um dos 4 dispositivos, considerando para o conjunto um endereço-base por si determinado

### 73. O periférico com 5 registos, do exercício anterior, tem um barramento de endereços com três bits. Suponha que esses bits estão ligados aos bits A0, A1 e A2 do barramento de endereços do CPU.
a. usando o descodificador desenhado no exercício anterior, indique os 16 primeiros endereços em que é possível aceder ao registo 0 (selecionado com A0, A1 e A2 a 0)
b. repita o exercício anterior supondo que os 3 bits do barramento de endereços do periférico estão ligados aos bits A2, A3 e A4 do barramento de endereços.

### 74. Admita que, num espaço de endereçamento de 16 bits, um descodificador é implementado através da expressão lógica "CE\ = A15 + A14 + A12\". Determine qual/quais a(s) gama(s) de endereço(s) que este módulo descodifica:

### 75. Suponha que pretende implementar um circuito gerador de sinais de seleção programável (semelhante ao que estudou nas aulas teóricas) que gere 64 linhas de seleção, cada uma delas ativa em 16k endereços consecutivos, num espaço de endereçamento de 32 bits.
a. Determine qual a dimensão em bits (N) e respetiva gama, que deve ser ligado ao primeiro bloco da figura
b. Determine agora qual a dimensão em bits (N) e respetiva gama, que deve ser ligado ao primeiro bloco da figura, se pretendêssemos agora que cada uma das 64 linhas de seleção ativa 1K endereços consecutivos

### 76. Um programa que pretende transferir dados de 32 bits de um periférico para a memória é implementado num ciclo com 10 instruções. Admitindo que o CPU funciona a 200 MHz e que o programa em causa apresenta um CPI de 2.5, determine, em MByte/s, a taxa de transferência máxima que se consegue obter, supondo um barramento de dados de 32 bits.

### 77. Suponha que dispõe de 16 circuitos de memória de 1Mx4bits. Usando todos estes circuitos, determine qual o tamanho do módulo de memória, com uma dimensão de palavra de 1 byte, que é possível construir:

### 78. Para construir um módulo de memória SRAM de 512k x 8 bits, admitindo que dispõe de circuitos de 64k x 8 bits quantos circuitos seriam necessários?

### 79. Admita um sistema com um barramento de endereço com 16 bits. Supondo que uma memória com 1K registos é selecionada a partir de um descodificador que utiliza os bits [A13..A10]:
a. determine quantas réplicas da memória resultam desta descodificação
b. identifique, justificando, se os espaços de endereçamento são contíguos ou não contíguos

### 80. O sinal de seleção "Sel\" (ativo baixo) de uma memória de 2k endereços mapeada na gama de endereços 0x00800...0x00FFF, num espaço de endereçamento de 20 bits, pode ser obtido através de uma expressão ógica do tipo
a. obtenha a expressão do sinal "Sel\" (ativo baixo) um porto mapeado na gama de endereços 0x00400...0x007FF, num espaço de endereçamento de 20 bits
b. obtenha a expressão do sinal "Sel\" (ativo baixo) para as mesmas condições da alínea anterior, mas agora admitindo que o espaço de endereçamento é de 16 bits
c. obtenha a expressão do sinal "Sel\" (ativo baixo) de uma memória de 16k endereços mapeado na gama de endereços 0x8C000...0x8FFFF, num espaço de endereçamento de 20 bits
d. Obtenha a expressão do sinal "Sel" (ativo alto) de um porto mapeado na gama de endereços 0x0000...0x03FF de um processador com um espaço de endereçamento de 16 bits
e. Obtenha a expressão do sinal "Sel" (ativo alto) de uma memória de 4k endereços mapeado na gama de endereços 0x9000...0x9FFF, num espaço de endereçamento de 16 bits

### 81. Determine qual a(s) gama(s) de endereço(s) descodificada(s), num espaço de endereçamento de 16 bits, por um descodificador implementado através das seguintes expressões lógicas
a. "CE\ = A15 + A14 + A12\"
b. "CE\ = A15 + A13\ + A12\"
c.  =  + 	 +  . Admita neste caso que o espaço de endereçamento é de 24 bits
d.  =  +  + . Admita neste caso que o espaço de endereçamento é de 32 bits


# ORGANIZAÇÃO DE BARRAMENTOS DE DADOS

### 82. Em barramentos paralelo multi-master existem várias técnicas para determinar a prioridade com que o barramento é atribuído a uma dada unidade. Descreva sucintamente cada uma das seguintes:

a. prioridades fixas
```
Em pedidos simultâneos o barramento é sempre atribuído ao master com prioridade mais alta. 
```
b. critério Last-Come/First-Served
```
As prioridades mudam ao longo do tempo, o ultimo a pedir é o primeiro a ser servido
```
c. critério First-Come/First-Served
```
As prioridades mudam ao longo do tempo, o primeiro a pedir é o primeiro a ser servido
```
d. round-robin
```
O acesso ao barramento é atribuido rotativamente, o master quando termina a trasnferência passa o controlo ao master seguinte.
```

### 83. Numa transferência em que o CPU pode prolongar o ciclo de leitura/escrita por um ou mais ciclos de relógio, em função de um sinal de protocolo gerado pelo dispositivo externo podemos afirmar que estamos perante que tipo de transferência? Justifique.

```
Uma transferência semi-sincrona, funciona por defeito de forma síncrona, mas torna-se "handshaken" quando houver um pedido explícito, por parte do slave,
para alteração da temporização das ações.

Um dispositivo lento pode ativar um sinal para atrasas a conclusão da operação, no caso deste sinal não ser ativado a transferência é síncrona. 
Só os dispositivos lentos necessitam de ativar este sinal!

Este método tem várias vantagens pois permite a coexistência de dispositivos rápidos e lentos no mesmo sistema.
```

### 84. Identifique que elementos caracterizam um barramento paralelo de tipo síncrono e que tipos de transferência de dados são suportados pelo mesmo.
```
Um barramento paralelo sincrono é composto por n "linhas" em que seguem a informação e de um clock, o barramento paralelo tem a vantagem
de poder ser possivel a transferencia de vários bits ao mesmo tempo.
```

### 85. Identifique que elementos caracterizam uma transferência assíncrona (handshaken) e quais as vantagens deste tipo de transferência para certas arquiteturas envolvendo pelo menos um master e um conjunto de dispositivos slave.
```
Para uma comunicação handshake é necessário o sinal VALID e o sinal ACCEPT (ACK), quando a informação enviada pelo master fica estavel, este
coloca o sinal VALID ativo, quando o slave recebe este sinal processa-o, e no final ativa o sinal ACCEPT para informar o master que processou o pedido.
O master quando recerber o sinal ACCEPT ira desativar o sinal VALID e liberta o barramento.

Também existem sinais de controlo que identificam se a operação vai ser de escrita ou de leitura.

Este metudo de trasnferencia é util para comunicação com dispositivos muito lentos e com tempos de resposta variáveis, ao contrário, a trasnferência síncrona apesar de ser mais simples é mais rígido para certas aplicações, pois a unidade mais lenta determina a frequencia máxima
```

### 86. Considere um barramento paralelo multiplexado de 16 bits (de informação). Sobre esse barramento pretende-se implementar um protocolo de comunicação, de tipo microciclo. Determine o número mínimo de ciclos necessários para completar uma transação sabendo que:

a. o espaço de endereçamento é de 32 bits os dados estão organizados em palavas de 32 bits
```
São necessários 2 ciclos de clock para enviar o endereço e mais 2 ciclos de clock para enviar 1 palavra

Logo, por cada palavra, são necessários 4 ciclos de clock
```
b. o espaço de endereçamento é de 16 bits os dados estão organizados em palavas de 32 bit
```
É necessário 1 ciclo de clock para enviar o endereço e 2 para enviar uma word, logo são necessários 3 ciclos relógio.
```
c. o espaço de endereçamento é de 32 bits os dados estão organizados em palavas de 16 bits 
```
É necessário 2 ciclos de clock para enviar o endereço e 1 para enviar uma word, logo são necessários 3 ciclos relógio.

```
d. o espaço de endereçamento é de 48 bits os dados estão organizados em palavas de 16 bits
```
É necessário 3 ciclos de clock para enviar o endereço e 1 para enviar uma word, logo são necessários 4 ciclos relógio.
```

### 87. Em barramentos multi-master, o que entende por situações de "starvation"
```
Starvation pode occorrer quando masters com mais prioridade estão simultaneamente a fazer pedidos deixando outro master, com menos prioridade 
eternamente à espera.
```

### 88. Um programa para transferir dados de 32 bits de um periférico para a memória é implementado num ciclo com 10 instruções. Admitindo que o CPU funciona a 200 MHz e que o programa em causa apresenta um CPI de 2.5, determine a taxa de transferência máxima, em Bytes/s, que é possível obter.
```

200 / 2.5 = 80 MHz é a frequencia de cada instrução.

Cada transferencia de 32 bits requer 10 instruções, 80 / 10 = 8 M transferências por segundo

(8 M * 32) / 8 = 32 MB

```

### 89. Considerando o diagrama temporal da figura ao lado podemos afirmar que estamos perante um ciclo de:

a. identifique a natureza da operação
```
Leitura
```
b. identifique qual o tipo de transferência que está ali representada
```
Transferência de dados
```
c. Identifique qual a configurações da operação de transferência de dados
```
Microciclo
```

### 90. Considere um CPU que suporta transferências de tipo síncrono e de tipo semi-síncrono. Para a operação de leitura representada no diagrama ao lado determine o número de wait-states necessários para concluir com sucesso essa operação considerando os seguintes pressupostos (Nota: assuma que o tempo mínimo durante o qual os dados têm e estar válidos tem de ser superior a um ciclo de relógio):

a. Frequência do CPU= 500 MHz; tempo de acesso à memória de 12 ns (tempo que decorre desde que a memória é selecionada até que a informação fica disponível no data bus); atraso introduzido pelo descodificador de endereços da memória de 2.5 ns
```
500MHz <=> 2ns

Tempo de acesso à memória é de 12ns, e o atraso do address decoder é 2.5ns.

12ns + 2.5ns = 14.5ns

O tempo da operação são 4 ciclos o que equivale a 2*4 = 8ns

14.5ns - 8ns + 2ns = 8.5ns

8.5 / 2 = 4.25 ~ 5

São necessários 5 wait-states
```

b. Frequência do CPU= 200 MHz; tempo de acesso à memória de 35 ns; atraso introduzido pelo descodificador de endereços da memória de 7 ns
```
500MHz <=> 2ns

Tempo de acesso à memória é de 35ns, e o atraso do address decoder é 7ns.

35ns + 7ns = 42ns

O tempo da operação são 4 ciclos o que equivale a 2*4 = 8ns

42ns - 8ns = 34ns

34 / 2 = 17

São necessários 17 wait-states
```

### 91. Descreva, pelas suas próprias palavras as seguintes o que caracetriza as seguintes configurações de operações de transferência de dados:
a. merged
```
Existe uma coexistencia temporal entre o Address e o Data, o que significa enquanto o Data for válido o Address também é.
O tempo em que Data é valido é geralmente inferior ao tempo em que Address é valido.
```
b. microciclo
```
A transferência de dados e de endereços são autonomas, ou seja não ocorem ao mesmo tempo, têm tambem sinais de controlo separados.

O ADDR_STB fica ativo quando o Address fica ativo
O DATA_STB fica ativo quando a Data fica ativo

Podemos ter apenas um barramento para envio de endereço e data uma vez que estes são enviados em alturas diferentes, os sinais I

Neste cenário temos 2 sinais:

O INFO_STB indica que os dados estão válidos
O INFO_TYP indica que o que esta no endereço é Data.

Se o INFO_STB tiver ativo e o INFO_TYP tiver inativo indica que o que esta no barramento é o endereço.
```
c. read-modify-write
```
Possibilita a modificação parcial de bits
Acesso duplo com um só endereço
Primeiro a leitura depois a escrita.

```
d. read_after-write
```
Acesso duplo com um só endereçamento.
Primeiro escrita depois leitura para verificação
```
e. block
```
Acesso múltiplo incremental, iniciado por um enderelamento.
Escreve um bloco de informação.

Um endereço é gerado e de seguinda é enviada a informação, o slave incrementa o endereço automaticamente sempre que existe um pulso no write.
```

### 92. As figuras abaixo correspondem ao diagrama temporal de duas operações realizada num barramento paralelo:

a. como caracterizaria, quanto à natureza da operação uma operação cada uma delas
```
A primeira é uma escrita, a segunda uma leitura.
```
b. face à observação dos diagramas, considera que estamos perante uma operação síncrona, semi-síncrona ou assíncrona
```
É uma operação microciclo sincrona
```
c. que tipo de multiplexagem é possível observar no barramento INFO?
```
O envio do address e valid no mesmo barramento
```
d. como designaria a configuração da operação realizada? 
```
Microciclo
```

### 93. Identifique uma ou mais técnicas através das quais um árbitro de um barramento multi-master pode evitar situações de "starvation" nos acessos ao barramento.
```
Implementar uma solução Fair, como round-robin, FIFO ou FCFS, ou usar vários barramentos com diferentes tipos de desempenho (bridges)
```

### 94. Considere um barramento multi-master baseado em prioridades fixas. Neste caso, um árbitro distribuído irá atribuir o barramento a qual dos masters ligados ao barramento? 
```
Irá atribuir o barramento ao master com prioridade mais alta.
```


# BARRAMENTOS DE COMUNICAÇÃO SÉRIE

### 95. Classifique as vantagens dos barramentos série (ao nível físico) quando comparados com barramentos paralelo:
a. ao nível da implementação
``` 
A implementação é mais simples.
```
b. ao nível da cablagem de suporte (em barramentos com fios)
``` 
Existem menos fios, 1 fio consegue transmitir a informação toda em modo série
```
c. ao nível do custo
``` 
Mais economico uma vez que é mais simples
```
d. ao nível da distância de transmissão
``` 
Usando um par diferencial é possivel a transmissão em longas destancias
```
e. ao nível do débito de transmissão
``` 
O débito é elevado
```

### 96. O que caracteriza topologicamente um barramento de comunicação série para podermos afirmar que este é um barramento:
a. síncrono
``` 
O sinal de relógio é transmitido de forma explícita atravez de um sinal adicional, ou 2 clocks que estejam sincronizados.
Se o sinal não for transmitido, devemos ter um mecanismo que misture o clock na linha de dados.
```
b. assíncrono
``` 
Não é usado um clock na trasmissão, bem há recuperação do relógio.
Neste modo é necessário acrescentar bits para sinalizar o inicio e o fim da trasnmioção.
```

### 97. Nos barramentos série com comunicação síncrona, quais os métodos mais comuns para assegurar que os relógios de dois ou mais nós ligados ao barramento se mantêm sincronizados?
``` 
Enviar um sinal extra com o clock, ou codificar o clock misturado com a linha de dados.
```

### 98. Nos barramentos série com comunicação síncrona, o que entende por codificação Manchester?
``` 
É um métudo de codificar o clock na linha de dados fazendo um XOR da data e do clock

É enviada uma sequencia de bits, e o receptor analizando o tempo em que o data esta a 1 consegue determinar o periodo do clock do trasnmissor,
tendo conhecimento deste tempo o receptor vai detectar uma transição a uma frequiencia de cerca de ~80% do periodo
```

### 99. Qual a diferença entre um protocolo de comunicação série full-duplex e um protocolo de comunicação série halfduplex?
``` 
Numa aplicação half-duplex é usada apenas uma linha de dados que pode ser usada para transmição entre master e slave durante um tempo determinado
e vice versa.

Numa aplicação full-duplex existem 2 linhas de dados uma para transmição e outra para recepção, que possibilita a trasnmição simultanea
```

### 100. Dos protocolos de comunicação série que estudou nas aulas teóricas dê exemplos de:

a. protocolos full-duplex
``` 
UART
```
b. protocolos half-duplex
``` 
I2C
```

### 101. Dos protocolos de comunicação série que estudou nas aulas teóricas existem casos em que a transmissão é orientada ao bit e casos em que a transmissão é orientada ao byte. Explique sucintamente a diferença e dê exemplos de protocolos que usam cada um dos dois.

``` 
no modo síncrono são enviados bits

no modo assíncrono são enviados bytes

```

# PROTOCOLO SPI

### 102. Como caracterizaria o barramento SPI no que respeita:

a. ao tipo de ligação entre dispositivos
```
ligação sincrona do tipo Master-slave full-duplex
```
b. ao tipo de sincronização entre dispositivos
```
A sincronização é feita atravez de um clock fornecido pelo master
```
c. à natureza da transferência de dados (bi-direcional, unidirecional) 
```
bi-direcional
```

###  103. Suponha um sistema de medida, baseado no protocolo SPI, que recolhe periodicamente informação proveniente de vários sensores, cada um deles com uma resolução igual (i.e. nº de bits de dados). Determine o tempo mínimo de que o master necessita para adquirir os valores de todos os sensores (cada um implementado num slave distinto), sabendo que:

a. o número de sensores é 20, a frequência de relógio é de 100KHz e a resolução dos sensores é de 16 bits
```
```
b. o número de sensores é 8, a frequência de relógio é de 20KHz e a resolução dos sensores é de 8 bits
```
```
c. o número de sensores é 10, a frequência de relógio é de 100KHz e a resolução dos sensores é de 8 bits
```
```
d. o número de sensores é 30, a frequência de relógio é de 50KHz e a resolução dos sensores é de 8 bits
```
```

###  104. Como caracterizaria um sistema SPI entre as seguintes opções: multi-master assíncrono; multi-master síncrono; ponto a ponto assíncrono: ponto a ponto síncrono.
```
```

### 105. Diria que o protocolo SPI é adequado para ligação entre dispositivos a longas distâncias? Justifique adequadamente a sua resposta.
```
Não pois não é possivel garantir a integridade do sinal
```

### 106. Numa arquitetura em que um master SPI de 8bits se encontra ligado a um conjunto de três slaves organizados em daisy chain como descreveria a interligação dos principais sinais entre o master e os slaves e qual a dimensão das palavras trocadas entre o master e o conjunto de slaves.
```
O master pode trocar palavras de 24 bits (8*3), o MOSI do master esta ligado ao primeiro slave, e o primeiro slave tem o MISO ligado ao MOSI do slave 2 e assim sucessivamente.
Em daisy chain todos os slaves estão ativos.
```

###  107. Descreva sucintamente qual a sequência de operações que são realizadas ao nível do master por forma a assegurar que os seus parâmetros são adequados a realizar validamente troca de informação com um slave a que se encontre ligado. 
```
O master deve configurar o clock para uma frequência igual ou inferior à suportada pelo slave.
Ativar a linha SS\ do slave com o qual vai comunicar
Em cada ciclo de relógio o master coloca na linha MOSI um bit de informação que é lido pelo slave na transição de relógio oposta seguinte, e 
o slave coloca na linha MISO um bit de informação que é lifo pelo master na transição oposta seguinte.

No fim, o master desativa a linha SS\ e o clock que fica estavável por exemplo, a nivel lógico 1.

No final o master e o slave trocaram o conteúdo dos seus shift-registers
```


# I2C

### 108. Considere o diagrama temporal representado abaixo. Admita que representa a comunicação I2C entre um master (µC) e um slave (ADC de 10 bits).
a. qual o endereço do elemento slave (ADC)?
```
Endereço: 0110101 
Bit qualificação: 1

O endereço do slave é: 0x35
```
b. estamos perante uma operação de escrita ou de leitura?
```
O bit de qualificação é 1, logo estamos perante uma leitura.
```
c. quantos ACKs são gerados pelo slave?
```
1 ACKs
```
d. quantos ACKs são gerados pelo master?
```
1 ACKs
```
e. quantos NACKs são gerados? Por quem?
```
1 NACK
```
f. qual o valor (expresso em hexadecimal) que foi fornecido pela ADC ao µC, sabendo que este começa sempre pelo MSBit?
```
1010011011 = 0x29B
```
g. quantas situações de clock stretch são gerados nesta transação? Por quem?
```
1
```
h. supondo que a frequência do relógio é de 1MHz e que o stretch corresponde a dois ciclos de relógio, qual a duração total da transação? 
```
Foram feitas 2 transações

Cada transação é composta por 9 ciclos, 8 para cada bit + 1 de ACK ou NACK

9 ciclos * 3 transações + 2 streachs + 1 stop bit = 30 ciclos

F = 1/ 1MHz = 1us

30*1 = 30us
```

### 109. Descreva sucintamente, no protocolo I2C, como é realizado o endereçamento/seleção do dispositivo a quem é destinada a mensagem ou de quem se pretende obter informação.
```

Em I2C os endereços podem ter 7bits (em modo normal) ou 10 bits.

No inicio o master envia um sinal START e de seguida o endereço do slave e o bit de qualificação (R/W)
```

### 110. Quantas linhas (físicas) compõem um barramento I2C? Qual a sua designação e finalidade? 
```
Compem 2 linhas de comunicação, serial data line (SDA) e serial clock line (SCL)
```

### 111. No protocolo I2C em que condições se considera que o barramento de comunicação está livre?
```
O barramento passa a estar livre quando ocorre uma transição do SDA de 0 para 1 quando SCL = 1, e deixa de estar livre
quando SDA passa para 0 com SCL a 1
```

### 112. Descreva sucintamente, no protocolo I2C, quem é responsável pela geração do sinal de relógio e como é possível assegurar a sincronização do mesmo entre master e slave
```
O master é responsável por gerar o sinal relógio, a sincronização é feita atravez de um transistor e de uma resistencia pull-up
```

### 113. Descreva sucintamente, no protocolo I2C, o processo de arbitragem no acesso ao barramento quando dois ou mais masters tentam aceder simultaneamente ao mesmo.
```
A arbitragem é feita pelo bit domiante / bit recessivo e processa-se bit a bit.
Por cada novo bit enviado, quando a linha SCL está a '1' cada master lê a linha SDA e verifica se o seu valor coincide com o que enviou.

O processo de arbitragem é perdido quando o master lê da linha o nível lógico 0 tendo enviado o nível lógico 1.

O master que perde o processo de arbitragem retira-se, libertando a linha SDA comutando se de imediato para o modo slave.

Irá tentar de novo quando o barramento passar ao estado "idle" (espera pela condição stop)
```


| DATA_1 | DATA_2 | SDA | Comentário|
|:--:|:--:|:--:|:--:|
|0|0|0|Arbitragem continua|
|0|1|0|Master 2 perde|
|1|0|0|Master 1 perde|
|1|1|1|Arbitragem continua|

### 114. No protocolo I2C, os bits que circulam no barramento têm uma característica que os distingue dos bits normalmente gerados à saída de um circuito digital convencional. Como designa, no I2C, cada um dos dois estados lógicos, e qual a sua utilidade para o funcionamento do barramento.
```
Existem os bit START e STOP, o Start occorre quando SCL é 1 e SDA passa para 0, e o STOP é quando SCL esta a 1 e SDA passa para 1.

O tempo entre o STOP e o START é o tempo em que o barramento se encontra livre
```

### 115. O esquema e o diagrama temporal mostrados abaixo exemplificam a interligação entre um master e um slave e a forma como o slave pode alterar o período do sinal de relógio gerado pelo master. Descreva os princípios de funcionamento envolvidos neste processo justificando por que razão esta solução funciona. Apresente uma razão pela qual esta método pode ser particularmente interessante numa dada arquitetura. 
```
O slave pode forçar o SCL a 0 para indicar ao master que necessita de mais tempo para processar uma dada operação.

Se o SCL_MASTER estiver a 1 e o SCL estiver a 0, o master fica logo a saber que o slave esta a puxar o sinal para 0,
nesta situação o master vai esperar que o slave remova o sinal WAIT, quando isto acontece o Master reinicia a contagem

Este método é util caso o master esteja a comunicar com slaves mais lentos
```


# RS232

### 116. Como classificaria a interface RS-232 relativamente:

a. topologia da ligação (ponto a ponto, multi-drop, multi-master, …) e número de ligações físicas do barramento
```
Ponto a ponto

Têm 3 ligações o Tx e Rx para informação e o GND para servir de ponto de referencia.

Pode tambem ter linhas adicionais:
RTS: Request to send
CTS: Clear to send
DTR: Data terminal ready
DSR: Data set ready

A norma original definia um total de 12 sinais, sendo 9 apenas para handshaking.
```
b. direccionalidade das comunicações (half duplex, full-duplex, …)
```
O RS232 é full-duplex, ou seja a um equipamento pode estar a enviar a a receber informação simultaneamente
```
c. natureza da sincronização (síncrona com relógio explícito, síncrona com relógio implícito, assíncrona, …)
```
assíncrona com relógio implícito
```
d. formatação da informação (byte oriented, bit oriented, …)
```
bit oriented (5 a 9 bits)
```

### 117. Na interface RS-232, caso o desvio de frequência entre o emissor e o recetor seja elevado a informação recebida pode conter erros nos dados recebidos. Indique quais os tipos de erro que podem ocorrer, e descreva os mecanismos que permitem detetar tais erros.
```
Dar uso de um parity bit que identifica caso se houve algum erro durante a transmição.

Uma das causas de um erro pode ser o desvio dos clocks ao longo do tempo.
```

### 118. Na interface RS-232 uma das fontes de erro, do lado do recetor, do instante de amostragem dos vários bits é o "erro de fase". Indique qual a metodologia que é usada para diminuir o impacto dessa fonte de erro e explique sucintamente porque é que esse método contribui para diminuir esse erro.
```
Usando um clock N vezes superior ao relógio transmisor e sincronizar a receção a partir desse relógio.

Este método é útil pois reduz o erro de fase para um valor irrelevante.

Por exemplo, se N = 16, o erro de fase máximo desse relógiuo relativamente ao aparecimento do start é T/16, em que T é o período do relógio transmissor.

```

### 119. Admita que a configuração numa comunicação RS-232 (figura abaixo) é 38400 bps, 7 bits sem paridade, 1 stop bit e fator de sobre amostragem de 64. Calcule o valor de frequência ideal no recetor e os intervalos admissíveis dessa frequência para os casos limite (+-25% do tempo de bit e +-75% do tempo de bit). Para isso calcule sucessivamente o seguinte:

a. intervalo de validação em períodos do sinal de relógio (TLCLK) para os dois casos limite
```
Speed: 38400
7bits sem paridade
1 stop bit
Amostragem: 64

Tbit = 64 Tlclk

Primeiro caso:  +- ((0.25/2 * 64)-1) = 7T
Segundo caso: +- ((0.75/2 * 64)-1)= 23T

```
b. número de períodos de relógio para amostrar a trama
```
1 start bit + 7 bits sem paridade + 1*0.5 stop bits = 8.5

8.5 * 64 = 544

```
c. variação máxima de frequência (em percentagem) para os dois casos limite
```
1 start bit + 7 bits sem paridade + 1*0.5 stop bits = 8.5

8.5*64 = 544

Assim a máxima descrepância que poderá ser tolerada entre os relógios do transmissor e do recetor é:

pior: +-7/544 = +-1.28%
ideal: +-23/544 = +-4.3%

```
d. qual o intervalo de frequência que é possível usar para que não haja erros nos casos limite 
```
Tlclk = 1+-0.0128 / 64*38400 = +412Hz, -401Hz

Tlclk = 1+-0.043 / 64*38400 = +424Hz, -389Hz
```

### 120. Repita o exercício anterior admitindo agora que o baud-rate é 57600 bps, a trama é composta por 8 bits com paridade par e 2 stop bits, sendo o fator de sobre amostragem de 16.

a. intervalo de validação em períodos do sinal de relógio (TLCLK) para os dois casos limite
```
Speed: 57600
8bits + 1 de paridade
2 stop bit
Amostragem: 16

Tbit = 16 Tlclk

Primeiro caso:  +- ((0.25/2 * 16)-1) = 1T
Segundo caso: +- ((0.75/2 * 16)-1)= 5T

```
b. número de períodos de relógio para amostrar a trama
```
1 start bit + 8 bits + 1 de paridade + 2*0.5 stop bits = 11

11 * 16 = 176

```
c. variação máxima de frequência (em percentagem) para os dois casos limite
```
Assim a máxima descrepância que poderá ser tolerada entre os relógios do transmissor e do recetor é:

pior: +-1/176 = +-5.68%
ideal: +-5/176 = +-2.84%

```
d. qual o intervalo de frequência que é possível usar para que não haja erros nos casos limite 
```
Tlclk = 1+-0.0568 / 64*38400 = +409Hz, -404Hz

Tlclk = 1+-0.0284 / 64*38400 = +408Hz, -405Hz
```

### 121. Determine a máxima taxa de transmissão de dados líquida (net bit rate) numa ligação RS-232, expressa em bps, admitindo as seguintes configurações:
a. baudrate de 19200 bps, 7 bits de dados, 1 bit de paridade e 1 stop bit
```
(7 * 19200) / 9 = 67200bps
```
b. baudrate de 115200 bps, 8 bits de dados, sem bit de paridade e 2 stop bits
```
(8 * 115200) / 10 = 92160bps
```
c. baudrate de 9600 bps, 8 bits de dados, 1 bit de paridade e 2 stop bits
```
(8 * 9600) / 11 = 6981bps
```
d. baudrate de 1200 bps, 7 bits de dados, sem bit de paridade e 1 stop bit
```
(7 * 1200) / 8 = 1050bps
```

### 122. Considere uma UART configurada para transmitir com os seguintes parâmetros: 100.000 bps, 8 data bits, paridade ímpar e 1 stop bit. Desenhe na figura abaixo a trama completa gerada no envio do valor 0x5A. Indique de forma inequívoca os bits de start, de stop e de paridade.
```
```

### 123. Um dispositivo com interface RS-232, configurado para transmitir com 7 bits de dados, paridade par e 2 stop bits, produz as duas tramas representadas nos diagramas seguintes que são recebidas por outro dispositivo RS-232 incorretamente configurado para 8 bits de dados, sem paridade e 1 stop bit mas com o mesmo baud rate. Nestas circunstâncias, determine se no recetor vais ser detetado algum erro e porquê. Caso não seja detetado nenhum erro, determine, em hexadecimal, qual o valor recebido.
```
```

### 124. Um dispositivo com interface RS232, configurado para transmitir 8 bits de dados, paridade ímpar e 1 stop bits, produz a trama acima (2ª) que é recebida por outro dispositivo RS232 incorretamente configurado para 7 bits de dados, sem paridade e 1 stop bit, mas com o mesmo baudrate. Nestas circunstâncias, determine se no recetor vais ser detetado algum error e porquê. Caso não seja detetado nenhum erro, determine, em hexadecimal, qual o valor recebido.
```
```

### 125. Um dispositivo com interface RS232, configurado para transmitir com 7 bits de dados, paridade par e 2 stop bits, produz a trama seguinte que é recebida por outro dispositivo RS232 configurado com os mesmos parâmetros. No entanto, devido a imprecisão do relógio, o baudrate efetivo do recetor é 7% inferior ao valor do baudrate do transmissor. Nestas circunstâncias, determine se no recetor vais ser detetado algum error e porquê. Caso não seja detetado nenhum erro, determine, em hexadecimal, qual o valor recebido. 
```
```

# DEVICE DRIVERS

### 126. Se tivesse que identificar as principais características/objetivos de um device driver como o descreveria na perspetiva:
a. do Sistema Operativo ou das aplicações
``` 
Um programa que cria uma camada de abstração que permite o acesso do dispositivo de forma independente da sua implementação.
```
b. do lado da interface com o dispositivo periférico
``` 

O periférico  podem pedir acesso ao sistema sem necessitar de ter em conta as operações de baixo nivel
```

### 127. Quando se interliga um periférico com um sistema de processamento, quem é responsável por fornecer o software do device driver? Porquê?
``` 
O fornecedor, pois ele é que tem o conhecimento de como o periférico funciona internamente.
```

### 128. Nas aulas práticas implementou um device driver para um dispositivo UART (RS-232C). Esse device driver usava, para a transmissão e para a receção, dois buffers circulares.
a. O que entende por buffer circular?
``` 
Um buffer circular é um registo FIFO composto por "slots" que ao chegar ao fim da a volta, ou seja, se o buffer circular for de 4 e tentaros escrever em 5
o buffer vai dar a volta e escreve na posição 1
```
b. Quais são as principais variáveis necessárias para gerir um buffer circular?
``` 
head: indice do primeiro valor (eg: próximo sair)
count: número de "slots" ocupados
tail: próximo espaço livre
```
c. Destas variáveis há uma cuja gestão é gerida pela aplicação e pelo device driver. Qual é essa variável e que cuidados há a ter com ela quando é atualizada do lado da aplicação?
``` 
A aplicação manipula a váriavel head, o head aponta para a posição do buffer circular de onde é lido o próximo slot

A tail e geridos pelo device driver

A count é partilhada com o device driver e o software
```

### 129. Descreva por palavras suas o que se entende por secção crítica num trecho de código? 
``` 
Uma secção critica é uma secção de código que não pode ser interrumpida por interrupts, pois caso aconteca, o interrupts pode corromper a informação
do trecho de código critico.
```

# CAN

### 130. Como classificaria o protocolo CAN relativamente:
a. à topologia da ligação (ponto a ponto, muiti-drop, multi-master, …) e número de ligações físicas do barramento
``` 
multi-master
```
b. direccionalidade das comunicações (half duplex, full-duplex, …)
``` 
half duplex
```
c. natureza da sincronização (síncrona com relógio explícito, síncrona com relógio implícito, assíncrona, …)
``` 
assíncrona
```
d. formatação da informação (byte oriented, bit oriented, …)
``` 
bit oriented
```

### 131. No barramento CAN a codificação das tramas de dados utiliza a técnica de "bit stuffing". Descreva sucintamente o motivo por que esta técnica é aplicada e em que consiste.
``` 
Bit stuffing é usado para efeitos de sincronização, a cada 5 bits iguais é inserido 1 de polaridade oposta, quando ocorre uma alteração de 0 para 1
ou vice versa o recetor re-sincroniza o relógio

Logo, ao adicionar um bit oposto a cada 5 bits iguais garante a sincronização.
```

### 132. No barramento CAN, na composição de uma trama de dados existe um campo de 11 bits designado por “identifier”. Descreva sucintamente qual a finalidade deste campo.
``` 
O identifier é o que identifica o tipo de informação que vai ser enviada
```

### 133. É ou não é verdade que, no barramento CAN, qualquer nó da rede pode desempenhar o papel de master. Se sim, será possível que dois masters enviem mensagens em simultâneo? Porquê?
``` 
Sim, qualquer nó consegue enviar e receber informação do barramento CAN
```

### 134. Descreva sucintamente o mecanismo através do qual, no barramento CAN, é realizado o controlo de acesso ao meio (arbitragem) quando mais do que um master tentam enviar mensagens em simultâneo. 
``` 
O dispositivo verifica se a infomração que enviou para o barramento é a mesma que esta lá, se não for este perde a arbitragem.
```

### 135. Quando, num barramento CAN, um master envia uma trama de dados, quantos dispositivos irão receber essa mensagem? Porquê?
``` 
Todos os dispositivos recebem a mensagem pois não existe um processo de endereçamento.
```

### 136. O protocolo adotado pelos barramentos CAN apresenta uma muito elevada capacidade de detetar erros do lado dos recetores (probabilidade de não detetar um erro inferior a 4,7x10^-11). Para tal, este protocolo recorre a um total de cinco técnicas complementares para detetar erros. Nomeie e descreva sucintamente cada uma dessas técnicas. 
``` 
- Verificar se o CRC calculado coincide com o CRC recebido.
- Verificar se o produtor recebeu o bit dominate (0) no camo ACK, se não receber significa que nenhum nó recebeu a informação.
- Analizar os campos da mensagem que devem ter sempro o valor lógico 1 (From error): EOF, ACK e CRC, se for detetado um bit dominante (0)
em qualquer um deles é gerado um erro.
- Analizar cada bit transmitido e verificar se cada bit corresponde ao bit enviado (exceções: identificados e ACK)
- Verificar se o bit stuffing esta a ser respeitado.
```

### 137. Admita que, numa aplicação a usar CAN 2.0A (trama com identificador standard), o mecanismo de aceitação de mensagens do controlador CAN foi configurado com os seguintes valores: máscara=0x7FA, filtro=0x5C0. Determine, nesta situação, quais os identificadores de mensagens que são aceites e passadas ao software que está a usar o controlador.
``` 

M: 111 1111 1010
F: 101 1100 0000

I: 101 1100 0x0x

Ids = [
101 1100 0000
101 1100 0001
101 1100 0100
101 1100 0101
]

```

### 138. Resolva novamente o problema anterior admitindo que o mecanismo de aceitação de mensagens do controlador CAN foi configurado com os seguintes valores:
a. máscara=0x4CC, filtro=0x088.
``` 


M: 100 1111 1111
F: 000 1000 1000

I: 0xx 1000 1000

Ids = [
000 1000 1000
001 1000 1000
010 1000 1000
011 1000 1000
]

```
b. máscara=0x7FF, filtro=0x253.
``` 
```
c. máscara=0x7F0, filtro=0x0A0.
``` 
```

### 139. No barramento CAN existem quatro tipos de tramas: “Data Frame”, “Remote Transmission Request Frame”, “Error Frame” e “Overload Frame”. Descreva de forma sucinta qual a finalidade de cada um destes tipos de tramas. 
``` 
Data Frame: Usado para nevio de dados para o consumidos (RTR está a 0)
Remote Transmission Request Frame: Eniviada po um nó consumidor para solicitar ao produtor a re-trasnmissão da trama
Error Frame: Usado para reporter um erro na receção, esta comunicação sobrepôes-se a qualquer comunicação.
Overload Frame: Usado para atrasar o envio da próxima trama (equivalente ao wait-state)
```

# USB

### 140. O protocolo USB suporta quatro tipos de transferência de dados. Descreva, para cada uma delas, as suas principais características no que se refere à sua periodicidade, largura de banda, latência e garantia de entrega. Dê exemplos de cenários de aplicação em que cada um destes tipos de transferência é ou pode ser usado:

a. transferências de controlo
``` 
Não periodica, sem período definido, iniciativa do host, sem garantia de taxa de transmição ou latência

Usado para consultar ou verificar o estado do dispositivo.
```
b. transferências "bulk"
``` 
Não periodica, sem período definido, iniciativa do host, sem garantia de taxa de transmição ou latência

Transferir, por exemplo um ficheiro para um dispositivo USB
```
c. transferências isócronas
``` 
Periódica, periodo definido na fase de enumeração, garantido um limite máximo de latência

USado para, por exemplo, áudio e video.
```
d. transferências de interrupção
``` 
Periódica, periodo definido na fase de enumeração, garantido um limite máximo de latência

O host periodicamente interrompe o dispositivo para saber se tem alguma informação

Usado por exemplo em ratos, teclados, joystikes, etc.
```

### 141. Descreva sucintamente a topologia das ligações físicas, no protocolo USB, nomeadamente quanto à sua configuração, número de níveis e número máximo de dispositivos suportados.
```
127
```

### 142. Como classificaria o protocolo USB (2.0) relativamente:
a. à topologia da ligação (ponto a ponto, multi-drop, multi-master, …)
``` 
ponto a ponto
```
b. direccionalidade das comunicações (half duplex, full-duplex, …)
``` 
half duplex (USB 1.0 - 2.0)
full-duplex (USB 3.x apenas em super speed mode)
```
c. codificação e transmissão de dados
``` 
codificação NRZI inverte o valor quando recebe um 0.
Bit-stuffing se nº de 1 >= 6
```
d. formatação da informação (byte oriented, bit oriented, …)
``` 
bit oriented
```

### 143. No protocolo USB cada dispositivo ligado ao host-controller é genericamente designado por “function”. Uma function pode assumir um de dois papeis. Identifique esses papeis e as suas principais características.
``` 
Pode ser um hub ou ou periférico.
```

### 144. Descreva sucintamente, no protocolo USB, os objetivos do processo normalmente designado por enumeração.
``` 
A enumeração tem ocmo objectivo descobrir se há dispositivos ligados e identifica os.

Após isto, passa ao procedimento de enumeração de cada um dos dispositivos usando o endereço 0
```

### 145. No protocolo USB, o sistema de endereçamento é composto por três campos. Descreva sucintamente o objetivo de cada um desses campos e os valores mínimo e máximo que cada um pode ter. 
``` 
Device Id
Vendor Id
Identificador
```

### 146. O mecanismo de comunicação um dispositivo USB e o "host controller" é feito através de canais virtuais. Qual a designação desses canais e o que interligam? Esses canais permitem comunicação bi-direcional? Porquê? 
``` 
É feito atraves de 2 endpoints o IN e o OUT, estes canais são uni-direcionais para USB1.0 e 2.0
```

# TECNOLOGIA, ORGANIZAÇÃO E FUNCIONAMENTO DE RAMs

### 147. Numa memória estática SRAM, uma célula de um bit é composta por seis transístores. Descreva sucintamente as vantagens e desvantagens entre a solução SRAM quando comparada com e a versão de uma célula DRAM de um bit.
``` 
A SRAM é menos densa comparada com a DRAM pois é necessário 6 trransistors por célula, o que faz com que o seu custo seja mais elevado.

É mais rápida comparada com a DRAM e a informação permanece até a alimentação ser cortada, no caso da DRAM a informação apenas permanece durante uns mili-segundos tendo esta que ser refrescada regularmente
```

### 148. A solução de organização matricial de uma memória RAM apresenta vantagens quando comparada com uma organização linear. Explique qual é essa vantagem e dê um exemplo que demonstre essa vantagem.
``` 
Usar uma matriz é mais eficiente em termos do nº de componentes que têm de ser usados.

Numa matriz basta usarmos um decoder para linha e coluna, o que reduz dignificativamente o número de componentes comparado
com uma implementação linear.
```

### 149. Quando falamos em tRC (Read Cycle Time) de uma memória nas operações de leitura estamos a referir-nos especificamente a que tempo? 
``` 
Ao tRC que é o tempo mínimo tempo que tem de ser cumprido
```

### 150. Descreva sucintamente os conceitos de:
a. Access Time
``` 
É o tempo desque se ativa o CE até que a informação fica disponível no barramento de dados.
```
b. taxa de transferência
``` 
Taxa a que os dados podem ser transferidos de/para uma memória ( 1 / cycle_time )
```

### 151. Para construir um módulo de memória SRAM de 128k x 8 bits, são necessários quantos circuitos, admitindo que dispõe de:
a. circuitos de 32k x 1 bit
``` 
32 circuitos
```
b. circuitos de 32k x 4 bits
``` 
8 circuitos
```
c. circuitos de 16k x 8 bits
``` 
8 circuitos
```
d. circuitos de 64k x 8 bits
``` 
2 circuitos
```
e. circuitos de 128k x 1 bit
``` 
8 circuitos
```

### 152. Admita que dispõe de uma memória estática SRAM de 256k × 8 (num único circuito) com uma organização matricial. Determine por quantas matrizes de células é constituída e qual é o número de linhas e colunas que compõe cada matriz.
``` 
É constituida por 8 matrizes com a dimenção de 16 ~ 16 x 16 
```

### 153. Suponha que dispõe de 16 circuitos de memória de 1Mx4. Usando todos estes circuitos, determine qual a dimensão da memória quando:
a. a largura da palavra é 4bits
```
16M 

1 coluna 16 linha
```
b. a largura da palavra é 8bits
``` 
8M

2 colunas 8 linha
```
c. a largura da palavra é 32bits
``` 
2M

8 colunas 2 linha
```
d. a memória tem 2M endereços
```
32 bits
```
e. a memória tem 8M endereços
``` 
8 bits
```

### 154. Determine o número de bits do barramento de endereços de uma memória dinâmica DRAM, se este tiver as seguintes características:
a. 512M x 8 bits, implementada com uma matriz de células com 16k linhas
``` 
columns: log2(16000) ~= 14 
row: log2(512) = 9

O barramento vai ter 14bits
```
b. 256M x 1 bit, implementada com uma matriz de células com 16k linhas
``` 
columns: log2(16000) ~= 14 
row: log2(256,000,000) ~= 28

O barramento vai ter 28bits
```
c. 4G x 4 bit, implementada com uma matriz quadrada
``` 
columns/row: log2(4,000,000) ~= 22 


O barramento vai ter 22bits
```
d. 1G x 1 bit, implementada com uma matriz de células com 32k linhas
``` 
columns: log2(32000) ~= 14 
row: log2(1*10^9) = 30

O barramento vai ter 30bits
```
e. 2G x 8 bit, implementada com uma matriz de células com 64k linhas
``` 
columns: log2(64000) ~= 16 
row: log2(2*10^9) = 31

O barramento vai ter 31bits
```
f. 256M x 1 bit, implementada com uma matriz de células com 8K linhas
``` 
columns: log2(8000) ~= 12 
row: log2(256*10^6) ~= 28

O barramento vai ter 28bits
```

### 155. Considere uma memória DRAM de 2Mx16, implementada com matrizes de armazenamento de 2048 colunas. Determine aproximadamente o tempo necessário para efetuar um refrescamento completo dessa memória se os seus parâmetros relativos a um ciclo de refrescamento, do tipo RAS Only, forem os seguintes:

a. RAS width=50 ns; Precharge time=25 ns:
``` 
O tempo para fazer o refresh de cada 16bit é 50+25 = 75ns

2*10⁶ * 75ns = 150s
```
b. RAS width=40 ns; Precharge time=15 ns:
``` 
O tempo para fazer o refresh de cada 16bit é 40+15 = 55ns

2*10⁶ * 55ns = 110s
```
c. RAS width=65 ns; Precharge time=30 ns:
``` 
O tempo para fazer o refresh de cada 16bit é 65+30 = 95ns

2*10⁶ * 95ns = 190s
```

### 156. Repita o exercício anterior admitindo agora:
a. uma memória DRAM de 8Mx16, implementada com matrizes de armazenamento de 1024 colunas
``` 
8*10⁶ * 75ns = 760s
```
b. uma memória DRAM de 512Mx16, implementada com uma matriz de células com 16k linhas
``` 
512*10⁶ * 75ns = 150s
```
c. uma memória DRAM de 4Mx32, implementada com matrizes de armazenamento de 4096 colunas
``` 
```
d. uma memória DRAM de 8Mx16, implementada com matrizes de armazenamento de 1024 colunas.
``` 
```

### 157. Descreva os passos necessários para efetuar uma operação de leitura de uma célula numa memória do tipo DRAM.
``` 
Antes de ler, a linha deve ser carregada a VDD/2, de seguinda deve ser ativo a linha "select"

O valor lógico é detetado pela diferença da tensão na linha bit relativamente a VDD / 2, se for superior significa que o valor lógico guardado na célula é 1, caso seja inferior significa que o valor lógico é 0.

A operação de leitura é destrutiva, o que significa que após a leitura o valor no célula deve ser reposto (repor a carga do condensador)
```

### 158. O diagrama apresentado abaixo representa uma operação efetuada numa memória DRAM. Identifique o modo adotado nesta operação, a natureza da operação e descreva sucintamente o seu funcionamento. 
``` 
modo paging, a ram seleciona uma row, e lê a coluna dessa row que corresponde ao endereço enviado
```

# MEMÓRIA CACHE 

### 159. Determine o número de comparadores necessário para a implementação de uma cache:
a. de mapeamento direto, dimensão de 16 kB, blocos de 64 bytes e 256 linhas
``` 
1 comparador?
```
b. de mapeamento direto, dimensão de 32 kB, blocos de 128 bytes e 256 linhas
``` 
1 comparador?
```
c. parcialmente associativa, dimensão de 64 kB, com associatividade de 4 e blocos de 64 bytes
``` 
500 comparadores?
```
d. parcialmente associativa, dimensão de 128 kB, com associatividade de 8 e blocos de 64 bytes
``` 
250 comparadores?
```
e. totalmente associativa, dimensão de 256 kB e blocos de 256 bytes 
``` 

```

### 160. Para o problema anterior, determine, para cada alínea, a dimensão em bits dos registos da Tag Memory, assumindo que o espaço de endereçamento é de 32 bits.
``` 
a) 
b) 
c) 
d)
e) 

```
### 161. Descreva, sucintamente, as vantagens e desvantagens de uma cache totalmente associativa quando comparada com uma cache de mapeamento direto.
``` 
Mais complexa por ter mais comparadores, as vantagens é a menor probabilidade de um miss.

O mapeamento direto tem menos complexidade mais maior probabildiade de um miss
```
### 162. Descreva, sucintamente, as várias técnicas de substituição no caso de ocorrência de um miss e de não haver blocos livres na cache.
``` 

```
### 163. Descreva, sucintamente, as duas técnicas de política de escrita na cache, por forma a assegurar a consistência entre esta memória (SRAM) e a memória principal (DRAM).
``` 

```
### 164. Explique, sucintamente, qual a finalidade do dirty bit e em que condições este bit é necessário.
``` 

```
### 165. Considere uma memória cache parcialmente associativa. Determine o número de bits do campo "group/set" do endereço quando:
a. a cache é de 512 kByte, o espaço de endereçamento é de 32 bits, o nível de associatividade é 4, e os blocos são compostos por 32 bytes.
``` 

```
b. a cache é de 64 kByte, o espaço de endereçamento é de 32 bits, o nível de associatividade é 8, e os blocos são compostos por 64 bytes.
``` 

```
c. a cache é de 512 kByte, o espaço de endereçamento é de 32 bits, o nível de associatividade é 4, e os blocos são compostos por 64 bytes.
``` 

```
d. a cache é de 1 MByte, o espaço de endereçamento é de 32 bits, o nível de associatividade é 4, e os blocos são compostos por 128 bytes.
``` 
```

### 166. Explique, sucintamente, qual a finalidade do valid bit e quantos destes bits são necessários para uma determinada cache com N linhas.
``` 
```

### 167. Explique, sucintamente, o conceito de princípio da localidade, incluindo em quantas formas este se apresenta e mdando exemplos que justificam a sua existência.
``` 
```

### 168. Determine o tempo médio de acesso (em ns) a uma memória hierárquica sabendo que:
a. o hit_ratio é 90%, o tempo de acesso ao nível superior é de 6ns e o tempo de acesso ao nível inferior é de 60ns
``` 
Taccess = 0.90 * 6 + 0.10 * (60+6) = 40.5
```
b. o hit_ratio é 95%, o tempo de acesso ao nível superior é de 4ns e o tempo de acesso ao nível inferior é de 35ns
``` 
Taccess = 0.95 * 4 + 0.05 * (35+4) = 8.75
```
c. o hit_ratio é 85%, o tempo de acesso ao nível superior é de 5ns e o tempo de acesso ao nível inferior é de 50ns
``` 
Taccess = 0.85 * 5 + 0.15* (50+5) = 42.1
```

### 169. Determine o tempo médio de acesso (em ciclos de relógio) a uma memória hierárquica sabendo que:
a. o hit_ratio é 90%, o tempo de acesso à cache é de 2 ciclos de relógio e o tempo de acesso à memória principal é de 100 ciclos de relógio
``` 
Taccess = 0.9 * 2 + 0.01* (2+100) = 2.82
```
b. o hit_ratio é 95%, o tempo de acesso à cache é de 2 ciclos de relógio e o tempo de acesso à memória principal é 80 ciclos de relógio
``` 
Taccess = 0.95 * 2 + 0.05* (80+2) = 6
```
c. o hit_ratio é 85%, o tempo de acesso à cache é de 4 ciclos de relógio e o tempo de acesso à memória principal é 120 ciclos de relógio
``` 
Taccess = 0.85 * 4 + 0.15* (120+4) = 22
```

### 170. Considere uma cache parcialmente associativa, com associatividade de 4, dimensão de 8 kBytes e com blocos de 32 bytes. Determine a linha em que será colocado o bloco que contém o endereço de memória:
a. 0x12B8
```
8kB / 4 = 2kB por via

2 kB / 32B = 63 linhas

00010010 101110 00

hit = 0x12
Set/group = 0x2E
Byte = 0x0

Grupo 0x2E, Posição 0
```
b. 0x355f
```


```
c. 0X2760
```
```

### 171. Considere uma cache parcialmente associativa, com associatividade de 8, dimensão de 16 kBytes e com blocos de 32 bytes. Determine a linha em que será colocado o bloco que contém o endereço de memória:
a. 0x56B9
```
```
b. 0X7041
```
```
c. 0X23F2
```
```

### 172. Numa cache com mapeamento direto, ao dividir-se o endereço real pela dimensão do bloco obtém-se o quê?
```
```
### 173. Indique como pode ser obtido aritmeticamente o endereço do “grupo” (linha da cache), numa cache com mapeamento direto.
```
```
### 174. Considere um espaço de endereçamento de 16 bits, em que se encontra implementada uma cache parcialmente associativa. Determine o número de bits respetivamente da Tag address, do Group address e do Byte address, admitindo que:
a. a cache é de 64Kbyes, a associatividade é 4 e o bloco é composto por 16 bytes
```
```
b. a cache é de 128Kbyes, a associatividade é 8 e o bloco é composto por 64 bytes
```
```
c. a cache é de 256Kbyes, a associatividade é 4 e o bloco é composto por 32 bytes
```
```
d. a cache é de 1Mbye, a associatividade é 16 e o bloco é composto por 32 bytes
```
```

### 175. Considere a estrutura de uma memória cache totalmente associativa de acordo com o esquema da figura abaixo. Admita ainda que o espaço de endereçamento é de 16 bits e que entre o grupo 6 e o grupo 3D todos os Valid bits têm o valor zero.
a. determine os valores de k e n, e ainda a dimensão da cache em bytes
```
```
b. determine o valor entregue ao CPU (ou a eventual existência de um cache miss) para os seguintes endereços de leitura: 0x3785, 0xF0A3, 0x1932, 0x6D51, 0x0FB7, 0x59E5, 0x04CF 
```
```


# MEMÓRIA VIRTUAL 

### 176. Determine o número de bits de um espaço de endereçamento virtual quando:
a. as páginas têm 8 kBytes, e a page table de cada processo tem 256k entradas
```
```
b. as páginas têm 4 kBytes, e a page table de cada processo tem 1M entradas
```
```
c. as páginas têm 4 kBytes, e a page table de cada processo tem 256k entradas
```
```
d. as páginas têm 16 kBytes, e a page table de cada processo tem 128k entradas
```
```


### 177. Num sistema com memória virtual, descreva sucintamente qual a finalidade do TLB (Translation-Lookaside Buffer), que tipo de tecnologia usa e qual a dimensão relativa quando comparado com a page table.
```
```

### 178. Num sistema que suporte memória virtual e cache classifique as seguintes situações como podendo ou não podendo ocorrer:
a. TLB miss, page table miss, cache hit
```
Não pode ocorer
```
b. TLB miss, page table hit, cache miss
```
Pode ocorer
```
c. TLB hit, page table miss, cache miss
```
Não pode ocorer
```
d. TLB hit, page table miss, cache hit
```
Não pode ocorer
```
e. TLB hit, page table hit, cache hit
```
Pode ocorer
```

### 179. Na técnica normalmente designada por "memória virtual" a que é igual o número de entradas da page table?
```
```

### 180. Descreva sucintamente no que consiste a tradução de endereços virtuais em endereços físicos.
```
Os endereços virtuais gerados pelo CPU são convertidos para endereços físicos através de uma tabela, designada por "Page Table"
A tradução de endereços tem que ser temporalmente eficiente
```

### 181. Considere um sistema de memória virtual. Determine a dimensão (em endereços) das páginas de memória sabendo que:
a. o espaço de endereçamento virtual é 32 bits e o número de entradas da page table é 512 k
```

```
b. o espaço de endereçamento virtual é 48 bits e o número de entradas da page table é 2 M
```

```
c. o espaço de endereçamento virtual é 30 bits e o número de entradas da page table é 128 k
```

```

### 182. Na técnica normalmente designada por "memória virtual" o número de entradas da page table é sempre igual a quê?
```
A page table contém um número de entradas igual ao número máximo de páginas virtuais.
```

### 183. Qual o significado do valid bit de uma entrada da page table, quando este se encontra ativo?
```
Quando o bit se encontra ativo significa que a Page Table forneceo número da página física, (endereço inicial da página em memória)
```

### 184. Para aumentar a performance de uma TLB (Translation-lookaside buffer) esta adota uma organização particular. Descreva-a sucintamente.
```
```

### 185. Descreva sucintamente algumas das vantagens da organização de memória designada por memória virtual, em particular em sistemas operativos que suportam múltiplos processos em modo concorrente.
```
A memória que um programa acede é feita de forma mais eficiente.
```

### 186. Caracterize as principais vantagens de um sistema de memória virtual, nomeadamente no que se refere a:
a. eficiência na utilização da memória
```
Memória deve ser partilhada pelos vários processos em execução.
EM memória apenas deve residir a informação necessária.
```
b. segurança
```
Não existe nenhum mecanismo que impessa que outro programa aceda aos dados de outro
```
c. transparência
```
Um processo deve ter acesso á memoria de que necessita.
Um processo deve correr como se toda a memória lhe pertencesse.
```
d. partilha de memória entre processos
```
Vários processos devem poder aceder à mesma zona de memória (de forma controlada)
```

### 187. Descreva sucintamente o procedimento adotado quando ocorre um Page Fault, evidenciando os vários passos que são adotados para resolver o problema.
```
Após um page fault deve se copiar do disco para a mem+oria interna e atualizar a page table com o endereço da página.
```

### 188. Descreva sucintamente qual a política de substituição de páginas de memória quando ocorre um Page Fault e todas as páginas da memória física estão ocupadas.
```
Se não houver uma página disponivel o CPU antes de fazer a transferencia deve copiar uma página existente para o disco.
```

### 189. A política de escrita adotada num esquema de memória virtual é designada por Write-back. Descreva sucintamente em que consiste esta política e qual o papel que o “Dirty bit” desempenha na mesma.
```
Write back é uma prática que a alteraçao da memoria digital so ocorre quando existe a necessidade de transferir um bloco ou página completa entre 2 niveis de memória destintos, para isso exite um firty bit, se o valor for 0 a página nºao precisa de ser escrita no disco aquanto da sua substituição.

Se for 1 a página que vai ser substituida foi alterada, logo antes se ser substituída esta vai ser copiada para o disco, a nova página é depois copiada para a zona de memória que ficou livre. 
```

### 190. Considere um sistema de memória virtual com um espaço de endereçamento virtual de 26 bits, páginas de 512 bytes, em que cada entrada da "Page Table" está alinhada em endereços múltiplos de 2, tem 16 bits de dimensão, e está organizada do seguinte modo:
a. em quantas páginas está organizado o espaço de endereçamento virtual? Quantas entradas tem a "Page Table"?
```
```
b. qual a dimensão do espaço de endereçamento físico?
```
```
c. em quantas páginas está organizado o espaço de endereçamento físico?
```
```


### 191. Ainda relativamente ao problema anterior, suponha que o "Page Table register" de um processo em execução tem o valor 0x1A0 e que no endereço 0x252 (e 0x253) está armazenado o valor 0xA26C
a. quais os atributos da página física referenciada por essa entrada da tabela? Onde reside a página física?
```
```
b. qual é o VPN representado nessa entrada da "Page Table"?
```
```
c. qual o endereço inicial e final da página física?
```
```
d. qual a gama de endereços virtuais que indexa esta entrada da "Page Table"?
```
```

### 192. Complete a seguinte tabela, preenchendo as quadrículas em falta e substituindo o ? pelo valor adequado. Utilize as seguintes unidades: K = 210 (Kilo), M = 220 (Mega), G = 230 (Giga), T = 240 (Tera), P = 250 (Peta) ou E = 260 (Exa). 
```
```

### 193. Determine o número de entradas da Page Table (PTE) para as seguintes combinações de número de bits do espaço de endereçamento virtual (n) e dimensão da página (P): 


### 194. Suponha um espaço de endereçamento virtual de 32 bits e um espaço de endereçamento físico de 24 bits:

a. determine o número de bits dos campos: VPN (virtual page number), VPO (virtual page offset), PPN (physical page number), PPO (physical page offset) para as dimensões de página P: 
b. para cada dimensão de página, determine o número de páginas virtuais e físicas Considere que num sistema computacional, com memória virtual, cada entrada de page table tem 32 bits, está alinhada em endereços múltiplos de 4 e contém a seguinte informação e flags: Considere ainda que o espaço de endereçamento virtual é de 4 GBytes, as páginas de memória são de 4 kBytes e o espaço de endereçamento físico é de 1 GByte. Considere também que o Page Table Register tem o valor 0x03C14300 e que a tabela seguinte representa um conjunto de valores armazenados num segmento contíguo de endereços da memória principal (DRAM): 




### 195. Considerando a informação fornecida, determine o valor de NN e KK:

### 196. Numa sequência de acessos à memória, o CPU produz os endereços 0x000031F8, 0x000031FC, 0x000062C0, 0x00009FFC e 0x000091E4.
a. determine qual a página de memória física acedida por cada um destes endereços
b. determine os endereços físicos em que são traduzidos cada um destes mesmos endereços virtuais

### 197. Admita que ao ler uma instrução, o CPU gera o endereço 0x000079C0. Indique, descrevendo sucintamente, o que acontece neste caso.

### 198. Repita o exercício anterior supondo agora que, ao ler uma instrução, o CPU gera o endereço 0x00004238. Indique, descrevendo sucintamente, o que acontece neste caso.

### 199. Num acesso do CPU ao endereço virtual 0x0000620C, identifique se, e quais são, as instruções assembly do MIPS que poderiam estar em execução.

### 200. Para o endereço do problema anterior, indique, justificando, o que vai acontecer se vier a ser necessário substituir a página em causa, na memória física, por uma outra obtida do disco.

### 201. Repita os exercícios 195 a 200, admitindo agora que a dimensão das páginas é de 64KBytes. 
