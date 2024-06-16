
document.addEventListener("DOMContentLoaded", () => {
    const apiUrl = 'https://api.comg';

    fetch(apiUrl)
        .then(response => response.json())
        .then(data => updateRanking(data))
        .catch(error => console.error('Error fetching data:', error));
});

async function carregarDisciplinas(data){
    const disciplinas = document.getElementById('disciplina')
    disciplinas.innerHTML= '';

    for(let i = 0; i < data.lenght; i++){
        
    }
}