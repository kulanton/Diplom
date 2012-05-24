// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


$(function(){
  $('#btn-themes').click(function(){
    if ($('#results-themes').val() == '1')
      $('#results-themes').val('0');
    else
      $('#results-themes').val('1');
    $(this).button('toggle');
    return false;
  });
  
  $('#btn-questions').click(function(){
    if ($('#results-questions').val() == '1')
      $('#results-questions').val('0');
    else
      $('#results-questions').val('1');
    $(this).button('toggle');
    return false;
  });
  
  $('#btn-detaled').click(function(){
    if ($('#results-detaled').val() == '1')
      $('#results-detaled').val('0');
    else
      $('#results-detaled').val('1');
    $(this).button('toggle');
    return false;
  });
  
  if ($('#results-themes').val() == '1')
    $('#btn-themes').button('toggle');
  
  if ($('#results-questions').val() == '1')
    $('#btn-questions').button('toggle');
  
  if ($('#results-detaled').val() == '1')
    $('#btn-detaled').button('toggle');
  return false;
});


function autocompleteField() {
  $('.autocomplete-field').autocomplete({
    source: '/repository_themes.json',
    minLength: 0
  });
};


function remove_fields(link) {
  $(link).prev('input[type=hidden]').val('1');
  $(link).closest('.partial').hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp('new_' + association, 'g')
  $(link).parent().before(content.replace(regexp, new_id));
}

