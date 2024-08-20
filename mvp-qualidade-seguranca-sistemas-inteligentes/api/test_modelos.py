from model import *

# To run: pytest -v test_modelos.py

# Instanciação das Classes
carregador = Carregador()
modelo = Model()
avaliador = Avaliador()

# Parâmetros    
url_dados = "./MachineLearning/data/test_dataset_diabetes.csv"
colunas = ['preg', 'plas', 'pres', 'skin', 'test', 'mass', 'pedi', 'age', 'class']

# Carga dos dados
dataset = Carregador.carregar_dados(url_dados, colunas)
array = dataset.values
X = array[:,0:-1]
y = array[:,-1]
    
# Método para testar o modelo de Regressão Logística a partir do arquivo correspondente
# O nome do método a ser testado necessita começar com "test_"
def test_modelo_lr():  
    # Importando o modelo de regressão logística
    lr_path = './MachineLearning/models/diabetes_lr.pkl'
    modelo_lr = Model.carrega_modelo(lr_path)

    # Obtendo as métricas da Regressão Logística
    acuracia_lr = Avaliador.avaliar(modelo_lr, X, y)
    
    # Testando as métricas da Regressão Logística 
    # Modifique as métricas de acordo com seus requisitos
    assert acuracia_lr >= 0.78 
    # assert recall_lr >= 0.5 
    # assert precisao_lr >= 0.5 
    # assert f1_lr >= 0.5 
 
# Método para testar modelo KNN a partir do arquivo correspondente
def test_modelo_knn():
    # Importando modelo de KNN
    knn_path = './MachineLearning/models/diabetes_knn.pkl'
    modelo_knn = Model.carrega_modelo(knn_path)

    # Obtendo as métricas do KNN
    acuracia_knn = Avaliador.avaliar(modelo_knn, X, y)
    
    # Testando as métricas do KNN
    # Modifique as métricas de acordo com seus requisitos
    assert acuracia_knn >= 0.78
    # assert recall_knn >= 0.5 
    # assert precisao_knn >= 0.5 
    # assert f1_knn >= 0.5 
    
# Método para testar pipeline Random Forest a partir do arquivo correspondente
def test_modelo_rf():
    # Importando pipeline de Random Forest
    rf_path = './MachineLearning/pipelines/rf_diabetes_pipeline.pkl'
    modelo_rf = Pipeline.carrega_pipeline(rf_path)

    # Obtendo as métricas do Random Forest
    acuracia_rf = Avaliador.avaliar(modelo_rf, X, y)
    
    # Testando as métricas do Random Forest
    # Modifique as métricas de acordo com seus requisitos
    assert acuracia_rf >= 0.78
    # assert recall_rf >= 0.5 
    # assert precisao_rf >= 0.5 
    # assert f1_rf >= 0.5
    

