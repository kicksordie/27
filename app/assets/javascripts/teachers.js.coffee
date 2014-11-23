# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

rate_click = (e) ->
  top_pos = e.pageY
  $.ajax
    url: 'teachers/' + this.id + '/vote'
    type: 'GET'
    dataType: 'html'
    success: (data) ->
      rate_frame = $('#rate-frame')
      rate_frame.show()
      rate_frame.html '<button class="close-rate-frame">Close</button>'
      rate_frame.append data
      rate_frame.css 'top', (top_pos - 30) + 'px'
      $('.close-rate-frame').click ->
        rate_frame.hide()
      form = $('#rate-frame form')
      form.submit (e) ->
        e.preventDefault()
        $.ajax
          type: form.attr('method')
          url: form.attr('action')
          data: form.serialize()
          success: (data) ->
            $("#ranking").load('/' + " #ranking", ( ->
              $('.rate').click(rate_click)
              $('.close-rate-frame').click ->
                rate_frame.hide()
            ))
            rate_frame.html '<button class="close-rate-frame">Close</button><p>Voted successfully!</p>'
          error: ->
            rate_frame.html '<button class="close-rate-frame">Close</button><p>Rating error!</p>'
            $('.close-rate-frame').click ->
              rate_frame.hide()
        return false

$(document).ready ->
  $('#rate-frame').hide()
  $('.rate').click(rate_click)

