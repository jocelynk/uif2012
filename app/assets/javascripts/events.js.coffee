# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#clickme").button().click ->
    $("#popup").dialog "open"

  $("#popup").dialog
    autoOpen: false
    height: 300
    width: 350
    modal: true

  $('#event_sections').parent().hide()
  sections = $('#event_sections').html()
  console.log("section: " + sections)
  console.log($('#event_sections').parent().hide())
  $('#event_program_id').change ->
    program = $('#event_program_id :selected').text()
    escaped_program = program.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(sections).filter("optgroup[label=#{escaped_program}]").html()
    console.log("options: " + options)
    if options
      $('#event_sections').html(options)
      $('#event_sections').parent().show()
    else
      $('#event_sections').empty()
      $('#event_sections').parent().hide()
      
  <%= @current_controller%>
    


