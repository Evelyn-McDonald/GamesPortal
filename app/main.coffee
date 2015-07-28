$.getJSON 'games.json', (data) -> 
	$('.game-list').append(GamesPortal.templates["games-list"](data))

	data.sort (a, b) -> b.rating - a.rating

	for key, val of data
		if key < 5
			$('.banner.featured-game').append(GamesPortal.templates["games-featured"](val))

	$('.banner.featured-game').slick { 
		dots: true
		autoplay: true
		autoplaySpeed: 5000 
		arrows: false
		touchThreshold: 10
	}

$('#gameModal').on 'show.bs.modal', (event) ->
	btn = $(event.relatedTarget)
	banner = btn.data 'banner'
	name = btn.data 'name'
	desc = btn.data 'desc'
	playURL = btn.data 'play' 
	
	modal = $(this)
	modal.find('.game-banner').attr 'src', banner
	modal.find('.game-name').text name
	modal.find('.game-description').html desc 
	modal.find('.game-play').attr 'href', playURL