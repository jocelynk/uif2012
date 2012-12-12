$(document).ready ->
      
  $("#meals input").focus()
  $("#meals input").keyup(displayUni)  

  sections = undefined
  sections = $("#event_sections").html()
  if $("#action").val() isnt "edit"  
    $("#event_sections").parent().hide()
  else
    changeSection(sections)
  $("#event_program_id").change ->
    changeSection(sections)
  
    
  

changeSection = (sections) ->
  escaped_program = undefined
  options = undefined
  program = undefined
  program = $("#event_program_id :selected").text()
  escaped_program = program.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, "\\$1")
  options = $(sections).filter("optgroup[label=" + escaped_program + "]").html()
  if options
    $("#event_sections").html options
    $("#event_sections").parent().show()
    if typeof gon isnt "undefined"
      if gon
        for id of gon.event_sections
          $('#event_sections').find('option[value='+gon.event_sections[id].section_id+']').prop('selected','selected')
  else
    $("#event_sections").empty()
    $("#event_sections").parent().hide()

  
displayUni = ->
  @input = $('input')
  @display = $('#meal_number')
  if gon
    @id = gon.event_id
  if @input.val()?.length == 12
    $.ajax
      url: '/events/'+@id+'/meals_served'
      data:
        barcode: @input.val()
      success: (data) =>
        if data.error
          console.error "Error scanning #{@input.val()}!"
          alert data.error
        else
          @display.html "<div>#{data.message}</div>"
  @input.val('')
