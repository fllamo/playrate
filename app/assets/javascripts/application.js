//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require moment
//= require bootstrap-sprockets
//= require bootstrap-datepicker

$(document).ready(function(){
  $('.longdatepicker').datepicker({
    format: 'yyyy-mm-dd',
    startView: 2
  });

  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd'
  });
});