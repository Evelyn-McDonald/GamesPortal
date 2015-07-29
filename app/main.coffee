# -------------------------------------------------
#	Pull game data from games.json and populate
#	'featured games' and 'games list'
# -------------------------------------------------

$.getJSON 'games.json', (data) -> 
	# Sort games by rating
	data.sort (a, b) -> b.rating - a.rating

	for key, val of data
		((a, b) ->
			# Check to see if banner images exist
			if b.mediaFiles.FEATURED_HALF[620] isnt undefined
				if key < 5
					# Add game to banner using template
					$('.banner.featured-game').append(GamesPortal.templates["games-featured"](b))
					
					# Add rating to game
					$('.game-rating').barrating {
						theme: 'bootstrap-stars'
						readonly: true
						initialRating: b.rating
					}

				# Check to see if thumbnail exists
				((c) ->
					icon = new Image()
					icon.onload = -> 
						# Add game to 'games list' using template
						$('.game-list').append(GamesPortal.templates["games-list"](c))
					icon.src = c.mediaFiles.ICON[144]
				)(b)

		)(key, val)			

	# Initialize swipe on featured games banner
	$('.banner.featured-game').slick { 
		dots: false
		autoplay: true
		autoplaySpeed: 5000 
		arrows: false
		touchThreshold: 10
	}
	


# -------------------------------------------------
#	Create modal using data from .game-item
# -------------------------------------------------

$('#gameModal').on 'show.bs.modal', (event) ->
	btn = $(event.relatedTarget)
	# Create game object to send to template
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

	# Add game to modal using template
	$('.modal .featured-game').html(GamesPortal.templates["games-featured"](game))
	
	# Add rating to game
	$('.game-rating').barrating {
		theme: 'bootstrap-stars'
		readonly: true
		initialRating: game.rating
	}

