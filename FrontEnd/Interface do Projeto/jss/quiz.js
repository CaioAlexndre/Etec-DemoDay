var ponts = 0;


// function showQuestion(questionId) {
//     var questions = document.querySelectorAll('.question');
//     for (var i = 0; i < questions.length; i++) {
//         questions[i].classList.remove('active');
//     }
//     document.getElementById(questionId).classList.add('active');

// }

// mudei um pouco para impedir que o usuario avance. depois tehno q fazer com q ele possa voltar ou n passar sem responder a questão.

function showQuestion(questionId) {
    var currentQuestion = document.querySelector('.question.active');
    var radios = currentQuestion.querySelectorAll('input[type="radio"]');
    var answered = false;

    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            answered = true;
            break;
        }
    }

    if (!answered) {
        alert('Por favor, selecione uma resposta antes de continuar.');
        return;
    }
    var questions = document.querySelectorAll('.question');
    for (var i = 0; i < questions.length; i++) {
        questions[i].classList.remove('active');
    }
    document.getElementById(questionId).classList.add('active');
}

function responder(pergunta, proximaPerguntaId) {

    var respostaCorreta;
    var feedbackId = "feedback-" + pergunta;

    // Identificar a resposta correta
    switch (pergunta) {
        case "q1":
            respostaCorreta = "b";
            break;
        case "q2":
            respostaCorreta = "b";
            break;
            case "q3":
            respostaCorreta = "b";
            break;
        case "q4":
            respostaCorreta = "c";
            break;
            case "q5":
            respostaCorreta = "b";
            break;
        case "q6":
            respostaCorreta = "a";
            break;
        case "q7":
            respostaCorreta = "c";
            break;
        // Adicione os casos para as outras perguntas
    }


    // Verificar qual opção o usuário selecionou
    var respostaUsuario;
    var radios = document.getElementsByName(pergunta);
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            respostaUsuario = radios[i].value;
            break;
        }
    }


    var feedback = document.getElementById(feedbackId);
    if (respostaUsuario === respostaCorreta) {
        feedback.innerHTML = "Resposta Correta: Parabéns! Você acertou!";
        feedback.style.color = "green";
        ponts ++; // para adicionar pontos por acerto

    } else {
        feedback.innerHTML = "Resposta Incorreta: A resposta correta era: " + respostaCorreta; //.toUpperCase();
        feedback.style.color = "red";  
    }

    feedback.style.display = "block";

    // Ocultar o botão de resposta
    var button = document.querySelector("button[onclick=\"responder('" + pergunta + "', '" + proximaPerguntaId + "')\"]");
    button.style.display = "none";

    // Exibir feedback final
    var todasRespostas = document.querySelectorAll(".question");
    var todasCorretas = true;
    for (var j = 0; j < todasRespostas.length; j++) {
        if (todasRespostas[j].querySelector("p[id^='feedback-q']").style.display !== "block") {
            todasCorretas = false;
            break;
        }
    }
    if (todasCorretas) {
        document.getElementById("feedback-final").innerHTML = "Parabéns! Você concluiu o quiz!";
        document.getElementById("feedback-final").style.display = "block";
    }

    document.getElementById("score").textContent = "Pontuação: [Pontos: " + ponts + "]";
}