$.getJSON('games.json', (data) -> 
	$('.game-list').append(GamesPortal.templates["games-list"](data))
)