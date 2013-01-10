class Scorer
  score: (username, callback) ->
    $.post "/users",
      { username: username },
      (data) =>
        callback data
      "JSON"

$ ->
  window.scorer = new Scorer

  $('.score-trigger').click ->
    scorer.score $('#username').val(), (data) =>
      $('#total-score').text data.total_score
      $('#avatar').attr('src', data.avatar_url)
