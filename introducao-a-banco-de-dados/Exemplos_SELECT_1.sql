.headers on

/* Recupera todas as linha de uma tabela */ 

SELECT * 
FROM ALUNO;

/* Recupera as linha de uma tabela que correspondam ao filtro de uma coluna */ 

SELECT *
FROM CEP_CORREIOS
WHERE CEP = 21990555;

/* Recupera as linha de uma tabela que correspondam ao filtro de duas colunas  */ 

SELECT *
FROM ALUNO 
WHERE NOME = 'Douglas Simões' AND E_MAIL = 'dg_do_443@novoemail.com';

/* Recupera as linha de uma tabela que correspondam ao filtro de duas colunas  */ 

SELECT *
FROM ALUNO 
WHERE ENDERECO_CEP = 20541450 OR ENDERECO_CEP = 21990123;

/* Recupera as linha de uma tabela que correspondam ao filtro de uma lista de valores para uma coluna */ 

SELECT BAIRRO, CIDADE
FROM CEP_CORREIOS
WHERE UF IN ('RJ','SP');

/* Recupera as linha de uma tabela que correspondam ao filtro de uma coluna que não foi preenchida  */ 

SELECT ENDERECO_COMPLEMENTO 
FROM ALUNO 
WHERE ENDERECO_COMPLEMENTO IS NOT NULL;

/* Recupera as linha de uma tabela que correspondam ao filtro de um intervalo de valores para uma coluna  */ 

SELECT *
FROM ALUNO 
WHERE ENDERECO_NUMERO BETWEEN 100 AND 200;

/* Recupera os valores distintos (não duplicados) para uma coluna  */ 

SELECT DISTINCT(SEXO)
FROM ALUNO;

/* Recupera a quantidade de linha cujo valor da coluna  está preenchido */ 

SELECT COUNT(MATRICULA)
FROM ALUNO;

/* Recupera o maior valor de uma coluna */ 

SELECT MATRICULA, MAX(DATA_NASCIMENTO)
FROM ALUNO;

/* Recupera o menor valor de uma coluna */ 

SELECT MATRICULA, MIN(DATA_NASCIMENTO)
FROM ALUNO;

/* Recupera uma coluna e preenche com valor definiddo quando não estiver preenchida */ 

SELECT MATRICULA, ENDERECO_CEP, ENDERECO_NUMERO, COALESCE(ENDERECO_COMPLEMENTO, 'SEM COMPLEMENTO') AS COMPLEMENTO_ENDERECO
FROM ALUNO;

/* Recupera a quantidade de valores distintos para uma coluna */ 

SELECT COUNT(DISTINCT(UF)) AS ESTADOS_QTD
FROM CEP_CORREIOS;

/* Recupera uma parte de uma coluna que é string */ 

SELECT MATRICULA, SUBSTR(CAST(DATA_NASCIMENTO AS TEXT),1,4) AS ANO, SUBSTR(CAST(DATA_NASCIMENTO AS TEXT),5,2) AS MES, SUBSTR(CAST(DATA_NASCIMENTO AS TEXT),7,2) AS DIA
FROM ALUNO;

