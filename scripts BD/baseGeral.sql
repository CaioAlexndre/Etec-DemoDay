---criando database
create database  quiz;
go
use quiz;
go

---limitando tempo de requisição
EXEC sp_configure 'remote query timeout', 10;
GO
RECONFIGURE;
GO


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
---adicionanando coluna de descrição
ALTER TABLE disciplina
ADD descricaoDisciplina VARCHAR (200)
ALTER TABLE  disciplina
ADD modulo INT

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

INSERT INTO disciplina(disciplina, fk_curso, descricaoDisciplina, modulo)
VALUES ('Inglês Instrumental', 1, 'Compreender e interpretar textos em inglês voltado para o mundo da tecnologia', 1),
('Programação e Algoritmos', 1, 'Estuda a implementação de algoritmos em linguagem de programação, utilizando ambientes de desenvolvimento', 1),
('Banco de Dados I', 1, 'Estudar modelagem banco de dados, criação de modelos conceituais e lógicos',1),
('Ética e Cidadania Organizacional', 1, 'Foca na compreenção da melhor maneira de atuação profissional de acordo com princípios éticos', 1),
('Design Digital', 1, 'Desenvolver elementos gráficos para aplicativos e sites.', 1),
 ('Programação Web I', 1, 'Desenvolver sites para Web, utilizando HTML5 e CSS3 e introdução ao JavaScript', 1),
('Fundamentos da Informática', 1, 'Compreender o funcionamento computadores, bem como entender hardware e software', 1),
('Operação de Software Aplicativo', 1, 'Compreender o funcionamento de programas utilizados para aplicações dentro do sistema operacional, como Word, Excel e PowerPoint', 1),
('Análise e Projeto de Sistemas', 1, ' Compreender o planejamento e desenvolvimento de sistemas de informação para solução de problemas de negócios.', 2),
('Desenvolvimento de Sistemas ', 1, 'Analisar e projetar sistemas de informação, utilizando C# e ambientes
de desenvolvimento de acordo com as especificidades do projeto.', 2),
('Banco de Dados II', 1, 'Entender a construção banco de dados relacional utilizando
o Sistema Gerenciador de banco de dados, SQLServer', 2),
('Sistemas Embarcados', 1, 'Desenvolver aplicações utilizando microcontroladores, arduíno e ambiente de programção', 2),
('Programação de Aplicativos Mobile I', 1, 'Projetar aplicativos mobile, utilizando IONIC Framework', 2),
('Programação Web II', 1, ' Desenvolver websites utilizando
Javascript para o Front e Back End',2),
('Planejamento do Trabalho de Conclusão de Curso (TCC) em Desenvolvimento de Sistemas', 1, 'Planejar e desenvolver uma solução fazendo uso dos conhecimentos adquiridos ao longo do curso',2),
('Segurança de Sistemas de Informação', 1, 'Desenvolver soluções de segurança dos
dados na elaboração de sistemas e aplicações.', 3),
('Banco de Dados III', 1, 'Otimizar a linguagem de consulta estruturada
como forma de informação relevante para a
tomada de decisão.', 3),
('Internet e protocolos', 1, 'Configurar os principais serviços de redes de
comunicação de dados e internet para o
desenvolvimento de sistemas.',3),
('Programação de Aplicativos Mobile II', 1 'Projetar aplicativos, selecionando linguagens de
programação e ambientes de desenvolvimento e, ainda, consumir dados de APIs',3),
('Programação Web III', 1, 'Desenvolver sistemas multicamadas
utilizando framework de desenvolvimento web e desenvolver serviços de integração entre aplicações',3),
('Linguagem, Trabalho e Tecnologia', 1, 'Foca no estudo da comunicação em língua portuguesa, utilizando o vocabulário técnico da área e elaborar registros
e planilhas de acompanhamento e controle de atividades.',3),
('Desenvolvimento de Sistemas II', 1, 'Analisar e projetar sistemas de informação, selecionando linguagens de programação e ambientes
de desenvolvimento de acordo com as especificidades do projeto.', 3),
('Desenvolvimento do Trabalho de Conclusão de Curso (TCC) em Desenvolvimento de Sistemas', 1, 'Planejar as fases de execução de projetos
com base na natureza e na complexidade das
atividades.', 3)


INSERT INTO questoes(enunciado, pontuacao, fk_disciplina)
VALUES ('HTML é uma linguagem de programação?', '10', ''),
('O que é um framework?', '30', ''),
('O que é gestalt?', '40', ''),
('Qual a diferença entre ética e moral?', '20', ''),
('O que são threads?', '40', '')


---criando procedures
---consultar disciplinas
CREATE OR ALTER PROCEDURE spConsultarDisciplina
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

---inserir usuario
CREATE OR ALTER PROCEDURE spInserirUsuario(
		@email VARCHAR (100), 
		@senha VARCHAR (50),
		@login VARCHAR(255),
		@status BIT OUTPUT,
		@mensagem VARCHAR(255) OUTPUT)
		AS
		BEGIN
			DECLARE @usuarioExistente VARCHAR(255);
		
			SELECT @usuarioExistente = @login FROM usuario WHERE login = @login ;
	
			IF @login != @usuarioExistente or @usuarioexistente IS NULL
			BEGIN
				SET @mensagem = 'Login não encontrado. Você será direecionado para página de cadastro. ';
				SET @status = 0;
			BEGIN
				INSERT INTO usuario(login, email, senha)
				VALUES (@login, @email, @senha)
				SET @mensagem = 'Usuario cadastrado com sucesso!';
			END			
		END
		ELSE
		BEGIN
			IF @login = @usuarioExistente
			BEGIN
				select * from usuario;
			SET @mensagem = 'Usuário cadastrado';
			SET @status = 1;
		END			
	END
END



---consultar senha
CREATE OR ALTER PROCEDURE spConsultarSenha(
    @login VARCHAR(100),
    @senhaInformada VARCHAR(100),
    @status BIT OUTPUT,
    @mensagem VARCHAR(255) OUTPUT
)
AS
BEGIN
    DECLARE 
		@senhaArmazenada VARCHAR(100);
    SELECT @senhaArmazenada = senha FROM usuario WHERE login = @login;
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
END;

---gerar senha provisoria
CREATE OR ALTER PROCEDURE spGerarSenhaProvisoria(
    @login VARCHAR(250),
    @senhaEnviada VARCHAR(250) OUTPUT
)
AS
BEGIN
    DECLARE @senhaProvisoria INT;
    SET @senhaProvisoria = ABS(CHECKSUM(NEWID())) % 100000000 + 1; ----newid gera um codigo randomico incluindo letras e numeros; checksum
    UPDATE usuario
    SET senha = CAST(@senhaProvisoria AS VARCHAR(8))
    WHERE login = @login;
    SET @senhaEnviada = 'Olá!! Esqueceu sua senha? Recebemos uma solicitação de alteração de senha para sua conta. Para confirmar a alteração de senha, acesse esse link e use a sua senha abaixo para continuar: ' + CAST(@senhaProvisoria AS VARCHAR(8));
    SELECT @senhaEnviada;
END;
DECLARE @senhaEnviada VARCHAR(250);
EXEC spGerarSenhaProvisoria 
    @login = 'caio', 
    @senhaEnviada = @senhaEnviada OUTPUT;
SELECT @senhaEnviada;



---atualizar senha
CREATE OR ALTER PROCEDURE spAtualizarSenha(
	@senha VARCHAR (100),
	@usuario VARCHAR (100))
AS 
BEGIN
	UPDATE usuario
	SET senha = @senha
	WHERE login = @usuario
END;

EXEC spAtualizarSenha @senha = '3789', @usuario = 'caio'


---buscar questões
CREATE OR ALTER PROCEDURE spBuscarQuestoes(
@disciplina INT
)
AS
BEGIN
	SELECT TOP 5 enunciado, pontuacao, disciplina
	FROM questoes
	INNER JOIN disciplina ON id_disciplina = fk_disciplina
	WHERE fk_disciplina = @disciplina
	ORDER BY NEWID(); 
END

----buscar alternativas
CREATE OR ALTER PROCEDURE spBuscarAlternativas(
@questao INT
)
AS
BEGIN
	SELECT *
	FROM alternativa
	WHERE fk_questao = @questao 
END

---consultar ranking
CREATE OR ALTER PROCEDURE spConsultarRanking(
	@login VARCHAR (250),
	@pontuacao INT,
	@primeiroLugar VARCHAR(100) OUTPUT,
)
AS 
BEGIN
	SELECT TOP 1 
		r.*,
		u.login,
		u.email
	FROM ranking r
	INNER JOIN usuario u ON fk_usuario = id_usuario

	UNION ALL

	SELECT TOP 9 
		r.*,
		u.login,
		u.email
	FROM ranking r
	INNER JOIN usuario u ON fk_usuario = id_usuario 
	WHERE pontos < 30
	ORDER BY pontos DESC
END

---testes
select * from usuario
INSERT INTO usuario(login, email, senha)
VALUES ('andrey', 'andey@gmail.com', '67890'),
('geovana', 'geovanna@gmail.com', '78900'),
('gustavo', 'gustavo@gmail.com', '891011'),
('jhow', 'jhow@gmail.com', '9101112'),
('gabriel', 'gabriel@gmail.com', '101112'),
('alex', 'alex@gmail.com', '111213')
