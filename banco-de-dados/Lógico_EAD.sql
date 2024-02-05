/* Lógico_EAD: */


CREATE TABLE CEP_CORREIOS (
    CEP INTEGER PRIMARY KEY UNIQUE,
    Logradouro VARCHAR,
    Bairro VARCHAR,
    Cidade VARCHAR,
    UF VARCHAR
);

CREATE TABLE ALUNO (
    CEP INTEGER,
    Endereco_Numero VARCHAR,
    Endereco_Complemento VARCHAR,
    Sexo VARCHAR,
    Data_de_Nascimento INTEGER,
    Matricula INTEGER PRIMARY KEY,
    Nome VARCHAR,
    e_mail VARCHAR, 
	CONSTRAINT FK_ALUNO_2 FOREIGN KEY (CEP) REFERENCES CEP_CORREIOS (CEP)
);

CREATE TABLE Palavras_chave (
    Palavras_chave_PK INTEGER NOT NULL PRIMARY KEY,
    Palavras_chave VARCHAR
);

CREATE TABLE CURSO (
    Nome VARCHAR,
    FK_Palavras_chave_Palavras_chave_PK INTEGER,
    Codigo INTEGER PRIMARY KEY,
    Objetivo VARCHAR,
    Ementa VARCHAR,
    Idioma VARCHAR,
    Categoria VARCHAR,
    Carga_Horaria INTEGER,
    Data_Inicio_Inscricao INTEGER,
    Data_Final_Inscricao INTEGER, 
	CONSTRAINT FK_CURSO_2 FOREIGN KEY (FK_Palavras_chave_Palavras_chave_PK) REFERENCES Palavras_chave (Palavras_chave_PK)
);

CREATE TABLE Inscrito_Em (
    fk_ALUNO_Matricula INTEGER,
    fk_CURSO_Codigo INTEGER,
    Data_de_Inscricao INTEGER,
    Data_Ultima_Atividade INTEGER,
    Percentual_de_Progresso REAL,
    Nota_Final INTEGER,
    PRIMARY KEY (fk_ALUNO_Matricula, fk_CURSO_Codigo), 
	CONSTRAINT FK_Inscrito_Em_1 FOREIGN KEY (fk_ALUNO_Matricula) REFERENCES ALUNO (Matricula), 
	CONSTRAINT FK_Inscrito_Em_2 FOREIGN KEY (fk_CURSO_Codigo) REFERENCES CURSO (Codigo)
);

 
