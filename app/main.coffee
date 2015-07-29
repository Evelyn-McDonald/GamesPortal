$.getJSON 'games.json', (data) -> 
	data.sort (a, b) -> b.rating - a.rating

	for key, val of data
		((a, b) ->
			if b.mediaFiles.FEATURED_HALF[620] isnt undefined
				# icon = new Image()
				# icon.onload = -> 
				if key < 5
					$('.banner.featured-game').append(GamesPortal.templates["games-featured"](b))

				((c) ->
					icon = new Image()
					icon.onload = -> 
						$('.game-list').append(GamesPortal.templates["games-list"](c))
					icon.src = c.mediaFiles.ICON[144]
				)(b)
				# icon.src = b.mediaFiles.FEATURED_TWO_THIRDS[840]	
		)(key, val)			

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

$(window).on "load resize", (event) ->
	$('ul.slick-dots').css 'top', $('.game-hero').height()-40
