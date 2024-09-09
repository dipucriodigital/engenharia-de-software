.echo on

/* Recupera linhas de uma tabela cujo valor de uma coluna corresponda a um dos valores de uma coluna de outra tabela */ 

SELECT *
FROM ALUNO
WHERE ENDERECO_CEP IN
(SELECT CEP FROM CEP_CORREIOS);

/* Recupera a quantidade de valores de uma coluna de uma tabela que não correspondem a um dos valores de uma coluna de outra tabela */ 

SELECT COUNT(CEP)
FROM CEP_CORREIOS
WHERE CEP NOT IN
(SELECT ENDERECO_CEP FROM ALUNO);

/* Remove linhas de uma tabela cujo valor de uma coluna corresponda a um dos valores de uma coluna de outra tabela */ 

DELETE FROM CEP_CORREIOS
WHERE CEP NOT IN
(SELECT ENDERECO_CEP FROM ALUNO);

/* Insere em uma tabela todas as linhas de outra tabela */ 

CREATE TABLE CEP_COPIA (
CEP INTEGER CONSTRAINT CEP_CHAVE_PRIMARIA PRIMARY KEY CONSTRAINT CEP_OBRIGATORIO NOT NULL,
LOGRADOURO TEXT (100) CONSTRAINT LOGRADOURO_OBRIGATORIO NOT NULL,
BAIRRO TEXT (100) CONSTRAINT BAIRRO_OBRIGATORIO NOT NULL,
CIDADE TEXT (100) CONSTRAINT CIDADE_OBRIGATORIA NOT NULL,
ESTADO TEXT (100) CONSTRAINT ESTADO_OBRIGATORIO NOT NULL
);

INSERT INTO CEP_COPIA
SELECT * FROM CEP_CORREIOS;

/* Recupera a quantidade de linhas de uma tabela que não correspondem a um dos valores de uma coluna de outra tabela */ 

SELECT COUNT(*)
FROM CURSO AS c
WHERE NOT EXISTS
(SELECT *
FROM Inscrito_Em AS i
WHERE c.CODIGO = i.CODIGO);

