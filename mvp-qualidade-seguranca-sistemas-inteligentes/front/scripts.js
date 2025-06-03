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
  Função para limpar a tabela antes de recarregar os dados
  --------------------------------------------------------------------------------------
*/
const clearTable = () => {
  var table = document.getElementById('myTable');
  // Remove todas as linhas exceto o cabeçalho (primeira linha)
  while(table.rows.length > 1) {
    table.deleteRow(1);
  }
}

/*
  --------------------------------------------------------------------------------------
  Função para recarregar a lista completa do servidor
  --------------------------------------------------------------------------------------
*/
const refreshList = async () => {
  clearTable();
  await getList();
}

/*
  --------------------------------------------------------------------------------------
  Chamada da função para carregamento inicial dos dados
  --------------------------------------------------------------------------------------
*/
// Carrega a lista apenas uma vez quando a página é carregada
document.addEventListener('DOMContentLoaded', function() {
  getList();
});




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
  return fetch(url, {
    method: 'post',
    body: formData
  })
    .then((response) => response.json())
    .then((data) => {
      return data; // Retorna os dados do paciente com o diagnóstico
    })
    .catch((error) => {
      console.error('Error:', error);
      throw error;
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
const newItem = async (event) => {
  event.preventDefault();

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
    .then(async (data) => {
      if (data.pacientes && data.pacientes.some(item => item.name === inputPatient)) {
        alert("O paciente já está cadastrado.\nCadastre o paciente com um nome diferente ou atualize o existente.");
      } else if (inputPatient === '') {
        alert("O nome do paciente não pode ser vazio!");
      } else if (isNaN(inputPreg) || isNaN(inputPlas) || isNaN(inputPres) || isNaN(inputSkin) || isNaN(inputTest) || isNaN(inputMass) || isNaN(inputPedi) || isNaN(inputAge)) {
        alert("Esse(s) campo(s) precisam ser números!");
      } else {
        try {
          // Envia os dados para o servidor e aguarda a resposta com o diagnóstico
          const result = await postItem(inputPatient, inputPreg, inputPlas, inputPres, inputSkin, inputTest, inputMass, inputPedi, inputAge);
            // Limpa o formulário
          document.getElementById("newInput").value = "";
          document.getElementById("newPreg").value = "";
          document.getElementById("newPlas").value = "";
          document.getElementById("newPres").value = "";
          document.getElementById("newSkin").value = "";
          document.getElementById("newTest").value = "";
          document.getElementById("newMass").value = "";
          document.getElementById("newPedi").value = "";
          document.getElementById("newAge").value = "";
          
          // Recarrega a lista completa para mostrar o novo paciente com o diagnóstico
          await refreshList();
          
          // Mostra mensagem de sucesso com o diagnóstico
          const diagnostico = result.outcome === 1 ? "DIABÉTICO" : "NÃO DIABÉTICO";
          alert(`Paciente adicionado com sucesso!\nDiagnóstico: ${diagnostico}`);
          
          // Scroll para a tabela para mostrar o novo resultado
          document.querySelector('.items').scrollIntoView({ 
            behavior: 'smooth', 
            block: 'center' 
          });
          
        } catch (error) {
          console.error('Erro ao adicionar paciente:', error);
          alert("Erro ao adicionar paciente. Tente novamente.");
        }
      }
    })
    .catch((error) => {
      console.error('Error:', error);
      alert("Erro ao verificar paciente existente. Tente novamente.");
    });
}


/*
  --------------------------------------------------------------------------------------
  Função para inserir items na lista apresentada
  --------------------------------------------------------------------------------------
*/
const insertList = (namePatient, preg, plas, pres, skin, test, mass, pedi, age, outcome) => {
  var item = [namePatient, preg, plas, pres, skin, test, mass, pedi, age];
  var table = document.getElementById('myTable');
  var row = table.insertRow();

  // Insere as células com os dados do paciente
  for (var i = 0; i < item.length; i++) {
    var cell = row.insertCell(i);
    cell.textContent = item[i];
  }

  // Insere a célula do diagnóstico com styling
  var diagnosticCell = row.insertCell(item.length);
  const diagnosticText = outcome === 1 ? "DIABÉTICO" : "NÃO DIABÉTICO";
  diagnosticCell.textContent = diagnosticText;
  
  // Aplica styling baseado no diagnóstico
  if (outcome === 1) {
    diagnosticCell.className = "diagnostic-positive";
  } else {
    diagnosticCell.className = "diagnostic-negative";
  }

  // Insere o botão de deletar
  var deleteCell = row.insertCell(-1);
  insertDeleteButton(deleteCell);

  removeElement();
}