// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.tokeninput
// require bootstrap
//= require rails.validations

$(function() {
  $("#disciplines_search fieldset input").keyup(function() {
    $.get($("#disciplines_search").attr("action"), $("#disciplines_search").serialize(), function(data) {
	  $("#disciplines").html($(data).find("#disciplines"));
    });
    return false;
  });
  $("#disciplines_search").submit(function() {
    $.get($("#disciplines_search").attr("action"), $("#disciplines_search").serialize(), function(data) {
	  $("#disciplines").html($(data).find("#disciplines"));
    });
    return false;
  });
});

$(function() {
  $("#discipline_repository_theme_tokens").tokenInput("/repository_themes.json", {
    crossDomain: false,
    prePopulate: $("#discipline_repository_theme_tokens").data("pre"),
    preventDuplicates: true,
    theme: 'facebook',
    hintText: 'Введите название дисциплины',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});

$(function() {
  $("#discipline_group_tokens").tokenInput("/groups.json", {
    crossDomain: false,
    prePopulate: $("#discipline_group_tokens").data("pre"),
    preventDuplicates: true,
    theme: 'facebook',
    hintText: 'Введите название группы',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});

$(function() {
  $("#test_subject_tokens").tokenInput("/subjects/index.json", {
    crossDomain: false,
    prePopulate: $("#test_subject_tokens").data("pre"),
    theme: 'facebook',
    tokenLimit: 1,
    hintText: 'Введите название дисциплины или группы',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});
