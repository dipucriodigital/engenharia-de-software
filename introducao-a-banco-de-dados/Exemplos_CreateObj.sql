.changes off

/* Cria uma visão que recupera quatro colunas de uma tabela, a quarta coluna é gerada em tempo de consulta */ 

CREATE VIEW DADOS_PESSOAIS_ALUNOS AS
SELECT MATRICULA, NOME, E_MAIL,
(SUBSTR(CAST(DATA_NASCIMENTO AS TEXT),7,2) || '/' || SUBSTR(CAST(DATA_NASCIMENTO AS TEXT),5,2) || '/' || SUBSTR(CAST(DATA_NASCIMENTO AS TEXT),1,4)) AS NASCIDO_EM
FROM ALUNO;

/* Recupera todas as linhas que correspondam a visão */ 

SELECT * 
FROM DADOS_PESSOAIS_ALUNOS;

/* Cria um gatilho para verificar se a atualização de uma coluna está atendendo a regra de negócio */ 

CREATE TRIGGER INTERVALO_INSCRICAO BEFORE UPDATE OF DATA_FINAL_INSCRICAO 
ON CURSO FOR EACH ROW  
BEGIN 
    SELECT
        CASE
        WHEN NEW.DATA_FINAL_INSCRICAO IS NOT NULL AND 
             NEW.DATA_FINAL_INSCRICAO < NEW.DATA_INICIO_INSCRICAO THEN
            RAISE(ABORT, 'Data Final não pode ser anterior a Data Inicio')
        END;
END;

/* Tentativa de atualização que viole a regra de negócio */ 

UPDATE CURSO 
SET DATA_INICIO_INSCRICAO = 20240411, DATA_FINAL_INSCRICAO = 20240401
WHERE CODIGO = 2; 
/* MENSAGEM: [02:43:17] Erro ao executar consulta SQL no banco de dados 'ead': Data Final não pode ser anterior a Data Inicio */

/* Cria um índice em uma coluna */ 

CREATE INDEX IDX_CATEGORIA_CURSO ON CURSO (CATEGORIA);

