


document.getElementById("idyButton").addEventListener("click", minhaFuncao);
  
function minhaFuncao() {

}


document.getElementById("idButton").onclick = function() {
    alert("O botão foi clicado!");
};

window.onload = function () {
    document.getElementById('start').addEventListener('click', start);
    document.getElementById('idGramado').addEventListener('mousedown', marteloBaixo);
    document.getElementById('idGramado').addEventListener('mouseup', marteloCima);
    document.getElementById('buraco0').addEventListener('click', martelada);
    document.getElementById('buraco1').addEventListener('click', martelada);
    document.getElementById('buraco2').addEventListener('click', martelada);
    document.getElementById('buraco3').addEventListener('click', martelada);
    document.getElementById('buraco4').addEventListener('click', martelada);
};


