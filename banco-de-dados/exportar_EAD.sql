--
-- Arquivo gerado com SQLiteStudio v3.4.4 em qui fev 22 21:35:22 2024
--
-- Codificação de texto usada: ISO-8859-1
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Tabela: ALUNO
DROP TABLE IF EXISTS ALUNO;

CREATE TABLE IF NOT EXISTS ALUNO (
    MATRICULA            INTEGER    CONSTRAINT ALUNO_CHAVE_PRIMARIA PRIMARY KEY AUTOINCREMENT
                                    CONSTRAINT MATRICULA_OBRIGATORIA NOT NULL,
    NOME                 TEXT (100) CONSTRAINT NOME_OBRIGATORIO NOT NULL,
    ENDERECO_NUMERO      TEXT (15)  CONSTRAINT NUMERO_ENDERECO_OBRIGATORIO NOT NULL,
    ENDERECO_COMPLEMENTO TEXT (25),
    ENDERECO_CEP         INTEGER    CONSTRAINT CEP_ENDERECO_OBRIGATORIO NOT NULL
                                    CONSTRAINT CEP_CHAVE_ESTRANGEIRA REFERENCES CEP_CORREIOS (CEP) DEFERRABLE INITIALLY DEFERRED,
    DATA_NASCIMENTO      NUMERIC    CONSTRAINT DATA_NASCIMENTO_OBRIGATORIA NOT NULL,
    SEXO                 TEXT (25)  CONSTRAINT SEXO_OBRIGATORIO NOT NULL
                                    CONSTRAINT SEXO_INVALIDO CHECK (SEXO IN ('Feminino', 'Masculino', 'Prefiro não informar') ),
    E_MAIL               TEXT (100) CONSTRAINT E_MAIL_OBRIGATORIO NOT NULL
);

INSERT INTO ALUNO (
                      MATRICULA,
                      NOME,
                      ENDERECO_NUMERO,
                      ENDERECO_COMPLEMENTO,
                      ENDERECO_CEP,
                      DATA_NASCIMENTO,
                      SEXO,
                      E_MAIL
                  )
                  VALUES (
                      1,
                      'Antonio dos Santos',
                      '15',
                      NULL,
                      20541450,
                      19780715,
                      'Masculino',
                      'antony@meuemail.com'
                  );

INSERT INTO ALUNO (
                      MATRICULA,
                      NOME,
                      ENDERECO_NUMERO,
                      ENDERECO_COMPLEMENTO,
                      ENDERECO_CEP,
                      DATA_NASCIMENTO,
                      SEXO,
                      E_MAIL
                  )
                  VALUES (
                      2,
                      'Ingrid Belo',
                      '35',
                      NULL,
                      20541450,
                      19810921,
                      'Feminino',
                      'ingrid_belo@yahoo.com'
                  );

INSERT INTO ALUNO (
                      MATRICULA,
                      NOME,
                      ENDERECO_NUMERO,
                      ENDERECO_COMPLEMENTO,
                      ENDERECO_CEP,
                      DATA_NASCIMENTO,
                      SEXO,
                      E_MAIL
                  )
                  VALUES (
                      3,
                      'Eva Gomes',
                      '48',
                      NULL,
                      20541450,
                      19900104,
                      'Feminino',
                      'eva1234@click21.com.br'
                  );

INSERT INTO ALUNO (
                      MATRICULA,
                      NOME,
                      ENDERECO_NUMERO,
                      ENDERECO_COMPLEMENTO,
                      ENDERECO_CEP,
                      DATA_NASCIMENTO,
                      SEXO,
                      E_MAIL
                  )
                  VALUES (
                      4,
                      'Artur da Nobrega',
                      '123',
                      NULL,
                      20541450,
                      20011116,
                      'Masculino',
                      'tutuzinho111@novoemail.com'
                  );

INSERT INTO ALUNO (
                      MATRICULA,
                      NOME,
                      ENDERECO_NUMERO,
                      ENDERECO_COMPLEMENTO,
                      ENDERECO_CEP,
                      DATA_NASCIMENTO,
                      SEXO,
                      E_MAIL
                  )
                  VALUES (
                      5,
                      'Douglas Simões',
                      '443',
                      NULL,
                      21990123,
                      19981012,
                      'Masculino',
                      'dg_do_443@novoemail.com'
                  );


-- Tabela: CEP_COPIA
DROP TABLE IF EXISTS CEP_COPIA;

CREATE TABLE IF NOT EXISTS CEP_COPIA (
    CEP        INTEGER    CONSTRAINT CEP_CHAVE_PRIMARIA PRIMARY KEY
                          CONSTRAINT CEP_OBRIGATORIO NOT NULL,
    LOGRADOURO TEXT (100) CONSTRAINT LOGRADOURO_OBRIGATORIO NOT NULL,
    BAIRRO     TEXT (100) CONSTRAINT BAIRRO_OBRIGATORIO NOT NULL,
    CIDADE     TEXT (100) CONSTRAINT CIDADE_OBRIGATORIA NOT NULL,
    ESTADO     TEXT (100) CONSTRAINT ESTADO_OBRIGATORIO NOT NULL
);

INSERT INTO CEP_COPIA (
                          CEP,
                          LOGRADOURO,
                          BAIRRO,
                          CIDADE,
                          ESTADO
                      )
                      VALUES (
                          20541450,
                          'Rua dos Caramelos',
                          'Dogland',
                          'Rio de Janeiro',
                          'RJ'
                      );

INSERT INTO CEP_COPIA (
                          CEP,
                          LOGRADOURO,
                          BAIRRO,
                          CIDADE,
                          ESTADO
                      )
                      VALUES (
                          21453001,
                          'Avenida Faria Lima',
                          'Faria Lima',
                          'São Paulo',
                          'SP'
                      );

INSERT INTO CEP_COPIA (
                          CEP,
                          LOGRADOURO,
                          BAIRRO,
                          CIDADE,
                          ESTADO
                      )
                      VALUES (
                          21990123,
                          'Avenida Anchieta',
                          'Sapucaia',
                          'Macaé',
                          'RJ'
                      );

INSERT INTO CEP_COPIA (
                          CEP,
                          LOGRADOURO,
                          BAIRRO,
                          CIDADE,
                          ESTADO
                      )
                      VALUES (
                          23145090,
                          'Alameda dos Catados',
                          'Jujuriba',
                          'São Pedro da Aldeia',
                          'RJ'
                      );

INSERT INTO CEP_COPIA (
                          CEP,
                          LOGRADOURO,
                          BAIRRO,
                          CIDADE,
                          ESTADO
                      )
                      VALUES (
                          98999123,
                          'Ladeira do Pelourinho',
                          'Pelo',
                          'Salvador',
                          'BA'
                      );


-- Tabela: CEP_CORREIOS
DROP TABLE IF EXISTS CEP_CORREIOS;

CREATE TABLE IF NOT EXISTS CEP_CORREIOS (
    CEP        INTEGER    CONSTRAINT CEP_CHAVE_PRIMARIA PRIMARY KEY
                          CONSTRAINT CEP_OBRIGATORIO NOT NULL,
    LOGRADOURO TEXT (100) CONSTRAINT LOGRADOURO_OBRIGATORIO NOT NULL,
    BAIRRO     TEXT (100) CONSTRAINT BAIRRO_OBRIGATORIO NOT NULL,
    CIDADE     TEXT (100) CONSTRAINT CIDADE_OBRIGATORIA NOT NULL,
    ESTADO     TEXT (100) CONSTRAINT ESTADO_OBRIGATORIO NOT NULL
);

INSERT INTO CEP_CORREIOS (
                             CEP,
                             LOGRADOURO,
                             BAIRRO,
                             CIDADE,
                             ESTADO
                         )
                         VALUES (
                             20541450,
                             'Rua dos Caramelos',
                             'Dogland',
                             'Rio de Janeiro',
                             'RJ'
                         );

INSERT INTO CEP_CORREIOS (
                             CEP,
                             LOGRADOURO,
                             BAIRRO,
                             CIDADE,
                             ESTADO
                         )
                         VALUES (
                             21453001,
                             'Avenida Faria Lima',
                             'Faria Lima',
                             'São Paulo',
                             'SP'
                         );

INSERT INTO CEP_CORREIOS (
                             CEP,
                             LOGRADOURO,
                             BAIRRO,
                             CIDADE,
                             ESTADO
                         )
                         VALUES (
                             21990123,
                             'Avenida Anchieta',
                             'Sapucaia',
                             'Macaé',
                             'RJ'
                         );

INSERT INTO CEP_CORREIOS (
                             CEP,
                             LOGRADOURO,
                             BAIRRO,
                             CIDADE,
                             ESTADO
                         )
                         VALUES (
                             23145090,
                             'Alameda dos Catados',
                             'Jujuriba',
                             'São Pedro da Aldeia',
                             'RJ'
                         );

INSERT INTO CEP_CORREIOS (
                             CEP,
                             LOGRADOURO,
                             BAIRRO,
                             CIDADE,
                             ESTADO
                         )
                         VALUES (
                             98999123,
                             'Ladeira do Pelourinho',
                             'Pelo',
                             'Salvador',
                             'BA'
                         );


-- Tabela: CURSO
DROP TABLE IF EXISTS CURSO;

CREATE TABLE IF NOT EXISTS CURSO (
    CODIGO                INTEGER    CONSTRAINT CURSO_CHAVE_PRIMARIA PRIMARY KEY
                                     NOT NULL,
    NOME                  TEXT (100) CONSTRAINT NOME_OBRIGATORIO NOT NULL,
    OBJETIVO              TEXT (500) CONSTRAINT OBJETIVO_OBRIGATORIO NOT NULL,
    EMENTA                TEXT (500) CONSTRAINT EMENTA_OBRIGATORIA NOT NULL,
    IDIOMA                TEXT (25)  CONSTRAINT IDIOMA_OBRIGATORIO NOT NULL,
    CATEGORIA             TEXT (25)  CONSTRAINT CATEGORIA_OBRIGATORIA NOT NULL,
    CARGA_HORARIA         INTEGER    CONSTRAINT CARGA_HORARIA_OBRIGATORIA NOT NULL
                                     CONSTRAINT CHECK_CARGA_HORARIA CHECK (CARGA_HORARIA >= 4 AND 
                                                                           CARGA_HORARIA <= 80),
    DATA_INICIO_INSCRICAO INTEGER,
    DATA_FINAL_INSCRICAO  INTEGER
);

INSERT INTO CURSO (
                      CODIGO,
                      NOME,
                      OBJETIVO,
                      EMENTA,
                      IDIOMA,
                      CATEGORIA,
                      CARGA_HORARIA,
                      DATA_INICIO_INSCRICAO,
                      DATA_FINAL_INSCRICAO
                  )
                  VALUES (
                      1,
                      'INTRODUÇÃO BANCO DE DADOS',
                      'Apresentar os conceitos iniciais de banco de dados',
                      'Modelagem de Dados e Linguagem SQL Básica',
                      'PT_BR',
                      'INF',
                      32,
                      NULL,
                      NULL
                  );

INSERT INTO CURSO (
                      CODIGO,
                      NOME,
                      OBJETIVO,
                      EMENTA,
                      IDIOMA,
                      CATEGORIA,
                      CARGA_HORARIA,
                      DATA_INICIO_INSCRICAO,
                      DATA_FINAL_INSCRICAO
                  )
                  VALUES (
                      2,
                      'BANCO DE DADOS INTERMEDIÁRIO',
                      'Aprimorar conhecimento de Linguagem SQL Avançada e Extensão do DER',
                      'Consultas Analíticas, Índices Compostos',
                      'pt-br',
                      'INF',
                      32,
                      NULL,
                      NULL
                  );

INSERT INTO CURSO (
                      CODIGO,
                      NOME,
                      OBJETIVO,
                      EMENTA,
                      IDIOMA,
                      CATEGORIA,
                      CARGA_HORARIA,
                      DATA_INICIO_INSCRICAO,
                      DATA_FINAL_INSCRICAO
                  )
                  VALUES (
                      3,
                      'BANCO DE DADOS AVANÇADO',
                      'Formar Administradores de Banco de Dados',
                      'Particionamento, Paralelismo, Tuning, Backup e outros itens de Segurança',
                      'eng',
                      'INF',
                      60,
                      20240411,
                      NULL
                  );


-- Tabela: Inscrito_Em
DROP TABLE IF EXISTS Inscrito_Em;

CREATE TABLE IF NOT EXISTS Inscrito_Em (
    MATRICULA             INTEGER CONSTRAINT ALUNO_INSCRITO_EM_CHAVE_ESTRANGEIRA REFERENCES ALUNO (MATRICULA) 
                                  CONSTRAINT MATRICULA_INSCRITA_EM_OBRIGATORIA NOT NULL,
    CODIGO                INTEGER CONSTRAINT CODIGO_INSCRITO_EM_OBRIGATORIO NOT NULL
                                  CONSTRAINT CURSO_INSCRITO_EM_CHAVE_ESTRANGEIRA REFERENCES CURSO (CODIGO),
    DATA_INSCRICAO        INTEGER CONSTRAINT DATA_INSCRICAO_OBRIGATORIA NOT NULL,
    PERCENTUAL_PROGRESSO  NUMERIC,
    NOTA_FINAL            INTEGER,
    DATA_ULTIMA_ATIVIDADE INTEGER,
    CONSTRAINT INSCRITO_EM_CHAVE_PRIMARIA PRIMARY KEY (
        MATRICULA,
        CODIGO
    )
);

INSERT INTO Inscrito_Em (
                            MATRICULA,
                            CODIGO,
                            DATA_INSCRICAO,
                            PERCENTUAL_PROGRESSO,
                            NOTA_FINAL,
                            DATA_ULTIMA_ATIVIDADE
                        )
                        VALUES (
                            4,
                            2,
                            20240201,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO Inscrito_Em (
                            MATRICULA,
                            CODIGO,
                            DATA_INSCRICAO,
                            PERCENTUAL_PROGRESSO,
                            NOTA_FINAL,
                            DATA_ULTIMA_ATIVIDADE
                        )
                        VALUES (
                            5,
                            2,
                            20240203,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO Inscrito_Em (
                            MATRICULA,
                            CODIGO,
                            DATA_INSCRICAO,
                            PERCENTUAL_PROGRESSO,
                            NOTA_FINAL,
                            DATA_ULTIMA_ATIVIDADE
                        )
                        VALUES (
                            3,
                            1,
                            20240205,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO Inscrito_Em (
                            MATRICULA,
                            CODIGO,
                            DATA_INSCRICAO,
                            PERCENTUAL_PROGRESSO,
                            NOTA_FINAL,
                            DATA_ULTIMA_ATIVIDADE
                        )
                        VALUES (
                            2,
                            1,
                            20240203,
                            NULL,
                            NULL,
                            NULL
                        );

INSERT INTO Inscrito_Em (
                            MATRICULA,
                            CODIGO,
                            DATA_INSCRICAO,
                            PERCENTUAL_PROGRESSO,
                            NOTA_FINAL,
                            DATA_ULTIMA_ATIVIDADE
                        )
                        VALUES (
                            1,
                            1,
                            20240201,
                            NULL,
                            NULL,
                            NULL
                        );


-- Tabela: Palavra_Chave_Curso
DROP TABLE IF EXISTS Palavra_Chave_Curso;

CREATE TABLE IF NOT EXISTS Palavra_Chave_Curso (
    CODIGO        INTEGER   CONSTRAINT PALAVRA_CHAVE_CURSO_CHAVE_ESTRANGEIRA REFERENCES CURSO (CODIGO) 
                            CONSTRAINT CODIGO_CURSO_OBRIGATORIO NOT NULL,
    PALAVRA_CHAVE TEXT (25) CONSTRAINT PALAVRA_CHAVE_OBRIGATORIA NOT NULL,
    CONSTRAINT PALAVRA_CURSO_CHAVE_PRIMARIA PRIMARY KEY (
        CODIGO ASC,
        PALAVRA_CHAVE ASC
    )
);

INSERT INTO Palavra_Chave_Curso (
                                    CODIGO,
                                    PALAVRA_CHAVE
                                )
                                VALUES (
                                    3,
                                    'Performance'
                                );

INSERT INTO Palavra_Chave_Curso (
                                    CODIGO,
                                    PALAVRA_CHAVE
                                )
                                VALUES (
                                    3,
                                    'Segurança'
                                );

INSERT INTO Palavra_Chave_Curso (
                                    CODIGO,
                                    PALAVRA_CHAVE
                                )
                                VALUES (
                                    3,
                                    'BACKUP'
                                );

INSERT INTO Palavra_Chave_Curso (
                                    CODIGO,
                                    PALAVRA_CHAVE
                                )
                                VALUES (
                                    3,
                                    'DBA'
                                );

INSERT INTO Palavra_Chave_Curso (
                                    CODIGO,
                                    PALAVRA_CHAVE
                                )
                                VALUES (
                                    2,
                                    'OLAP'
                                );

INSERT INTO Palavra_Chave_Curso (
                                    CODIGO,
                                    PALAVRA_CHAVE
                                )
                                VALUES (
                                    2,
                                    'SQL'
                                );

INSERT INTO Palavra_Chave_Curso (
                                    CODIGO,
                                    PALAVRA_CHAVE
                                )
                                VALUES (
                                    1,
                                    'DER'
                                );

INSERT INTO Palavra_Chave_Curso (
                                    CODIGO,
                                    PALAVRA_CHAVE
                                )
                                VALUES (
                                    1,
                                    'MER'
                                );

INSERT INTO Palavra_Chave_Curso (
                                    CODIGO,
                                    PALAVRA_CHAVE
                                )
                                VALUES (
                                    1,
                                    'SQL'
                                );


-- Índice: IDX_CATEGORIA_CURSO
DROP INDEX IF EXISTS IDX_CATEGORIA_CURSO;

CREATE INDEX IF NOT EXISTS IDX_CATEGORIA_CURSO ON CURSO (
    CATEGORIA ASC
);


-- Trigger: INTERVALO_INSCRICAO
DROP TRIGGER IF EXISTS INTERVALO_INSCRICAO;
CREATE TRIGGER IF NOT EXISTS INTERVALO_INSCRICAO
                      BEFORE UPDATE OF DATA_FINAL_INSCRICAO
                          ON CURSO
                    FOR EACH ROW
BEGIN
    SELECT CASE WHEN NEW.DATA_FINAL_INSCRICAO IS NOT NULL AND 
                     NEW.DATA_FINAL_INSCRICAO < NEW.DATA_INICIO_INSCRICAO THEN RAISE(ABORT, "Data Final não pode ser anterior a Data Inicio") WHEN NEW.DATA_FINAL_INSCRICAO IS NULL AND 
                                                                                                                                                   NEW.DATA_INICIO_INSCRICAO IS NOT NULL THEN NEW.DATA_FINAL_INSCRICAO = NEW.DATA_INICIO_INSCRICAO END;
END;


-- Visualizar: DADOS_PESSOAIS_ALUNOS
DROP VIEW IF EXISTS DADOS_PESSOAIS_ALUNOS;
CREATE VIEW IF NOT EXISTS DADOS_PESSOAIS_ALUNOS AS
    SELECT MATRICULA,
           NOME,
           E_MAIL,
           (SUBSTR(CAST (DATA_NASCIMENTO AS TEXT), 7, 2) || '/' || SUBSTR(CAST (DATA_NASCIMENTO AS TEXT), 5, 2) || '/' || SUBSTR(CAST (DATA_NASCIMENTO AS TEXT), 1, 4) ) AS NASCIDO_EM
      FROM ALUNO;


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
