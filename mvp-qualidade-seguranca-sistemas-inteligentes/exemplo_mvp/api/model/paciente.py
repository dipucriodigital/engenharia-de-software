from sqlalchemy import Column, String, Integer, DateTime, Float
from sqlalchemy.orm import relationship
from datetime import datetime
from typing import Union

from  model import Base

# colunas = Pregnancies,Glucose,BloodPressure,SkinThickness,test,BMI,DiabetesPedigreeFunction,Age,Outcome

class Paciente(Base):
    __tablename__ = 'pacientes'
    
    id = Column(Integer, primary_key=True)
    name= Column("Name", String(50))
    preg = Column("Pregnacies", Integer)
    plas = Column("Glucose", Integer)
    pres = Column("BloodPressure", Integer)
    skin = Column("SkinThickness", Integer)
    test = Column("Insulin", Integer)
    mass = Column("BMI", Float)
    pedi = Column("DiabetesPedigreeFunction", Float)
    age = Column("Age", Integer)
    outcome = Column("Diagnostic", Integer, nullable=True)
    data_insercao = Column(DateTime, default=datetime.now())
    
    def __init__(self, preg:int, plas:int, pres:int, name:str,
                 skin:int, test:int, mass:float, 
                 pedi:float, age:int, outcome:int, 
                 data_insercao:Union[DateTime, None] = None):
        """
        Cria um Paciente

        Arguments:
        name: nome do paciente
            preg: número de gestações
            plas: concentração de glicose
            pres: pressão sanguínea
            skin: espessura da pele
            test: insulina
            mass: índice de massa corporal
            pedi: função pedigree
            age: idade
            outcome: diagnóstico
            data_insercao: data de quando o paciente foi inserido à base
        """
        self.name=name
        self.preg = preg
        self.plas = plas
        self.pres = pres
        self.skin = skin
        self.test = test
        self.mass = mass
        self.pedi = pedi
        self.age = age
        self.outcome = outcome

        # se não for informada, será o data exata da inserção no banco
        if data_insercao:
            self.data_insercao = data_insercao