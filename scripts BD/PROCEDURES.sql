CREATE PROCEDURE spInserirUsuario
@login VARCHAR (100),
@email VARCHAR (100), 
@senha VARCHAR (50)
AS
BEGIN
	INSERT INTO usuario(login, email, senha)
	VALUES (@login, @email, @senha)
END


CREATE PROCEDURE spConsultarUsuario
@login VARCHAR (100),
@email VARCHAR (100), 
AS 
BEGIN
	SELECT *
	FROM usuario
	WHERE usuario.login = @login

	OR

	SELECT *
	FROM usuario
	WHERE usuario.email = @email

END

CREATE PROCEDURE spConferirSenha


CREATE PROCEDURE spConsultarDisciplinas


CREATE PROCEDURE spConsultarPerguntasRespostas


CREATE PROCEDURE spInserirPontuacao