CREATE DATABASE wasabi;
USE wasabi;

CREATE TABLE cadFuncionario (
    cpfFunc INT PRIMARY KEY AUTO_INCREMENT,
    cnpj INT,
    nomeFunc VARCHAR(128),
    nicknameFunc VARCHAR(128),
    nascFunc DATE,
    telUser VARCHAR(13),
    emailUser VARCHAR(40) UNIQUE,
		CONSTRAINT chk_emailUser CHECK (emailUser LIKE '%@%.com'),
    senhaUser VARCHAR(40)
);

CREATE TABLE cadEmpresa (
	cnpj INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(128),
    nicknameEmpresa VARCHAR(128),
	cpfFuncionario VARCHAR(15) UNIQUE,
    telEmpresa VARCHAR(13),
    emailEmpresa VARCHAR(40),
		CONSTRAINT chk_emailEmpresa CHECK (emailEmpresa LIKE '%@%.com')
);

CREATE TABLE dadosArduino (
	idArduino INT PRIMARY KEY AUTO_INCREMENT,
    idColheita INT,
    qtdSensores INT,
		CONSTRAINT chk_qtdSensores CHECK (qtdSensores > 0),
    luminosidade_atual DECIMAL(4,2)
);

CREATE TABLE dadosSafra (
    idColheita INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(128),
    luminosidade_max DECIMAL(4,2),
    luminosidade_min DECIMAL(4,2),
    inicio_safra DATE,
    final_safra DATE
);

INSERT INTO cadFuncionario (cnpj, nomeFunc, nicknameFunc, nascFunc, telUser, emailUser, senhaUser) 
VALUES (12345678, 'João da Silva', 'joao_s', '1995-06-12', '11988887777', 'joao@email.com', 'senha123');

INSERT INTO cadFuncionario (cnpj, nomeFunc, nicknameFunc, nascFunc, telUser, emailUser, senhaUser) 
VALUES (87654321, 'Maria Oliveira', 'maria_o', '1990-04-22', '11977776666', 'maria@email.com', 'senha456');

INSERT INTO cadEmpresa (nomeEmpresa, nicknameEmpresa, cpfFuncionario, telEmpresa, emailEmpresa) 
VALUES ('AgroTech Ltda', 'agrotech', '12345678900', '1133334444', 'contato@agrotech.com');

INSERT INTO cadEmpresa (nomeEmpresa, nicknameEmpresa, cpfFuncionario, telEmpresa, emailEmpresa) 
VALUES ('Wasabi Farming', 'wasabi_farm', '98765432100', '1144445555', 'suporte@wafarm.com');

INSERT INTO dadosArduino (idColheita, qtdSensores, luminosidade_atual) 
VALUES (1, 5, 79.50);

INSERT INTO dadosArduino (idColheita, qtdSensores, luminosidade_atual) 
VALUES (2, 6, 70.20);

INSERT INTO dadosSafra (nomeEmpresa, luminosidade_max, luminosidade_min, inicio_safra, final_safra) 
VALUES ('AgroTech Ltda', 95.00, 60.00, '2025-03-01', '2026-09-01');

INSERT INTO dadosSafra (nomeEmpresa, luminosidade_max, luminosidade_min, inicio_safra, final_safra) 
VALUES ('Wasabi Farming', 90.00, 55.00, '2025-04-01', '2027-04-01');

SELECT nomeFunc AS 'Nome do funcionário' FROM cadFuncionario;
SELECT * FROM cadFuncionario WHERE nicknameFunc = 'joao_s';
SELECT nomeEmpresa, emailEmpresa FROM cadEmpresa;
SELECT * FROM cadEmpresa WHERE nicknameEmpresa = 'wasabi_farm';
SELECT idArduino, luminosidade_atual FROM dadosArduino;
SELECT * FROM dadosArduino WHERE idColheita = 1;
SELECT nomeEmpresa, inicio_safra, final_safra FROM dadosSafra;
SELECT * FROM dadosSafra WHERE luminosidade_max > 92.00;
