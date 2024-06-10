document.addEventListener("DOMContentLoaded", () => {
    const apiUrl = 'https://api.comg';

    fetch(apiUrl)
        .then(response => response.json())
        .then(data => updateRanking(data))
        .catch(error => console.error('Error fetching data:', error));
});

function updateRanking(data) {
    const rankingContainer = document.getElementById('ranking');
    rankingContainer.innerHTML = '';

    const maxUsers = Math.min(data.ranking.length, 10);

    for (let i = 0; i < maxUsers; i++) {
        const item = data.ranking[i];
        const rankingItem = document.createElement('div');
        rankingItem.className = 'ranking-item';

        const positionSpan = document.createElement('span');
        positionSpan.textContent = item.position;
        rankingItem.appendChild(positionSpan);

        const userImage = document.createElement('img');
        userImage.className = 'img-user';
        userImage.src = item.image_url;
        userImage.alt = item.username;
        rankingItem.appendChild(userImage);

        const userNameSpan = document.createElement('span');
        userNameSpan.className = 'user-name';
        userNameSpan.textContent = item.username;
        rankingItem.appendChild(userNameSpan);

        const userPtsSpan = document.createElement('span');
        userPtsSpan.className = 'user-pts';
        userPtsSpan.textContent = item.points;
        rankingItem.appendChild(userPtsSpan);

        rankingContainer.appendChild(rankingItem);
    }

    const currentUser = data.current_user;
    if (currentUser) {
        document.getElementById('user-atual').textContent = currentUser.username;
        document.getElementById('pont-add').textContent = currentUser.points_added;
    }
}