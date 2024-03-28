onload = function () {
    document.getElementById('start').addEventListener('click', start);
    document.getElementById('idGramado').addEventListener('mousedown', marteloBaixo);
    document.getElementById('idGramado').addEventListener('mouseup', marteloCima);
    for(var i=0;i<5; i++) {
        document.getElementById('buraco' + i).addEventListener('click', martelada);
    }
};
