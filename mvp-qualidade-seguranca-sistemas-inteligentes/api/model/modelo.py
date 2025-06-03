import pickle

class Model:
    
    def __init__(self):
        """Inicializa o modelo"""
        self.model = None
    
    def carrega_modelo(self, path):
        """Dependendo se o final for .pkl ou .joblib, carregamos de uma forma ou de outra
        """
        
        if path.endswith('.pkl'):
            with open(path, 'rb') as file:
                self.model = pickle.load(file)
        else:
            raise Exception('Formato de arquivo não suportado')
        return self.model
    
    def preditor(self, X_input):
        """Realiza a predição de um paciente com base no modelo treinado
        """
        if self.model is None:
            raise Exception('Modelo não foi carregado. Use carrega_modelo() primeiro.')
        diagnosis = self.model.predict(X_input)
        return diagnosis