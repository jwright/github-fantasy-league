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
      if (e.keyCode == 13 )
        $('.score-trigger').click()
  )

  $('.score-trigger').click ->
    $('#total-score').flipCounterInit()
    $('.results').slideDown()
    scorer.score $('#username').val(), (data) =>
      $('#score').val data.total_score
      $('#total-score').flipCounterUpdate data.total_score
      $('#avatar').attr('src', "#{data.avatar_url}?s=130")
