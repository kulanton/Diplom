$ ->
  $('#discipline_repository_theme_tokens').tokenInput '/repository_themes.json'
    crossDomain: false
    prePopulate: $('#discipline_repository_theme_tokens').data('pre')
    preventDuplicates: true
    theme: 'facebook'
    hintText: 'Введите название дисциплины'
    noResultsText: 'Не найдено'
    searchingText: "Поиск..."
    
  $('#disciplines_search fieldset input').keyup ->
    $.get $('#disciplines_search').attr('action'), $('#disciplines_search').serialize(), (data) ->
      $('#disciplines').html($(data).find('#disciplines'))
      false
    false

  $("#disciplines_search").submit ->
    false

  false
  
