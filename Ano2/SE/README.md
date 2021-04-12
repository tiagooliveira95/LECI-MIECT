# Teórica


# Grandezas

    A corrente elétrica *I* definese pela razão entre a carga e a unidade de tempo

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;I=\frac{\bigtriangleup&space;Q}{\bigtriangleup&space;t}" title="\bg_white I=\frac{\bigtriangleup Q}{\bigtriangleup t}" />

    A carga Q é medida em *Coulomb* a unidade é *C/s* que se chama *Ampére*


Tensão

    A Tensão é a `força` que impela as cargas elétricas a fluir no condutor.

    A Tensão esta relacionada com a energia, é uma medida do trabalho *W* necessário
    para deslocar uma carga de 1 Coulomb de um terminal para o outro

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;V&space;=&space;\frac{W}{Q}" title="\bg_white V = \frac{W}{Q}" />

Sentido físico e sentido convencional

    Os electrões fluem do terminal negativo para o terminal positivo da bateria - este é designado por sentido físico da corrente.
    
    Mas a corrente é I = carga/ delta(t), se a carga é negativa então I tem sinal negativo.
    
    Para evitar valores negativos convencionalmente considera-se que a corrente flui do terminal positivo para o negativo.
    
Resistência eléctrica

    A resistência eléctrica é a resistência é uma medida de oposição que o material ofereça a passagem da corrente eléctrica.
    A resistência é denominada por Ohm
    
Conductância
    
    A condutância ao contrário da resistência, é a facilidade que o material oferece a passagem da corrente, e é designada por mho ou Siemen (S)
    
    
# Série e Paralelo

Circuito série

    - Num caminho série a corrente tem um único caminho.
    - A medição da voltagem em diferentes pontos do circuito são diferentes.
    
 Circuito paralelo
 
    - Existem múltiplos caminhos de corrente.
    - A medição da voltagem em diferentes pontos do circuito são sempre iguais.

 
 # Potência
 
 A potência em Watt designa-se por trabalho, W, por unidade de tempo, que é a taxa à qual a energia é fornecida por um elemento de circuito activo, ou a taxa em que a energia é dissipada por um elemento passivo.
 
<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;1W&space;=&space;1Joule/s" title="\bg_white 1W = 1Joule/s" /> 
 
 
A potência pode ser calculada a partir da seguinte formula

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;V*I" title="\bg_white V*I" />


Num circuito existem elementos que fornecem e absorvem potência, a lei da conservação de energia garante que o total da potência fornecida deve ser igual a totalidade da potencia absorvida:

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;\sum_{i}P_{i}^{forecida}=\sum_{j}P_{j}^{absorvida}" title="\bg_white \sum_{i}P_{i}^{forecida}=\sum_{j}P_{j}^{absorvida}" />

### Potência absorvida ou fonecida

 
Adotando a Convenção de Sinal de Elemento Passivo (CSEP) que diz que a corrente entra no polo positivo, ao determinar o calor da tensão *V* e da corrente *I* é fácil determinar se o elemento fornece ou absorve potência.

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;P&space;=&space;V*I&space;>&space;0&space;\Rightarrow&space;\text{absorvida}" title="\bg_white P = V*I > 0 \Rightarrow \text{absorvida}" /> 
<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;P&space;=&space;V*I&space;>&space;0&space;\Rightarrow&space;\text{fornecida}" title="\bg_white P = V*I > 0 \Rightarrow \text{fornecida}" />


# Lei de Ohm


Todo o condutor linear tem uma razão constante entre a tensão *v* e a corrente *i* que o atravessa.

A constante de proporcionalidade é a resisência *R*

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;\frac{v}{i}&space;=&space;R" title="\bg_black \frac{v}{i} = R" />

A expressão dada pela Lei de Ohm é válida para uma resistência que respeite a CSEP

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;v&space;=&space;R*i" title="\bg_white v = R*i" />

Caso não respeite a CSEP a formula seria

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;v&space;=&space;-R*i" title="\bg_white v = -R*i" />

### Conductância

A lei de Ohm também se aplica a conductância, e é medida em *mho* ou *Siemen* (S)

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;\frac{i}{v}&space;=&space;\frac{1}{R}&space;=&space;G" title="\bg_white \frac{i}{v} = \frac{1}{R} = G" />


### Potencia dissipada numa resistência

A potência dissipada ou absorvida é dada por:

*Substituido a tensão*

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;p&space;=&space;v*i&space;=&space;(R*i)*i&space;\Rightarrow&space;&space;p&space;=&space;R*i^2" title="\bg_white p = v*i = (R*i)*i \Rightarrow p = R*i^2" />

*Substituindo a potência*

<img src="https://latex.codecogs.com/png.image?\dpi{150}&space;\bg_white&space;p&space;=&space;v*i&space;=&space;v\frac{v}{R}&space;\Rightarrow&space;p&space;=&space;\frac{v^2}{R}" title="\bg_white p = v*i = v\frac{v}{R} \Rightarrow p = \frac{v^2}{R}" />

### Qual é o valor da resistência do filamento de uma lampada de 220v que consume 100W e a corrente no circuito ?

    p = v^2/R <=> R v^2 / p
    
    R = 220^2 / 100 = 484 Ohms
     
    i = p/v = 100/220 = 455 mA
    
# Leis de Kirchhoff

### O que é um Nó? 
    
    Um No é um ponto de ligação de dois ou mais elementos.

### O que é um Nó essencial?

    Um ponto de ligação de três ou mais elementos.
 
### O que é um Ramo?
    
    Um Caminuo no circuito que liga dois nós
    
### O que é um Caminho fechado ou loop?

    Qualquer caminho através do circuito que começa e termina no mesmo nó.
    

    
    



