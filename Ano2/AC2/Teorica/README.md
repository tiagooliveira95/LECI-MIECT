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
Kmin = 20 MHz / 65536 * 85 Hz = 2.7

O K minimo é 4
``` 
b. calcule o valor da constante PR2
```
(5 MHz / 85 Hz) - 1 = 58822.5 ~ 58823
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
b. critério Last-Come/First-Served
c. critério First-Come/First-Served
d. round-robin

### 83. Numa transferência em que o CPU pode prolongar o ciclo de leitura/escrita por um ou mais ciclos de relógio, em função de um sinal de protocolo gerado pelo dispositivo externo podemos afirmar que estamos perante que tipo de transferência? Justifique.

### 84. Identifique que elementos caracterizam um barramento paralelo de tipo síncrono e que tipos de transferência de dados são suportados pelo mesmo.

### 85. Identifique que elementos caracterizam uma transferência assíncrona (handshaken) e quais as vantagens deste tipo de transferência para certas arquiteturas envolvendo pelo menos um master e um conjunto de dispositivos slave.

### 86. Considere um barramento paralelo multiplexado de 16 bits (de informação). Sobre esse barramento pretende-se implementar um protocolo de comunicação, de tipo microciclo. Determine o número mínimo de ciclos necessários para completar uma transação sabendo que:
a. o espaço de endereçamento é de 32 bits os dados estão organizados em palavas de 32 bits
b. o espaço de endereçamento é de 16 bits os dados estão organizados em palavas de 32 bit
c. o espaço de endereçamento é de 32 bits os dados estão organizados em palavas de 16 bits 
d. o espaço de endereçamento é de 48 bits os dados estão organizados em palavas de 16 bits

### 87. Em barramentos multi-master, o que entende por situações de "starvation"

### 88. Um programa para transferir dados de 32 bits de um periférico para a memória é implementado num ciclo com 10 instruções. Admitindo que o CPU funciona a 200 MHz e que o programa em causa apresenta um CPI de 2.5, determine a taxa de transferência máxima, em Bytes/s, que é possível obter.

### 89. Considerando o diagrama temporal da figura ao lado podemos afirmar que estamos perante um ciclo de:
a. identifique a natureza da operação
b. identifique qual o tipo de transferência que está ali representada
c. Identifique qual a configurações da operação de transferência de dados

### 90. Considere um CPU que suporta transferências de tipo síncrono e de tipo semi-síncrono. Para a operação de leitura representada no diagrama ao lado determine o número de wait-states necessários para concluir com sucesso essa operação considerando os seguintes pressupostos (Nota: assuma que o tempo mínimo durante o qual os dados têm e estar válidos tem de ser superior a um ciclo de relógio):

a. Frequência do CPU= 500 MHz; tempo de acesso à memória de 12 ns (tempo que decorre desde que a memória é selecionada até que a informação fica disponível no data bus); atraso introduzido pelo descodificador de endereços da memória de 2.5 ns

b. Frequência do CPU= 200 MHz; tempo de acesso à memória de 35 ns; atraso introduzido pelo descodificador de endereços da memória de 7 ns

### 91. Descreva, pelas suas próprias palavras as seguintes o que caracetriza as seguintes configurações de operações de transferência de dados:
a. merged
b. microciclo
c. read-modify-write
d. read_after-write
e. block

### 92. As figuras abaixo correspondem ao diagrama temporal de duas operações realizada num barramento paralelo:
a. como caracterizaria, quanto à natureza da operação uma operação cada uma delas
b. face à observação dos diagramas, considera que estamos perante uma operação síncrona, semi-síncrona ou assíncrona
c. que tipo de multiplexagem é possível observar no barramento INFO?
d. como designaria a configuração da operação realizada? 

### 93. Identifique uma ou mais técnicas através das quais um árbitro de um barramento multi-master pode evitar situações de "starvation" nos acessos ao barramento.

### 94. Considere um barramento multi-master baseado em prioridades fixas. Neste caso, um árbitro distribuído irá atribuir o barramento a qual dos masters ligados ao barramento? BARRAMENTOS DE COMUNICAÇÃO SÉRIE

### 95. Classifique as vantagens dos barramentos série (ao nível físico) quando comparados com barramentos paralelo:
a. ao nível da implementação
b. ao nível da cablagem de suporte (em barramentos com fios)
c. ao nível do custo
d. ao nível da distância de transmissão
e. ao nível do débito de transmissão

### 96. O que caracteriza topologicamente um barramento de comunicação série para podermos afirmar que este é um barramento:
a. síncrono
b. assíncrono

### 97. Nos barramentos série com comunicação síncrona, quais os métodos mais comuns para assegurar que os relógios de dois ou mais nós ligados ao barramento se mantêm sincronizados?

### 98. Nos barramentos série com comunicação síncrona, o que entende por codificação Manchester?

### 99. Qual a diferença entre um protocolo de comunicação série full-duplex e um protocolo de comunicação série halfduplex?

### 100. Dos protocolos de comunicação série que estudou nas aulas teóricas dê exemplos de:
a. protocolos full-duplex
b. protocolos half-duplex

### 101. Dos protocolos de comunicação série que estudou nas aulas teóricas existem casos em que a transmissão é orientada ao bit e casos em que a transmissão é orientada ao byte. Explique sucintamente a diferença e dê exemplos de protocolos que usam cada um dos dois.

# PROTOCOLO SPI

### 102. Como caracterizaria o barramento SPI no que respeita:
a. ao tipo de ligação entre dispositivos
b. ao tipo de sincronização entre dispositivos
c. à natureza da transferência de dados (bi-direcional, unidirecional) 


