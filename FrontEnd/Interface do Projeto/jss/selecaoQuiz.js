var dataDisciplina = [
    {
        titulo: 'Anne Frank',
        descricao: 'Livro'
    },
    {
        titulo: 'O menino do pijama listrado',
        descricao: 'Livro'
    },
    {
        titulo: 'Star Wars',
        descricao: 'Livro'
    },
    {
        titulo: 'Harry Potter',
        descricao: 'Livro'
    },
    {
        titulo: 'Mochileiro das galáxias',
        descricao: 'Livro'
    },
];


var dataCursos = [
    {
        titulo: 'Desenvolvimento de Sistemas',
    },
    {
        titulo: 'Banco de Dados II',
    },
    {
        titulo: 'Programação Web',
    },
    {
        titulo: 'Design Digital',
    },

]
// async function carregarDisciplinas(data){
//     const disciplinas = document.getElementById('disciplina');

//     for(let i = 0; i < data.lenght; i++){
//         const disciplina = document.createElement('div')
//         disciplina.innerHTML = `
//        <div id="disciplina">
//             <img src="${disciplina.imagem}" alt="imagem descrição da disciplina escolhida" id="imagem-disciplina">
//             <h3 id="titulo-disciplina" style="color:var(--rosa)">${disciplina.titulo}</h3>
//             <p id="descricao-disciplina">${disciplina.descricao}</p>
//             <a href="quiz-teste.html" id="playlink"><button type="button" id="btn-play">Jogar</button></a>
//         </div>
//         `
//         disciplinas.appendChild(disciplina);
//     }
// }

//disciplinas sendo inseridas
const displayData = (dataDisciplina) => {
    let disciplinas = document.getElementById('disciplinasExibidas');
    disciplinas.innerHTML = '';  
    dataDisciplina.forEach(e => {
        let disciplinaDiv = document.createElement('div');
        disciplinaDiv.id = 'disciplina';
        disciplinaDiv.innerHTML = `
            <h3 id="titulo-disciplina" style="color:var(--rosa)">${e.titulo}</h3>
            <p id="descricao-disciplina">${e.descricao}</p>
            <a href="quiz-teste.html" id="playlink"><button type="button" id="btn-play">Jogar</button></a>
        `;
        disciplinas.appendChild(disciplinaDiv);
    });
};
window.addEventListener("load", () => displayData(dataDisciplina));

//pesquisa de disciplinas

    let inDisciplina = document.getElementById('disciplina-input');
    
    inDisciplina.addEventListener("keyup", (e) => {
        const pesquisa = data.filter(i => 
            i.titulo.toUpperCase().includes(e.target.value.toUpperCase())
        );
        displayData(pesquisa);
    });

//inserção de disciplinas no select
window.addEventListener("load", () => {
    const select = document.getElementById('curso');
    select.innerHTML = ''; // Limpa o conteúdo do select
    
    dataCursos.forEach(e => {
        let curso = document.createElement('option');
        curso.value = e.titulo; // Define o valor da opção
        curso.textContent = e.titulo; // Define o texto a ser exibido
        select.appendChild(curso);
    });
});