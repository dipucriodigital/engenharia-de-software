import numpy as np
import pickle

class Pipeline:
    
    def carrega_pipeline(path):
        """Carregamos o pipeline construindo durante a fase de treinamento
        """
        
        with open(path, 'rb') as file:
             pipeline = pickle.load(file)
        return pipeline