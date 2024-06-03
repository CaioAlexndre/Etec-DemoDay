create database  quiz;
go
use quiz;
go
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY IDENTITY(1,1),
    login VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE curso (
    id_curso INT PRIMARY KEY IDENTITY(1,1),
    curso VARCHAR(255) NOT NULL
);

CREATE TABLE disciplina (
    id_disciplina INT PRIMARY KEY IDENTITY(1,1),
    disciplina VARCHAR(255) NOT NULL,
    fk_curso INT,
    FOREIGN KEY (fk_curso) REFERENCES curso(id_curso)
);

CREATE TABLE questoes (
    id_questao INT PRIMARY KEY IDENTITY(1,1),
    enunciado TEXT NOT NULL,
    pontuacao INT NOT NULL,
    fk_disciplina INT,
    FOREIGN KEY (fk_disciplina) REFERENCES disciplina(id_disciplina)
);

CREATE TABLE alternativa (
    id_alternativa INT PRIMARY KEY IDENTITY(1,1),
    enunciado TEXT NOT NULL,
    correta BIT NOT NULL,
    fk_questao INT,
    FOREIGN KEY (fk_questao) REFERENCES questoes(id_questao)
);


CREATE TABLE quiz (
    id_quiz INT PRIMARY KEY IDENTITY(1,1),
    data_quiz DATE NOT NULL,
    fk_usuario INT,
    fk_disciplina INT,
    pontuacao INT,
	fk_questao1 INT,
	fk_questao2 INT,
	fk_questao3 INT,
	fk_questao4 INT,
	fk_questao5 INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (fk_disciplina) REFERENCES disciplina(id_disciplina),
	FOREIGN KEY (fk_questao1) REFERENCES questoes (id_questao),
	FOREIGN KEY (fk_questao2) REFERENCES questoes (id_questao),
	FOREIGN KEY (fk_questao3) REFERENCES questoes (id_questao),
	FOREIGN KEY (fk_questao4) REFERENCES questoes (id_questao),
	FOREIGN KEY (fk_questao5) REFERENCES questoes (id_questao),
);

CREATE TABLE ranking (
    id_ranking INT PRIMARY KEY IDENTITY(1,1),
    fk_usuario INT,
    pontos INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario)
);

select * from ranking;
select * from usuario;
select * from curso;
select * from disciplina;
select * from questoes;
select * from alternativa;
select * from quiz;







