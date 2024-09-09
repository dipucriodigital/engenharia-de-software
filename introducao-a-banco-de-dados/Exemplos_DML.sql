PRAGMA foreign_keys = ON;
.changes on

/* Insert COM especificação das colunas */

INSERT INTO CEP_CORREIOS (CEP, LOGRADOURO, BAIRRO, CIDADE, UF)
VALUES (20541450, 'Rua Doutor X', 'Maravilha', 'Tudolandia', 'SP'); 

INSERT INTO CEP_CORREIOS (CEP, LOGRADOURO, BAIRRO, CIDADE, UF)
VALUES (21990123, 'Praça Nossa Paz', 'Copacabana', 'Rio de Janeiro', 'RJ'); 

INSERT INTO CEP_CORREIOS (CEP, LOGRADOURO, BAIRRO, CIDADE, UF)
VALUES (20541469, 'Avenida Pio V', 'Centro', 'Paraisópolis', 'SP'); 

INSERT INTO ALUNO (NOME, DATA_NASCIMENTO, SEXO, ENDERECO_CEP, ENDERECO_NUMERO, E_MAIL)
VALUES ('Artur da Nobrega', 20011116, 'Masculino', 20541450, '123', 'tutuzinho111@novoemail.com'); 

/* Insert SEM especificação das colunas, segue a ordem das colunas na criação da tabela */

INSERT INTO ALUNO 
VALUES (NULL, 'Douglas Simões', '443', ' ', 20541450, 19981012, 'Masculino',  'dg_do_443@novoemail.com'); 

INSERT INTO ALUNO 
VALUES (5, 'Pedro Almeida', '449', 'bloco A, apto 702 ', 20541450, 19981012, 'Masculino',  'pa449@gmail.com'); 

INSERT INTO ALUNO 
VALUES (7, 'Julieta Robrigues', '77', ' apto 303', 20541469, 19931012, 'Feminino',  'jojotody@novoemail.com'); 

/* Insert com Falha na constraint de UNIQUE */

INSERT INTO ALUNO 
VALUES (NULL, 'Eva Gomes', '123', 'casa 01 ', 20541469, 19931012, 'Feminino',  'jojotody@novoemail.com'); 

INSERT INTO ALUNO 
VALUES (NULL, 'Eva Gomes', '123', 'casa 01 ', 20541469, 19931012, 'Feminino',  'evinha@yahoo.com'); 

/* Insert com Falha na constraint de CHECK */

INSERT INTO ALUNO (NOME, DATA_NASCIMENTO, SEXO, ENDERECO_CEP, ENDERECO_NUMERO, E_MAIL)
VALUES ('Julia Ortega', 19900706, 'Nenhum', 20541450, '654', 'juju_ort@dominiopublico.com.br'); 

/* Mensagem: [15:55:09] Erro ao executar consulta SQL no banco de dados "ead": CHECK constraint failed: SEXO_INVALIDO */

/* Insert com Falha por falta de uma coluna */

INSERT INTO ALUNO 
VALUES ('Marcos Damião', '771', 'bloco B apto 201', 20541450, 19940421, 'Masculino',  'damiao_marcos@oglobo.com'); 

/* Mensagem: [15:58:52] Erro ao executar consulta SQL no banco de dados 'ead': table ALUNO has 8 columns but 7 values were supplied */

/* Update de uma coluna usando a chave da tabela - atualiza somente uma linha, se a chave existir */

UPDATE ALUNO
SET ENDERECO_CEP = 21990123
WHERE MATRICULA = 5;

/* Update com Falha na constraint de CHECK */

UPDATE ALUNO
SET E_MAIL = NULL
WHERE MATRICULA = 5;

/* Mensagem:[16:28:07] Erro ao executar consulta SQL no banco de dados 'ead': NOT NULL constraint failed: ALUNO.E_MAIL */

/* Update com Falha na constraint de FOREIGN KEY */

UPDATE ALUNO
SET ENDERECO_CEP = 21990555
WHERE NOME = 'Eva Gomes';

/* Mensagem: [16:33:15] Erro ao executar consulta SQL no banco de dados 'ead': FOREIGN KEY constraint failed */

/* Update de duas colunas usando uma coluna não chave - pode atualizar mais de uma linha */

UPDATE ALUNO
SET ENDERECO_CEP = 21990123, SEXO = 'Prefiro não informar'
WHERE NOME = 'Julieta Robrigues';

/* Update de uma coluna sem cláusula WHERE - atualiza toda a tabela */

SELECT ENDERECO_COMPLEMENTO
FROM ALUNO;

UPDATE ALUNO
SET ENDERECO_COMPLEMENTO = NULL;

/* Delete com cláusula WHERE usando uma coluna não chave - pode apagar mais de uma linha */

SELECT * FROM ALUNO
WHERE E_MAIL = 'jojotody@novoemail.com';

DELETE FROM ALUNO
WHERE E_MAIL = 'jojotody@novoemail.com';

/* Delete sem cláusula WHERE - deleta toda a tabela MAS aqui houve falha na constraint de FOREIGN KEY */

DELETE FROM CEP_CORREIOS;

/* Mensagem: [17:13:09] Erro ao executar consulta SQL no banco de dados 'ead': FOREIGN KEY constraint failed */
