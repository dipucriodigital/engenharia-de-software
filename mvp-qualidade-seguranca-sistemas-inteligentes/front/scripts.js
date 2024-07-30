/*
  --------------------------------------------------------------------------------------
  Função para obter a lista existente do servidor via requisição GET
  --------------------------------------------------------------------------------------
*/
const getList = async () => {
  let url = 'http://127.0.0.1:5000/pacientes';
  fetch(url, {
    method: 'get',
  })
    .then((response) => response.json())
    .then((data) => {
      data.pacientes.forEach(item => insertList(item.name, 
                                                item.preg, 
                                                item.plas,
                                                item.pres,
                                                item.skin,
                                                item.test,
                                                item.mass,
                                                item.pedi,
                                                item.age,
                                                item.outcome
                                              ))
    })
    .catch((error) => {
      console.error('Error:', error);
    });
}

/*
  --------------------------------------------------------------------------------------
  Chamada da função para carregamento inicial dos dados
  --------------------------------------------------------------------------------------
*/
getList()




/*
  --------------------------------------------------------------------------------------
  Função para colocar um item na lista do servidor via requisição POST
  --------------------------------------------------------------------------------------
*/
const postItem = async (inputPatient, inputPreg, inputPlas,
                        inputPres, inputSkin, inputTest, 
                        inputMass, inputPedi, inputAge) => {
    
  const formData = new FormData();
  formData.append('name', inputPatient);
  formData.append('preg', inputPreg);
  formData.append('plas', inputPlas);
  formData.append('pres', inputPres);
  formData.append('skin', inputSkin);
  formData.append('test', inputTest);
  formData.append('mass', inputMass);
  formData.append('pedi', inputPedi);
  formData.append('age', inputAge);

  let url = 'http://127.0.0.1:5000/paciente';
  fetch(url, {
    method: 'post',
    body: formData
  })
    .then((response) => response.json())
    .catch((error) => {
      console.error('Error:', error);
    });
}


/*
  --------------------------------------------------------------------------------------
  Função para criar um botão close para cada item da lista
  --------------------------------------------------------------------------------------
*/
const insertDeleteButton = (parent) => {
  let span = document.createElement("span");
  let txt = document.createTextNode("\u00D7");
  span.className = "close";
  span.appendChild(txt);
  parent.appendChild(span);
}

/*
  --------------------------------------------------------------------------------------
  Função para remover um item da lista de acordo com o click no botão close
  --------------------------------------------------------------------------------------
*/
const removeElement = () => {
  let close = document.getElementsByClassName("close");
  // var table = document.getElementById('myTable');
  let i;
  for (i = 0; i < close.length; i++) {
    close[i].onclick = function () {
      let div = this.parentElement.parentElement;
      const nomeItem = div.getElementsByTagName('td')[0].innerHTML
      if (confirm("Você tem certeza?")) {
        div.remove()
        deleteItem(nomeItem)
        alert("Removido!")
      }
    }
  }
}

/*
  --------------------------------------------------------------------------------------
  Função para deletar um item da lista do servidor via requisição DELETE
  --------------------------------------------------------------------------------------
*/
const deleteItem = (item) => {
  console.log(item)
  let url = 'http://127.0.0.1:5000/paciente?name='+item;
  fetch(url, {
    method: 'delete'
  })
    .then((response) => response.json())
    .catch((error) => {
      console.error('Error:', error);
    });
}

/*
  --------------------------------------------------------------------------------------
  Função para adicionar um novo item com nome, quantidade e valor 
  --------------------------------------------------------------------------------------
*/
const newItem = async () => {
  let inputPatient = document.getElementById("newInput").value;
  let inputPreg = document.getElementById("newPreg").value;
  let inputPlas = document.getElementById("newPlas").value;
  let inputPres = document.getElementById("newPres").value;
  let inputSkin = document.getElementById("newSkin").value;
  let inputTest = document.getElementById("newTest").value;
  let inputMass = document.getElementById("newMass").value;
  let inputPedi = document.getElementById("newPedi").value;
  let inputAge = document.getElementById("newAge").value;

  // Verifique se o nome do produto já existe antes de adicionar
  const checkUrl = `http://127.0.0.1:5000/pacientes?nome=${inputPatient}`;
  fetch(checkUrl, {
    method: 'get'
  })
    .then((response) => response.json())
    .then((data) => {
      if (data.pacientes && data.pacientes.some(item => item.name === inputPatient)) {
        alert("O paciente já está cadastrado.\nCadastre o paciente com um nome diferente ou atualize o existente.");
      } else if (inputPatient === '') {
        alert("O nome do paciente não pode ser vazio!");
      } else if (isNaN(inputPreg) || isNaN(inputPlas) || isNaN(inputPres) || isNaN(inputSkin) || isNaN(inputTest) || isNaN(inputMass) || isNaN(inputPedi) || isNaN(inputAge)) {
        alert("Esse(s) campo(s) precisam ser números!");
      } else {
        insertList(inputPatient, inputPreg, inputPlas, inputPres, inputSkin, inputTest, inputMass, inputPedi, inputAge);
        postItem(inputPatient, inputPreg, inputPlas, inputPres, inputSkin, inputTest, inputMass, inputPedi, inputAge);
        alert("Item adicionado!");
      }
    })
    .catch((error) => {
      console.error('Error:', error);
    });
}


/*
  --------------------------------------------------------------------------------------
  Função para inserir items na lista apresentada
  --------------------------------------------------------------------------------------
*/
const insertList = (namePatient, preg, plas,pres, skin, test, mass, pedi, age, outcome) => {
  var item = [namePatient, preg, plas,pres, skin, test, mass, pedi, age, outcome];
  var table = document.getElementById('myTable');
  var row = table.insertRow();

  for (var i = 0; i < item.length; i++) {
    var cell = row.insertCell(i);
    cell.textContent = item[i];
  }

  var deleteCell = row.insertCell(-1);
  insertDeleteButton(deleteCell);


  document.getElementById("newInput").value = "";
  document.getElementById("newPreg").value = "";
  document.getElementById("newPlas").value = "";
  document.getElementById("newPres").value = "";
  document.getElementById("newSkin").value = "";
  document.getElementById("newTest").value = "";
  document.getElementById("newMass").value = "";
  document.getElementById("newPedi").value = "";
  document.getElementById("newAge").value = "";

  removeElement();
}