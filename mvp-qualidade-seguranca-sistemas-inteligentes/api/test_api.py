import pytest
import json
from app import app
from model import Session, Paciente

# To run: pytest -v test_api.py

@pytest.fixture
def client():
    """Configura o cliente de teste para a aplicação Flask"""
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

@pytest.fixture
def sample_patient_data():
    """Dados de exemplo para teste de paciente"""
    return {
        "name": "João Silva",
        "preg": 2,
        "plas": 120,
        "pres": 80,
        "skin": 35,
        "test": 180,
        "mass": 25.5,
        "pedi": 0.5,
        "age": 35
    }

def test_home_redirect(client):
    """Testa se a rota home redireciona para o frontend"""
    response = client.get('/')
    assert response.status_code == 302
    assert '/front/index.html' in response.location

def test_docs_redirect(client):
    """Testa se a rota docs redireciona para openapi"""
    response = client.get('/docs')
    assert response.status_code == 302
    assert '/openapi' in response.location

def test_get_pacientes_empty(client):
    """Testa a listagem de pacientes quando não há nenhum"""
    response = client.get('/pacientes')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert 'pacientes' in data
    assert isinstance(data['pacientes'], list)

def test_add_patient_prediction(client, sample_patient_data):
    """Testa a adição de um paciente com predição"""
    # Primeiro, vamos limpar qualquer paciente existente com o mesmo nome
    session = Session()
    existing_patient = session.query(Paciente).filter(Paciente.name == sample_patient_data['name']).first()
    if existing_patient:
        session.delete(existing_patient)
        session.commit()
    session.close()
    
    # Agora testamos a adição
    response = client.post('/paciente', 
                          data=json.dumps(sample_patient_data),
                          content_type='application/json')
    
    assert response.status_code == 200
    data = json.loads(response.data)
    
    # Verifica se o paciente foi criado com todas as informações
    assert data['name'] == sample_patient_data['name']
    assert data['preg'] == sample_patient_data['preg']
    assert data['plas'] == sample_patient_data['plas']
    assert data['pres'] == sample_patient_data['pres']
    assert data['skin'] == sample_patient_data['skin']
    assert data['test'] == sample_patient_data['test']
    assert data['mass'] == sample_patient_data['mass']
    assert data['pedi'] == sample_patient_data['pedi']
    assert data['age'] == sample_patient_data['age']
    
    # Verifica se a predição foi feita (outcome deve estar presente)
    assert 'outcome' in data
    assert data['outcome'] in [0, 1]  # Deve ser 0 (não diabético) ou 1 (diabético)

def test_add_duplicate_patient(client, sample_patient_data):
    """Testa a adição de um paciente duplicado"""
    # Primeiro adiciona o paciente
    client.post('/paciente', 
                data=json.dumps(sample_patient_data),
                content_type='application/json')
    
    # Tenta adicionar novamente
    response = client.post('/paciente', 
                          data=json.dumps(sample_patient_data),
                          content_type='application/json')
    
    assert response.status_code == 409
    data = json.loads(response.data)
    assert 'message' in data
    assert 'já existente' in data['message']

def test_get_patient_by_name(client, sample_patient_data):
    """Testa a busca de um paciente por nome"""
    # Primeiro adiciona o paciente
    client.post('/paciente', 
                data=json.dumps(sample_patient_data),
                content_type='application/json')
    
    # Busca o paciente por nome
    response = client.get(f'/paciente?name={sample_patient_data["name"]}')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert data['name'] == sample_patient_data['name']

def test_get_nonexistent_patient(client):
    """Testa a busca de um paciente que não existe"""
    response = client.get('/paciente?name=PacienteInexistente')
    assert response.status_code == 404
    data = json.loads(response.data)
    assert 'mesage' in data  # Note: há um typo no código original ("mesage" em vez de "message")

def test_delete_patient(client, sample_patient_data):
    """Testa a remoção de um paciente"""
    # Primeiro adiciona o paciente
    client.post('/paciente', 
                data=json.dumps(sample_patient_data),
                content_type='application/json')
    
    # Remove o paciente
    response = client.delete(f'/paciente?name={sample_patient_data["name"]}')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert 'message' in data
    assert 'removido com sucesso' in data['message']

def test_delete_nonexistent_patient(client):
    """Testa a remoção de um paciente que não existe"""
    response = client.delete('/paciente?name=PacienteInexistente')
    assert response.status_code == 404
    data = json.loads(response.data)
    assert 'message' in data

def test_prediction_edge_cases(client):
    """Testa casos extremos para predição"""
    # Teste com valores mínimos
    min_data = {
        "name": "Paciente Minimo",
        "preg": 0,
        "plas": 0,
        "pres": 0,
        "skin": 0,
        "test": 0,
        "mass": 0.0,
        "pedi": 0.0,
        "age": 21
    }
    
    response = client.post('/paciente', 
                          data=json.dumps(min_data),
                          content_type='application/json')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert 'outcome' in data
    
    # Teste com valores máximos típicos
    max_data = {
        "name": "Paciente Maximo",
        "preg": 17,
        "plas": 199,
        "pres": 122,
        "skin": 99,
        "test": 846,
        "mass": 67.1,
        "pedi": 2.42,
        "age": 81
    }
    
    response = client.post('/paciente', 
                          data=json.dumps(max_data),
                          content_type='application/json')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert 'outcome' in data

def cleanup_test_patients():
    """Limpa pacientes de teste do banco"""
    session = Session()
    test_patients = session.query(Paciente).filter(
        Paciente.name.in_(['João Silva', 'Paciente Minimo', 'Paciente Maximo'])
    ).all()
    
    for patient in test_patients:
        session.delete(patient)
    session.commit()
    session.close()

# Executa limpeza após os testes
def test_cleanup():
    """Limpa dados de teste"""
    cleanup_test_patients()
