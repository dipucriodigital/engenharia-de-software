import numpy as np
import pickle
import joblib
from model.preprocessador import PreProcessador
class Model:
    
    # TODO: Guardar model como atributo e o preditor receber as entradas.
    # TODO: preditor -> realiza_predicao
    
    def carrega_modelo(path):
        """Dependendo se o final for .pkl ou .joblib, carregamos de uma forma ou de outra
        """
        
        if path.endswith('.pkl'):
            with open(path, 'rb') as file:
                model = pickle.load(file)
        else:
            raise Exception('Formato de arquivo não suportado')
        return model
    
    def preditor(model, X_input):
        """Realiza a predição de um paciente com base no modelo treinado
        """
        diagnosis = model.predict(X_input)
        return diagnosis