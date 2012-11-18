<<<<<<< HEAD
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
=======
$(document).ready -> 
  $("#clickme").button().click ->
>>>>>>> a587b98be5ef994fe4ab89050e4d205435729947
    $("#popup").dialog "open"

  $("#popup").dialog
    autoOpen: false
    height: 300
    width: 350
    modal: true

<<<<<<< HEAD
  sections = $("#event_sections").html()
  if $("#action").val() isnt "edit"
    $("#event_sections").parent().hide()
  else
    $("#event_sections").parent().show()
    changeSection(sections)
  $("#event_program_id").change ->
    changeSection(sections)
=======
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
      
     
    

>>>>>>> a587b98be5ef994fe4ab89050e4d205435729947
