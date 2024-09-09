/* NOT NULL: Impede que uma coluna aceite valores nulos, garantindo que cada registro tenha um valor para essa coluna. */

CREATE TABLE exemplo1 (
    id INT NOT NULL,
    nome TEXT(50) NOT NULL
);

/* UNIQUE: Garante que todos os valores em uma coluna (ou em um conjunto de colunas) sejam únicos em toda a tabela */

CREATE TABLE exemplo2 (
    id INT UNIQUE,
    email TEXT(100) UNIQUE
);

/* PRIMARY KEY: Combina as restrições NOT NULL e UNIQUE. A coluna (ou conjunto de colunas) é uma chave primária da tabela quando ela é o identificador único para a Entidade ou Relacionamento. */

CREATE TABLE exemplo3 (
    id INT PRIMARY KEY,
    nome TEXT(50) NOT NULL
);

/* FOREIGN KEY: Define uma chave estrangeira, criando uma ligação entre duas tabelas. A coluna referenciada deve ser uma chave primária na tabela referenciada. */

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    descricao TEXT(50) NOT NULL
);

CREATE TABLE ordens (
    ordem_id INT PRIMARY KEY,
    produto_id INT,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

/* CHECK: Define uma condição que os valores em uma coluna devem atender. */

CREATE TABLE exemplo4 (
    idade INT CHECK (idade >= 18),
    salario DECIMAL(10, 2) CHECK (salario > 0)
);

/* DEFAULT: Especifica um valor padrão para uma coluna, que será usado quando nenhum valor é fornecido durante a inserção de dados. */

CREATE TABLE exemplo5 (
    status TEXT(10) DEFAULT 'ativo'
);
