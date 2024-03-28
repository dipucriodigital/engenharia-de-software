# Introdução a Criação de Páginas Web
## Exercícios da Aula 3
### Prof. Alexandre Meslin

Agora que você já terminou os [Estudos Dirigidos](../estudosDirigidos/README.md) (se ainda não fez, a  hora é essa, eles estão [aqui](../estudosDirigidos/README.md)), faça os seguintes exercícios. 
Não se esqueça de testar cada script criado.

1. No site do jogo Whac-A-Mole, a função que trata o evento `onload`, mostrata a seguir, adiciona eventos aos cinco buracos.

   Função manipuladora (*hanlder*) do evento `onload`:

    ```Javascript
    onload = function () {
        document.getElementById('start').addEventListener('click', start);
        document.getElementById('idGramado').addEventListener('mousedown', marteloBaixo);
        document.getElementById('idGramado').addEventListener('mouseup', marteloCima);
        document.getElementById('buraco0').addEventListener('click', martelada);
        document.getElementById('buraco1').addEventListener('click', martelada);
        document.getElementById('buraco2').addEventListener('click', martelada);
        document.getElementById('buraco3').addEventListener('click', martelada);
        document.getElementById('buraco4').addEventListener('click', martelada);
    };
    ```
   Converta os cinco comandos em um comando dentro de um loop do tipo `for`.
   [[Sugestão de solução](soluções/solução1.js)]

1. Incluir botão de pausa no jogo.
   * Crie uma variável global chamada `starded` para indicar o estado do jogo. Inicialize essa variável com `false` para indicar o que o jogo ainda não começou.
   * Na função `start` que inicializa o jogo: 
      * Inclua uma instrução para trocar o texto do botão para `Pause`.
      * Remova a instrução que desabilita o botão para que ele fique sempre habilitado.
      * Depois de remover o evento `start` do botão, adicione um novo evento para a pausa usando a função `pause` que você vai criar em seguida.
      * Antes de chamar a função que sobre a toupeira, mude o estado da variável `started` para true para indicar que o jogo começou.
   * Crie a função `pause`. Essa função é semelhante a função `start`, mas deve inverter as operações (embora faça na mesma ordem) e sem chamar a função que sobe a toupeira.
   * Na função `sobeToupeira`, coloque todas as operações condicionada a variável `started`, ou seja, as operações somente devem ser feitas se o valor da variável for `true` indicando que o jogo está acontecendo.

1. Gradativamente aumente a dificuldade do jogo diminuindo o tempo que a toupeira fica fora do buraco.
   * Crie uma variável global chamada `intervalo` para representar o tempo padrâo do jogo. Essa variável pode indicar o tempo que toupeira fica fora do buraco (pelo menos inicialmente) e também pode representar o intervalo entre subidas da toupeira. Coloque um valor razoável, que pode ser 5000 para indicar um tempo base de 5 segundos.
   * Crie uma variável global chamada `passo` para indicar o percentual de redução a cada aumento do nível de dificuldade. Mas lembre-se que esse é um valor percentual, ou seja, é um valor entre 0 (muito difícil) e 1 (muito fácil). Configure o seu valor inicial para 0,99 (99%) para aumentar pouco a dificuldade a cada intervalo.
   * Crie uma variável global chamada `janela` com valor inicial um pouco menor que o tempo base configurado na variável `intervalo`. Por exemplo, coloque o seu valor como sendo `intervalo * passo`.
   Sempre que a toupeira subir, multiplique o valor da `janela` pelo `passo` para aumentar a dificuldade diminuindo o tempo que a toupeira fica fora do buraco: `janela *= passo`.

1. À medida que aumenta a dificuldade diminuindo o tempo que a toupeira permanece fora do buraco, gradativamente aumente a complexidade do jogo reduzindo o intervalo de tempo entre as aparições das toupeiras.
   * Aproveitando que você já criou no exercício anterior a variável `intervalo`, diminua gradualmente o seu valor cada vez que a toupeira subir. Mas cuidado, esse valor não pode chegar a ser menor que o tempo de janela. Uma sugestão de fórmula para recalcular o tempo de intervalo seria `intervalo *= 1-(1-passo)**2`.

   [[Sugestão de solução para os itens 2, 3 e 4](soluções/solução2.js)]
