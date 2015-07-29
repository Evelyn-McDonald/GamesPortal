$.getJSON 'games.json', (data) -> 
	data.sort (a, b) -> b.rating - a.rating

	for key, val of data
		((a, b) ->
			if b.mediaFiles.FEATURED_HALF[620] isnt undefined
				if key < 5
					$('.banner.featured-game').append(GamesPortal.templates["games-featured"](b))
					$('.game-rating').barrating {
						theme: 'bootstrap-stars'
						readonly: true
						initialRating: b.rating
					}

				((c) ->
					icon = new Image()
					icon.onload = -> 
						$('.game-list').append(GamesPortal.templates["games-list"](c))
					icon.src = c.mediaFiles.ICON[144]
				)(b)

		)(key, val)			

	$('.banner.featured-game').slick { 
		dots: false
		autoplay: true
		autoplaySpeed: 5000 
		arrows: false
		touchThreshold: 10
	}
	


$('#gameModal').on 'show.bs.modal', (event) ->
	btn = $(event.relatedTarget)
	game = {
		mediaFiles : {
			FEATURED_HALF: {
				620: btn.data 'banner'
			}
		}
		name : btn.data 'name'
		description : btn.data 'desc'
		gamePlayUrl : btn.data 'play' 
		rating : btn.data 'rating'
	}

	$('.modal .featured-game').html(GamesPortal.templates["games-featured"](game))
	$('.game-rating').barrating {
		theme: 'bootstrap-stars'
		readonly: true
		initialRating: game.rating
	}

