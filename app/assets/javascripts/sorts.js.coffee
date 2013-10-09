# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	json = $('#chart').data('sort')	

	Morris.Bar
		element: 'chart'
		data: [
			{y: 'Quick', time: json.quick},
			{y: 'Merge', time: json.merge},
			{y: 'Bubble', time: json.bubble}
		]
		xkey: 'y'
		ykeys: ['time']
		labels: ['Time ']
		#$('#chart').data('sort')