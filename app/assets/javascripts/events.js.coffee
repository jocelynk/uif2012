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
    if gon
      for id of gon.event_sections
       $('#event_sections').find('option[value='+gon.event_sections[id].section_id+']').prop('selected','selected')
  else
    $("#event_sections").empty()
    $("#event_sections").parent().hide()
$(document).ready ->
  sections = undefined
  $("#event_creation").button().click ->
    $("#popup").dialog "open"
    $('.container').css('opacity', '0.1')
  $("#popup").dialog
    autoOpen: false
    height: 300
    width: 350
    modal: true

  sections = $("#event_sections").html()
  if $("#action").val() isnt "edit"
    $("#event_sections").parent().hide()
  else
    changeSection(sections)
  $("#event_program_id").change ->
    changeSection(sections)
