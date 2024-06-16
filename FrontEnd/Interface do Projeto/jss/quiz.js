function showQuestion(questionId) {
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
    } else {
        feedback.innerHTML = "Resposta Incorreta: A resposta correta era: " + respostaCorreta.toUpperCase();
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
}