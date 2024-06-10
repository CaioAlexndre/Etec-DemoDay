async function teste(){
    let const = await fetch('https://viacep.com.br/ws/01001000/json/');
// .then(res=>res.json())
.try((resposta)=>{
    const ul = document.getElementById('ul');
        const li = document.createElement('li')
        li.innerHTML = 
        `<span id="disciplinaSearch" onclick="aperte()">${resposta}</span>`
        ul.appendChild(li);
    
})
.catch((erro)=>{
    console.log(`${erro}`)
})
}