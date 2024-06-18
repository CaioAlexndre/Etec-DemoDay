var dataUsuarios = [
    {
        usuario: 'pedrinho',
        senha: '12345'
    },
    {
        usuario: 'julia',
        senha: '23456'
    },
]

let usuario = document.getElementById('username');
let senha = document.getElementById('senha');

function validaSenha (){
    if (username === correctUsername && password === correctPassword) {
        // Redireciona para a página desejada
        window.location.href = "pagina-segura.html";
    } else {
        // Exibe um alerta de erro
        alert('Usuário ou senha incorretos!');
}