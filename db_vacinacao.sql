CREATE DATABASE db_pet;
USE db_pet;

CREATE TABLE user
(
	id int auto_increment primary key,
    nome varchar(45) not null,
    telefone varchar(15),
    endereco varchar(255)
);

CREATE TABLE animal
(
	id int auto_increment primary key,
    nome varchar(100) not null,
    especie varchar(50),
    idade int,
    user_id int,
    data_vacinacao date,
    local_vacinacao varchar(255),
    foreign key (user_id) references user(id)
);

-- Inserir um User
INSERT INTO user (nome, telefone, endereco)
VALUES ('Maria Silva', '34 9 92319200', 'Rua A bairro Santiago numero 123');

INSERT INTO user (nome, telefone, endereco)
VALUES ('Luiz Silva', '34 9 92319200', 'Rua A bairro Santiago numero 13');

-- Inserir um Pet
INSERT INTO animal (nome, especie, idade, user_id, data_vacinacao, local_vacinacao)
VALUES ('Rex', 'Cachorro', 3, 1, '2024-09-01', 'Postinho Bairro Santiago');

INSERT INTO animal (nome, especie, idade, user_id, data_vacinacao, local_vacinacao)
VALUES ('Bolinha', 'Cachorro', 1, 1, '2024-09-10', 'Postinho Bairro Santiago');


SELECT a.nome AS NomeAnimal, a.especie, a.idade, a.data_vacinacao, a.local_vacinacao, u.nome AS Tutor
FROM animal a
JOIN user u ON a.user_id = u.id;

-- Consultar um Pet específico
SELECT * FROM animal WHERE nome = 'Rex';

-- Atualizar informações de um Pet
UPDATE animal
SET idade = 4, data_vacinacao = '2024-12-01', local_vacinacao = 'Rua B, 321'
WHERE id = 2;

-- Atualizar informações de um Tutor
UPDATE user
SET telefone = '987654321'
WHERE id = 2;

-- Deletar informações de um Pet
DELETE FROM animal WHERE id = 1;

-- Deletar informações de um Tutor
DELETE FROM user WHERE id = 2;


