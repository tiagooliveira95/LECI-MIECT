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
