# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

if $('body.static_pages_index').length > 0
	$(document).ready ->
		window.images = $('#slides-view img')
		window.current_image = 0
		window.switch_to_image = (id) ->
			for i in [0..window.images.length-1]
				if (i != id)
					window.images.eq(i).fadeOut(500) 
				else
					window.images.eq(i).fadeIn(500)

	$('#slides-arrow-l-button').click ->
		window.current_image = (window.current_image + window.images.length - 1) % window.images.length
		window.switch_to_image(window.current_image)

	$('#slides-arrow-r-button').click ->
		window.current_image = (window.current_image + window.images.length + 1) % window.images.length
		window.switch_to_image(window.current_image)
