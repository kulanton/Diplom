$ ->
  $('#block_group_tokens').tokenInput '/groups.json'
    crossDomain: false
    prePopulate: $('#block_group_tokens').data('pre')
    queryParam: 'name'
    preventDuplicates: true
    theme: 'facebook'
    hintText: 'Введите номер группы'
    noResultsText: 'Не найдено'
    searchingText: 'Поиск...'

  $('#block_discipline_name').autocomplete
    source: '/disciplines.json'

  $('#block_year').autocomplete
    source: 'year.json'

  $('.sortable').sortable
    axis: 'y'
    items: 'li'
    update: ->
      $.post $(this).data('update-url'), $(this).sortable('serialize')

  $('.modal').modal
    backdrop: true
    keyboard: true
    show: false

  false