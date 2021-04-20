# Capítulo 1

## Nomenclatura

### O que é uma proposição?

    Uma proposição é uma afirmação que se diz ser verdadeira ou falsa.
    
### O que é um Axioma?
  
    É uma proposição que se aceita como verdadeira.

### O que é um Teorema?

    É uma proposição que se obtém a partir dos aciomas aplicando as regras de inferência.
    
### O que é um Lema?

    É uma proposição que se obtém a partir dos aciomas aplicando as regras de inferência, tipicamente um resultado auxiliar.
    
### O que é um Corolário ?

    Consequência (imediata) dos resultados já estabelecidos que não precisa de prova.
    
    
 ### O que é um Teoria ou sistema matemático ?
 
    Coleção de axiomas, regras de inferência e resultados (teoremas,lemas e corolários).

## Exemplo

### A proposições do sistema {x,y,z} são palavras do alfabeto

    Axioma: xyz
    Regras de inferência: 
        - Proposições obtidas a partir de uma proposição verdadeira, substituindo x por xyz, são proposições verdadeiras.
        - Proposições obtidas a partir de uma proposição verdadeira, substituindo xyz por yxz são proposições verdadeiras.    
    
    
## Exercício

### Mostra que yyxzz é um sistema matemático considerado no exemplo anterior:

    Axioma: xyz 
    Regra 1: x pode ser substituido por xyz
    Regra 2: xyz pode ser substituido por yxz
    
    Como chegar de xyz a yyxzz ?
    
    xyz   -> yxz    : regra 2 - xyz passa a yxz
    yxz   -> yxyzz  : regra 1 - x passa a xyz
    yxyzz -> yyxzz  : regra 2 - xyz passa a yxz
    
    
# Exercícios 

## Indique se as frases são ou não prosições

### 100 é maior que 10 ou 11 é um número primo

    É uma proposição verdadeira.
    
### Para todo o número x, se x >2, então x^2 + 5 > 3x

    É uma proposição falsa

### Hoje está um belo dia para ir à praia

    É uma proposição que pode ser verdadeira

### Para algum n pertencente a N, 2^n = n^2

    É uma proposição verdadeira com n = 2
    
### 2^n = n^2

    Não é uma proposição, pois não sabemos o valor de n, sem isso não podemos dizer se é verdadeira ou falsa
    
 
# 2. Sintaxe

## Fórmulas

Considera-se uma colecção de variáveis que representam as proposições com com os seguintes símbulos


Significado|Variável
|----|----|
Negação (não) | ¬ 
Conjunção (e) | ∧
Disjunção (ou) | ∨
Implicação (se, então) | ⇒
Equivalência (se e somente se) | ⇔

# 3. Semântica

Uma fórmula é valida se cada interpretação das variáveis torna a frase verdadeira

## Exemplo

### A fórmula (p ∧ q ) ⇒ q é valida

    Interpretando as variáveis como proposições, podemos obter:
    Se o Porto é campeão e está à chover, então está à chover   -> verdadeira
    Se 3+3 = 0 e o céu é azul, então o céu é azul.              -> verdadeira
    se o céu é azul é 3+3 = 0, então 3+3 = 0                    -> verdadeira
    
## Interpretar formulas

Para interpretas as fórmulas, começamos por associar a cada variável um calor de verdade {0,1}

- 0 interpreta-se por um valor falso, e 1 como verdadeiro
- os conectivos pro certas operações em {0,1} definidas pelas seguintes tabelas de verdade


φ |¬φ
|---|---|
0|1
1|0

φ |γ|φ ∨ φ
|---|---|---|
0 | 0 |0
0 | 1 |1
1 | 0 |1
1 | 1 |1

φ |γ|φ ∧ φ
|---|---|---|
0 | 0 |0
0 | 1 |0
1 | 0 |0
1 | 1 |1


φ |γ|φ ⇒ φ
|---|---|---|
0 | 0 |1
0 | 1 |1
1 | 0 |0
1 | 1 |1


φ |γ|φ ⇔ φ
|---|---|---|
0 | 0 |1
0 | 1 |0
1 | 0 |0
1 | 1 |1

## Exemplo

### A interpretação da fórmula (p ∨ q) ⇒ q

- interpretando as variáveis p -> 0 e q -> 0


p|q|(p ∨ q)|(p ∨ q) ⇒ q
|--|--|--|--|
0|0|0|1


- interpretando as variáveis p -> 1 e q -> 0

p|q|(p ∨ q)|(p ∨ q) ⇒ q
|--|--|--|--|
1|0|1|0

# 4. Tautologias

- Uma fórmula diz-se tautologia (ou fórmula válida) quando tem valor lógico 1 para cada interpretação
- Uma fórmula diz-se conssistente quando tem valor lógico 1 para alguma interpretação

## Exemplo

### Verificar se (p ∧ q) ⇒ q

Esta formula tem 2 variaveis logo a tabela de verdade vai ter 4 linhas
    
p|q|(p ∧ q)|(p ∧ q) ⇒ q
|--|--|--|--|
0|0|0|1
0|1|0|1
1|0|0|1
1|1|1|1



