--[M205] Ex 2 - DDL das Tabelas

--Criação das tabelas:

-- Tabela Nutricionista
CREATE TABLE Nutricionista (
    ID_Nutricionista SERIAL PRIMARY KEY,
    CRN VARCHAR(20) NOT NULL,
    Especialidade VARCHAR(50),
    Tempo_Experiencia INTEGER
);

-- Tabela Paciente
CREATE TABLE Paciente (
    ID_Paciente SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

-- Tabela Consulta
CREATE TABLE Consulta (
    ID_Consulta SERIAL PRIMARY KEY,
    ID_Nutricionista INTEGER REFERENCES Nutricionista(ID_Nutricionista),
    ID_Paciente INTEGER REFERENCES Paciente(ID_Paciente),
    Data_Consulta DATE NOT NULL,
    Observacoes TEXT
);

--Exclusão das tabelas:

-- Tabela Consulta
DROP TABLE IF EXISTS Consulta;

-- Tabela Paciente
DROP TABLE IF EXISTS Paciente;

-- Tabela Nutricionista
DROP TABLE IF EXISTS Nutricionista;

---------------------------------------------
--[M205] Ex 3 - DML Insert das Tabelas

-- Inserção de dados:
-- Inserindo dados na tabela Nutricionista
INSERT INTO Nutricionista (CRN, Especialidade, Tempo_Experiencia)
VALUES ('12345', 'Nutrição Esportiva', 5),
       ('67890', 'Nutrição Clínica', 6),
       ('11223', 'Nutrição Pediátrica', 3);

-- Inserindo dados na tabela Paciente
INSERT INTO Paciente (Nome, Data_Nascimento, CPF, Telefone, Email)
VALUES ('Sergio Vieira', '1992-08-08', '12345678901', '4899999999', 'sergio@example.com'),
       ('Bianca da Cunha', '1993-02-15', '23456789012', '4899999999', 'bianca@example.com'),
       ('Bruno Vieira', '1995-11-02', '34567890123', '4899999999', 'bruno@example.com');

-- Inserindo dados na tabela Consulta
INSERT INTO Consulta (ID_Nutricionista, ID_Paciente, Data_Consulta, Observacoes)
VALUES (1, 1, '2024-06-01', 'Consulta inicial para avaliação nutricional.'),
       (2, 2, '2024-06-02', 'Retorno para ajuste de dieta.'),
       (3, 3, '2024-06-03', 'Consulta de acompanhamento mensal.');

--[M205] Ex 6 - DML update de relacionamentos
--Atualizando dados existentes:
-- Atualizando dados na tabela Nutricionista
UPDATE Nutricionista
SET Especialidade = 'Nutrição Funcional'
WHERE ID_Nutricionista = 1;

-- Atualizando dados na tabela Paciente
UPDATE Paciente
SET Telefone = '48999998888'
WHERE ID_Paciente = 1;

-- Atualizando dados na tabela Consulta
UPDATE Consulta
SET Observacoes = 'Consulta inicial para avaliação nutricional e planejamento de dieta.'
WHERE ID_Consulta = 1;


--[M205] EX 07 - DML Update e Delete
-- Comandos de update e delete:

-- Atualizando dados na tabela Nutricionista
UPDATE Nutricionista
SET Tempo_Experiencia = 8
WHERE ID_Nutricionista = 1;

-- Deletando dados na tabela Nutricionista
DELETE FROM Nutricionista
WHERE ID_Nutricionista = 3;

-- Atualizando dados na tabela Paciente
UPDATE Paciente
SET Email = 'sergio.vieira@example.com'
WHERE ID_Paciente = 1;

-- Deletando dados na tabela Paciente
DELETE FROM Paciente
WHERE ID_Paciente = 3;

-- Atualizando dados na tabela Consulta
UPDATE Consulta
SET Data_Consulta = '2024-06-05'
WHERE ID_Consulta = 1;

-- Deletando dados na tabela Consulta
DELETE FROM Consulta
WHERE ID_Consulta = 3;
