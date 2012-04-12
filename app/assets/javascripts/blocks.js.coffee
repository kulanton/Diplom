$ ->
  $('#block_group_tokens').tokenInput '/groups.json'
    crossDomain: false
    prePopulate: $('#block_group_tokens').data('pre')
    preventDuplicates: true
    theme: 'facebook'
    hintText: 'Введите номер группы'
    noResultsText: 'Не найдено'
    searchingText: 'Поиск...'

  $('#block_discipline_name').autocomplete
    source: '/disciplines.json'

  $('.sortable').sortable
    axis: 'y'
    items: 'li'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

  false
