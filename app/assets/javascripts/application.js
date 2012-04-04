// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

/*
$(function() {
  $("#btn-themes").click(function() {
    return false;
  });
  $("#btn-questions").click(function() {
    return false;
  });
  $("#btn-detaled").click(function() {
    return false;
  });
});
*/

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".partial").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

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
  $("#discipline_year_block_group_tokens").tokenInput("/groups.json", {
    crossDomain: false,
    prePopulate: $("#discipline_year_block_group_tokens").data("pre"),
    preventDuplicates: true,
    theme: 'facebook',
    hintText: 'Введите номер группы',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});

$(function() {
  $("#discipline_year_block_discipline_token").tokenInput("/disciplines.json", {
    crossDomain: false,
    prePopulate: $("#discipline_year_block_discipline_token").data("pre"),
    preventDuplicates: true,
    theme: 'facebook',
    hintText: 'Введите номер группы',
    noResultsText: 'Не найдено',
    searchingText: "Поиск..."
  });
});
