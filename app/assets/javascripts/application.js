// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
  $("#group_discipline_tokens").tokenInput("/disciplines.json", {
    crossDomain: false,
    prePopulate: $("#group_discipline_tokens").data("pre"),
    preventDuplicates: true,
    theme: 'facebook',
    hintText: 'Введите название дисциплины',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});

$(function() {
  $("#theme_discipline_token").tokenInput("/disciplines.json", {
    crossDomain: false,
    prePopulate: $("#theme_discipline_token").data("pre"),
    preventDuplicates: true,
    tokenLimit: 1,
    theme: 'facebook',
    hintText: 'Введите название дисциплины',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});

$(function() {
  $("#script_theme_tokens").tokenInput("/themes.json", {
    crossDomain: false,
    prePopulate: $("#script_theme_tokens").data("pre"),
    //tokenLimit: 1,
    //onAdd: function() {
	//  alert("Hello!");
	//},
    preventDuplicates: true,
    theme: 'facebook',
    hintText: 'Введите название темы',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});

$(function() {
  $("#test_disciplines_groups_token").tokenInput("/disciplines_groups/index.json", {
    crossDomain: false,
    prePopulate: $("#test_disciplines_groups_token").data("pre"),
    theme: 'facebook',
    tokenLimit: 1,
    hintText: 'Введите название дисциплины или группы',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});
