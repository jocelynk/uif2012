<<<<<<< HEAD
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready -> 
  $("#clickme").button().click ->
=======
changeSection = (sections) ->
  escaped_program = undefined
  options = undefined
  program = undefined
  program = $("#event_program_id :selected").text()
  escaped_program = program.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, "\\$1")
  options = $(sections).filter("optgroup[label=" + escaped_program + "]").html()
  console.log "options: " + options
  if options
    $("#event_sections").html options
    $("#event_sections").parent().show()
  else
    $("#event_sections").empty()
    $("#event_sections").parent().hide()
$(document).ready ->
  sections = undefined
  $("#event_creation").button().click ->
>>>>>>> be39605e637ddead2290fe3cc0578f0f4707a756
    $("#popup").dialog "open"
    $('.container').css('opacity', '0.2')

  $("#popup").dialog
    autoOpen: false
    height: 300
    width: 350
    modal: true

<<<<<<< HEAD
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
      
     
    
=======
  sections = $("#event_sections").html()
  if $("#action").val() isnt "edit"
    $("#event_sections").parent().hide()
  else
    $("#event_sections").parent().show()
    changeSection(sections)
  $("#event_program_id").change ->
    changeSection(sections)
>>>>>>> be39605e637ddead2290fe3cc0578f0f4707a756


