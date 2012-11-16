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
  console.log typeof $("#action").val()
  $("#event_creation").button().click ->
    $("#popup").dialog "open"

  $("#popup").dialog
    autoOpen: false
    height: 300
    width: 350
    modal: true

  sections = $("#event_sections").html()
  if $("#action").val() isnt "edit"
    $("#event_sections").parent().hide()
  else
    $("#event_sections").parent().show()
    changeSection(sections)
  console.log "section: " + sections
  $("#event_program_id").change ->
    changeSection(sections)


