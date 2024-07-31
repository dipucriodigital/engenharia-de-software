import numpy as np
import pickle

class Pipeline:
    
    def carrega_pipeline(path):
        """Carregamos o pipeline construindo durante a fase de treinamento
        """
        
        if path.endswith('.pkl'):
            with open(path, 'rb') as file:
                pipeline = pickle.load(file)
        else:
            raise Exception('Formato de arquivo não suportado')
        return pipeline