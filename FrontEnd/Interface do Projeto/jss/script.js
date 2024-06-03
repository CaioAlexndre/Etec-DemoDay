document.addEventListener('DOMContentLoaded', () => {
    const userPhoto = document.getElementById('user-photo');
    const victories = document.getElementById('victories');
    const playtime = document.getElementById('playtime');
    const mainDiscipline = document.getElementById('main-discipline');

    const userData = {
        photo: '',
        victories: 25,
        playtime: 150,
        mainDiscipline: 'Matemática'
    };

    if (userData.photo) {
        userPhoto.src = userData.photo;
    } else {
        userPhoto.src = 'placeholder.jpg';
    }

    victories.textContent = userData.victories;
    playtime.textContent = `${userData.playtime} horas`;
    mainDiscipline.textContent = userData.mainDiscipline;
});

document.addEventListener('DOMContentLoaded', () => {
    const goToRegisterButton = document.getElementById('go-to-register');
    const goToLoginButton = document.getElementById('go-to-login');

    if (goToRegisterButton) {
        goToRegisterButton.addEventListener('click', () => {
            window.location.href = 'register.html'; // Redireciona para a tela de registro
        });
    }

    if (goToLoginButton) {
        goToLoginButton.addEventListener('click', () => {
            window.location.href = 'login.html'; // Redireciona para a tela de login
        });
    }
});