function nomeDaFuncao(parametros, separados, por, virgula) {
    // comentário
    // corpo da função
    // código JavaScript
    return; // ou return valor ==> ambos opcionais
}

function calculaDistancia(x,y) {
    var distancia = Math.sqrt(x*x + y*y);
    return distancia;
}

// primeiro ponto
var x1 = 8;
var y1 = 7

// segundo ponto
var x2 = 5;
var y2 = 2;

// calculo das distâncias
var dist1 = calculaDistancia(x1, y1);
var dist2 = calculaDistancia(x2, y2);

// exibe a informação
if(dist1 > dist2) {
    console.log('O 1o ponto está mais longe');
} else if(dist1 < dist2) {
    console.log('O 2o ponto está mais longe');
} else {
    console.log('Os pontos estão equidistantes');
}


