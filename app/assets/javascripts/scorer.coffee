class Scorer
  score: (username, callback) ->
    $.post "/users",
      { username: username },
      (data) =>
        callback data
      "JSON"

$ ->
  window.scorer = new Scorer

  $('input.focusable').focus()

  $('#username').bind('keypress', (e) =>
    $('.score-trigger').click() if (e.keyCode == 13 )
  )

  $('.score-trigger').click ->
    scorer.score $('#username').val(), (data) =>
      $('#score').val data.total_score
      $('#total-score').flipCounterUpdate data.total_score
      $('#avatar').attr('src', "#{data.avatar_url}?s=130")
    $('#total-score').flipCounterInit()
    if $('#username').val() is ''
      $('.oops').removeClass('hide').addClass('show')
      $('#username').focus()
    else
      $('.oops').removeClass('show').addClass('hide')
      $('.results').slideDown()
