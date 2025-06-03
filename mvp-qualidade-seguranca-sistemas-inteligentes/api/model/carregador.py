import pandas as pd

class Carregador:

    def __init__(self):
        """Inicializa o carregador"""
        pass

    def carregar_dados(self, url: str, atributos: list):
        """ Carrega e retorna um DataFrame. Há diversos parâmetros 
        no read_csv que poderiam ser utilizados para dar opções 
        adicionais.
        """
        
        return pd.read_csv(url, names=atributos, header=0,
                           skiprows=0, delimiter=',') # Esses dois parâmetros são próprios para uso deste dataset. Talvez você não precise utilizar
    