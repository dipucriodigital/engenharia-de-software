# Errata

## Aula 1

### Técnica Aplicada

> Na figura que mostra o problema de espaço entre os algarismos usando imagens com display de 7 segmentos (**Mantendo o foco**), as duas imagens estão iguais.
> A primeira mostra como ficaria se colocássemos separadores (quebra de linha) para deixar o formato do texto-fonte HTML fácil de leitura para humanos (os famosos terráqueos), como mostrado abaixo:
>
> ![Display de 7 segmentos](../imagens/caractere_0.gif)
> ![Display de 7 segmentos](../imagens/caractere_0.gif)
> ![Display de 7 segmentos](../imagens/caractere_0.gif)
>
> A segunda imagem deveria estar sem espaço entre os displays como mostrado abaixo:
>
> ![Display de 7 segmentos](../imagens/caractere_0.gif)![Display de 7 segmentos](../imagens/caractere_0.gif)![Display de 7 segmentos](../imagens/caractere_0.gif)

## Aula 3

### Técnica Aplicada

> No lugar de:
> ```html
> <tr>
>   <td>Acertos:</td>
>   <td class="pontuacao" id="acertos">
>     <img src="images/caractere_0.gif" alt="0"><img src="images/caractere_0.gif" alt="0"><img src="images/caractere_0.gif" alt="0">
>   <td>
> </tr>
> ```
> A tag `img` deveria ficar na mesma linha da tag `td`, sem espaço ou qualquer outro separador, como mostrado abaixo:
> ```html
> <tr>
>   <td>Acertos:</td>
>   <td class="pontuacao" id="acertos"><img src="images/caractere_0.gif" alt="0"><img src="images/caractere_0.gif" alt="0"><img src="images/caractere_0.gif" alt="0"><td>
> </tr>
> ```
> O código no GitHub já está atualizado.
> 
> Justificativa: ao incluirmos a quebra de linha ou qualquer outro separador entre > a tag `td` e a tag `img`, incluimos um novo filho a tag `td` que não está sendo > considerado no código JavaScript.