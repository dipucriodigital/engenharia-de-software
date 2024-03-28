# Introdução a Criação de Páginas Web
## Estudos Dirigidos da Aula 3
### Prof. Alexandre Meslin

1. Operadores relacionais e lógicos
   1. [Operadores relacionais](#Operadores-Relacionais)
   2. [Operadores lógicos](#Operadores-Lógicos)
1. [Desvio condicional](#Desvio-Condicional)
1. Repetição determinada e indeterminada
    1. [Repetição indeterminada](#Repetição-Indeterminada)
    2. [Repetição determinada](#Repetição-Determinada)

### Operadores Relacionais

Operadores relacionais, como o próprio nome sugere, relacionam dois valores, realizando comparações entre eles e retornando verdadeiro (`true`) ou falso (`false`) com base nos valores comparados.

JavaScript suporta os seguintes operadores relacionais:

* `==` Igual a (com coerção de tipo)
* `===` Igual a (sem coerção de tipo)
* `!=` Diferente de (com coerção de tipo)
* `!==` Diferente de (sem coerção de tipo)
* `>` Maior que
* `<` Menor que
* `>=` Maior ou igual a
* `<=` Menor ou igual a

Crie a seguinte [página HTML](./operadores_relacionais.html) e verifique o resultado dos operadores relacionais, principalmente os que não fazem coerção (mudança) de tipo ao comparar.

```HTML
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        console.log("Operadores de igualdade");
        console.log('1) Comparando 2 números: ', 87 == 25, 87 === 25, 87 != 25, 87 !== 25);
        console.log('2) Comparando 2 números: ', 87 == 87, 87 === 87, 87 != 87, 87 !== 87);
        console.log('3) Comparando número com texto: ', 87 == '25', 87 === '25', 87 != '25', 87 !== '25');
        console.log('4) Comparando número com texto: ', 87 == '87', 87 === '87', 87 != '87', 87 !== '87');
        console.log('5) Comparando número com texto: ', 87 == 'banana', 87 === 'banana', 87 != 'banana', 87 !== 'banana');
        console.log('6) Comparando textos: ', 'abacate' == 'abacaxi', 'abacate' != 'abacaxi');
        console.log('7) Comparando textos: ', 'abacate' == 'Abacate', 'abacate' === 'Abacate')
        console.log('8) Comparando textos: ', 'abacate' != 'Abacate', 'abacate' !== 'Abacate')
        console.log('Operadores de ordenação');
        console.log('A) Comparando 2 números: ', 87 > 25, 87 < 25, 87 >= 25, 87 <= 25);
        console.log('B) Comparando 2 números: ', 87 > 87, 87 < 87, 87 >= 87, 87 <= 87);
        console.log('C) Comparando número com texto: ', 87 > '25', 87 < '25', 87 >= '25', 87 <= '25');
        console.log('D) Comparando número com texto: ', 87 > '87', 87 < '87', 87 >= '87', 87 <= '87');
        console.log('E) Comparando número com texto: ', 87 > 'banana', 87 < 'banana', 87 >= 'banana', 87 <= 'banana');
        console.log('F) Comparando textos: ', 'abacate' > 'abacaxi', 'abacate' < 'abacaxi', 'abacate' >= 'abacaxi', 'abacate' <= 'abacaxi');
        console.log('G) Comparando textos: ', 'abacate' > 'Abacate', 'abacate' < 'Abacate', 'abacate' >= 'Abacate', 'abacate' <= 'Abacate')
</script>
</head>
<body>
    <p>Digite Ctrl+Shift+I e clique na aba console.</p>    
</body>
</html>
```

Observações importantes:
* Ao usar o operador `===`, o resultado somente será verdadeiro e o valor e o tipo forem exatamente iguais. Por outro lado, ao usar o operador `!==`, o resultado será falso se o valor ou o tipo forem diferentes.
* Quando comparamos strings, percebemos que a ordem alfabética é utilizada para definir o resultado, mas que ela é influenciada pela presença de letras minúsculas e maiúsculas. Notamos que as letras maiúsculas precedem (são consideradas menores) do que as minúsculas. Isso porque os símbolos são armazenados em binário codificados usando ASCII ou UTF-8. Para saber mais, procure na Internet por "Tabela ASCII".

### Operadores Lógicos

Os operadores lógicos em programação, incluindo JavaScript, são utilizados para realizar operações entre valores booleanos, verdadeiro ou falso, principalmente resultantes de operações relacionais ou de outras operações lógicas. Eles permitem combinar múltiplas expressões booleanas para formar uma nova expressão booleana. Existem três operadores lógicos principais.

__E lógico (AND)__: Representado pelo operador `&&`. Este operador retorna verdadeiro (`true`) se ambas as expressões booleanas, à sua esquerda e à sua direita, forem verdadeiras.
A tabela verdade a seguir resume as possibilidades entre duas expressões booleanas.

|  exp1  |  exp2  | exp1 && exp2 |
| :----: | :----: |  :----:  |
|  false |  false |  false   |
|  false |  true  |  false   |
|  true  |  false |  false   |
|  true  |  true  |  true    |

__OU lógico (OR)__: Representado pelo operador `||`. Este operador retorna verdadeiro (true) se pelo menos uma das expressões booleanas, à sua esquerda ou à sua direita, for verdadeira.
A tabela verdade a seguir resume as possibilidades entre duas expressões booleanas.

|  exp1  |  exp2  | exp1 \|\| exp2 |
| :----: | :----: |  :----:  |
|  false |  false |  false   |
|  false |  true  |  true    |
|  true  |  false |  true    |
|  true  |  true  |  true    |

__Negação lógica (NOT)__: Representado pelo operador `!`. Este operador inverte o valor de uma expressão booleana. Se a expressão original for verdadeira, a negação será falsa, e vice-versa.
A tabela verdade a seguir resume as possibilidades de uma expressão booleana.

|  exp | ! exp |
| :----: |  :----:  |
|  false |   true    |
|  true  |   false    |

Usaremos em breve esses operadores em condições de controle de fluxo, como instruções `if`, `while` e `for`, para controlar o comportamento do programa com base nas condições lógicas especificadas.

### Desvio Condicional

O desvio condicional em JavaScript é realizado por meio de instruções `if` e `else`.
Em JavaScript, você pode implementar desvios condicionais usando a instrução `if`, que permite executar blocos de código com base em uma condição especificada.
A instrução `if` verifica se uma condição é verdadeira e, se for, executa um bloco de código. Se a condição for falsa, o bloco de código é ignorado.

```Javascript
if(condição) {
    // Código a ser executado se a condição for verdadeira
}
```

> Observação: Um bloco de código é escrito entre `{` e `}`. Geralmente deslocamos um pouco para a direita o código escrito dentro do bloco. 

Exemplo simples de como usar a instrução `if`. 
Neste exemplo, o programa irá emitir uma mensagem informando o que fazer se a nota de um aluno estiver baixa.

```Javascript
if(nota < 5) {
    console.log("Alerta: aluno com nota baixa.");
    console.log("Sugerir nova lista de exercícios".);
}
```

Opcionalmente podemos informar um bloco de comandos para ser executado caso a condição seja `falsa`.

```Javascript
if(condição) {
    // Código a ser executado se a condição for verdadeira
} else {
    // Código a ser executado se a condição for falsa
}
```

Exemplo simples de como usar a instrução `if` com `else`. 
Neste exemplo, o programa irá informar se uma pessoa é maior de idade ou não.

```Javascript
if(idade >= 18) {
    console.log("Maior de idade");
} else {
    console.log("Menor de idade");
}
```

Além do `if`, você também pode usar `else if` para lidar com mais de duas condições e `else` para lidar com todas as outras condições que não foram especificadas anteriormente. 

Exemplo simples de como usar a instrução `if` com `else if` e `else`. 
Neste exemplo, o programa irá converter a nota numérica de um aluno para uma classificação por letra.

```Javascript
if(nota >= 90) {
    console.log("A");
} else if(nota >= 80) {
    console.log("B");
} else if(nota >= 70) {
    console.log("C");
} else if(nota >= 60) {
    console.log("D");
} else {
    console.log("F");
}
```

__Agora é sua vez.__

1. Em um script JavaScript, crie uma variável chamada `idade` e informe a situação eleitoral de uma pessoa com base na sua idade. A pessoa pode ser eleitora obrigatória, falcultativa ou não pode votar.
[[Sugestão de solução](soluções/if-solução1.html)]

1. Crie uma variável em um script JavaScript e informe se esta variável é positiva, negativa ou igual a zero.
[[Sugestão de solução](soluções/if-solução2.html)]

1. Em um script JavaScript, crie uma variável chamada `peso` representando o peso de uma pessoa. Crie uma outra variável chamada `altura` representando a altura dessa pessoa. Com base nessas variáveis, informe se a pessoa está abaixo do peso, com peso normal, sobrepeso ou com obsidade basedo no IMC.
O IMC pode ser calculador pela seguinte fórmula:

   ```Javascript 
   var imc = peso / (altura * altura);
   ```

   Use a seguinte tabela no seu programa:

   | IMC | Situação |
   | :----: | :----: |
   | menor que 18.5 | Abaixo do peso |
   | entre 18.5 e 25 | Peso normal |
   | entre 25 e 30 | Sobrepeso |
   | maior que 30 | Obesidade |
   
   [[Sugestão de solução](soluções/if-solução3.html)]

1. Crie uma variável chamada `número` e informe se o seu valor é par ou ímpar.
[[Sugestão de solução](soluções/if-solução4.html)]

1. Em um script Javascript, crie três variáveis representando os tamanho s dos lados de um triângulo. Infome se o triangulo formado é isósceles (três lados iguais), equilátero (dois lados iguais) ou escaleno. 

   __Desafio__: informe se os lados não formam um triângulo. Para formar um triângulo, a soma de dois lados tem que ser maior que o terceiro lado, para todos os lados!
[[Sugestão de solução](soluções/if-solução5.html)]

### Repetição Indeterminada

A repetição indeterminada é um tipo de loop que executa um bloco de código até que uma condição específica seja satisfeita. Em JavaScript, existem duas estruturas de repetição indeterminada.

(1) `while`: Executa o bloco de código enquanto a condição for verdadeira. A condição é testada antes do bloco ser executado.

```Javascript
    while(condição) {
        // Bloco de comandos a ser repetido
    }
```

Normalmente quando criamos uma repetição utilizando o comando `while`, executamos três atividades:
1. Antes do comando `while`, preparação das variáveis de controle.
2. No comando `while`, condição de permanência no loop
3. Geralmente no final do bloco do comando `while`, atualização das variáveis de controle do loop.

O comando `while` também pode ser utilizado para criarmos repetições determinadas (embora seja mais fácil fazer com o comando `for` que veremos daqui a pouco).

```Javascript
var i = 0;

while (i < 10) {
  console.log(i);
  i++;
}
```

(2) `do-while`: Executa o bloco de código pelo menos uma vez e depois repete enquanto a condição for verdadeira. Com esse comando, podemos garantir que o bloco vai ser executado pelo menos uma vez porque primeiro o bloco é executado depois a condição é analisada.

```Javascript
    do {
        // bloco de comandos a ser repetido
    } while(condição);
```

[Exemplo](./do-while.html) de uso do comando `do-while`:

```Javascript
    do {
        joga_whac_a_mole();
        var resposta = confirm("Deseja jogar novamente?");
    } while(resposta);
```

> Observação: O valor retornado pela função `confirm` é um valor booleano, ou seja, `true` ou `false`.

### Repetição Determinada

A repetição determinada é um tipo de loop que executa um bloco de código um número pré-definido de vezes. Em JavaScript, a estrutura de repetição mais comum para isso é o comando `for`.
Esse tipo de repetição é útil quando sabemos antecipadamente quantas vezes queremos executar um bloco de código.

```Javascript
for(inicialização; condição; atualização) {
    // Bloco de código a ser executado
}
```

O comando for é composto por três partes:
1) __inicialização__: Executada uma (única) vez no início do loop, geralmente utilizada para inicializar as variáveis que irão controlar o loop.
1) __condição__: Condição de permanência no loop. O bloco de comandos associado ao for será executado enquanto a condição for verdadeira. A condição é analisada antes do bloco começar a ser executado.
1) __atualização__: Executada após o bloco de comandos a cada iteração do loop. Geralmente é utilizada para atualizar as variáveis de controle.

Exemplo: O código a seguir executa o bloco de comandos 5 vezes, escrevendo números de 0 (zero) até 4 (quatro). O valor 5 (cinco) nunca será escrito porque quando a variável `i` atingir esse valor, o resultado da expressão de condição será falso e o loop terminará.

```Javascript
for(var i=0; i<5; i++) {
  console.log(i);
}
```

__Agora é sua vez.__

1. Faça um script para exibir os 10 primeiros números não negativos.
[[Sugestão de solução](soluções/loop-solução1.html)]

1. Faça um script para exibir os números de 1 até 10.
[[Sugestão de solução](soluções/loop-solução2.html)]

1. Faça um script para exibir os 10 primeiros números ímpares.
[[Sugestão de solução](soluções/loop-solução3.html)]

1. Faça um script para exibir a tabuada do número 5.
[[Sugestão de solução](soluções/loop-solução4.html)]

1. Faça um script para exibir toda a tabuada (de todos os números).
[[Sugestão de solução](soluções/loop-solução5.html)]

1. __Desafio__: Faça um script que exiba a soma de números informados pelo usuário. A leitura dos números termina quando o usuário digitar um valor negativo. Para realizar a leitura use a função prompt e a função parseFloat como mostrado a seguir.

    ```Javascript
    var numero = parseFloat(prompt("Digite um número:"));
    ```
   > Observações:<br>
   > * A função `prompt` envia uma pergunta para o usuário e espera que ele digite uma resposta. A resposta é retornar em formato de texto, mesmo que seja composta apenas por números. Nesse caso será um texto numérico.<br>
   > * A função `parseFloat` converte o seu argumento para número real. Nesse caso, o texto retornado pela função `prompt` será convertido para número real.

   [[Sugestão de solução](soluções/loop-solução6.html)]

Terminou? Então ao trabalho! Vamos fazer os [exercícios da Aula 3](../Exercícios/README.md).