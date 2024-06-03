---criando database
create database  quiz;
go
use quiz;
go

---criando tabelas
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

---inserindo dados
INSERT INTO curso(curso)
VALUES ('Desenvolvimento de Sistemas'),
('Administração'),
('Comércio Exterior'),
('Design de Interiores'),
('Eletrônica'),
('Secretariado'),
('Serviços Jurídicos'),
('Ensino Médio - Administração'),
('Ensino Médio - Desenvolvimento de Sistemas'),
('Ensino Médio - Design Gráfico'),
('Ensino Médio - Eletrônica'),
('Ensino Médio - Eventos'),
('Ensino Médio - Informática para internet'),
('Ensino Médio - Serviços Jurídicos')

INSERT INTO disciplina(disciplina, fk_curso)
VALUES ('Programação e Algoritmos', 1),
('Banco de Dados I', 1), 
('Ética e Cidadania Organizacional', 1),
('Design Digital', 1),
('Programação Web I', 1),
('Fundamentos da Informática', 1),
('Operação de Software e Aplicativo',1)


---criando procedures
CREATE PROCEDURE spConsultarDisciplinas
AS
BEGIN
    SELECT 
        d.id_disciplina,
        d.disciplina,
        c.curso
    FROM 
        disciplina d
    JOIN 
        curso c ON d.fk_curso = c.id_curso;
END;

CREATE PROCEDURE spInserirUsuario(
		@email VARCHAR (100), 
		@senha VARCHAR (50)
		@login VARCHAR(255),
		@mensagem VARCHAR(255) OUTPUT)
		AS
		BEGIN
			DECLARE @vEXISTEUSUARIO VARCHAR(255);
		
			SELECT @vEXISTEUSUARIO = @login FROM usuario WHERE login = @login ;
	
			IF @login != @vEXISTEUSUARIO or @vEXISTEUSUARIO IS NULL
			BEGIN
				SET @mensagem = 'LOGIN NAO ENCONTRADO! VOCE ESTA SENDO DIRECIONADO PARA A TELA DE CADASTRO: ';
				BEGIN
					INSERT INTO usuario(login, email, senha)
					VALUES (@login, @email, @senha)
				END
				SET @mensagem = 'Usuario Cadastrado com sucesso!';
			END
			ELSE
			BEGIN
			if @login = @vEXISTEUSUARIO
			BEGIN
				select * from usuario;
				SET @mensagem = 'CADASTRO JA EXISTENTE NA BASE!';
			END			
	END
END

CREATE PROCEDURE spConsultarSenha(
    @login VARCHAR(100),
    @senhaInformada VARCHAR(100),
    @status INT OUTPUT,
    @mensagem VARCHAR(255) OUTPUT
)
AS
BEGIN
    DECLARE @senhaArmazenada VARCHAR(100);

    SELECT @senhaArmazenada = senha FROM usuario WHERE login = @login;

    IF @senhaArmazenada IS NULL
    BEGIN
        SET @status = -1;
        SET @mensagem = 'Usuário não encontrado';
    END
    ELSE
    BEGIN
        IF @senhaInformada = @senhaArmazenada
        BEGIN
            SET @status = 1;
            SET @mensagem = 'Senha correta';
        END
        ELSE
        BEGIN
            SET @status = 0;
            SET @mensagem = 'Senha incorreta';
        END
    END
END;

create procedure spBuscarQuestoes
	(@disciplina int)
as
begin
	select top 5 enunciado, pontuacao, disciplina
	from questoes
	inner join disciplina on id_disciplina = fk_disciplina
	where fk_disciplina = @disciplina
	ORDER BY NEWID(); 
end

create PROCEDURE spBuscarAlternativas
(@questao int)
as
	begin
	select *
	from alternativa
	where fk_questao = @questao 
end

CREATE PROCEDURE spConsultarRanking(
	@login varchar (250),
	@pontuacao int
)
as
begin
	select top 1 from ranking
	inner join usuario on fk_usuario = id_usuario
	union
	select top 1 from ranking
	union 
	select top 9 from ranking
	inner join usuario u on fk_usuario = id_usuario 
	order by pontuacao desc
end