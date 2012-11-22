$(document).ready ->
      
  $("#meals input").focus()
  $("#meals input").keyup(displayUni)  

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

  
displayUni = ->
  @input = $('input')
  console.log(@input)
  console.log(@input.val())
  @display = $('#add-here')
  if gon
    @id = gon.event_id
    console.log(@id)
    console.log("gon")
  if @input.val()?.length == 12
    console.log("sigh")
    $.ajax
      url: '/events/'+@id+'/meals_served'
      data:
        barcode: @input.val()
      success: (data) =>
        # Success if called regardless of whether the actual call succeed, since
        # we are just returning JSON
        console.log(data)
        if data.error
          console.error "Error scanning #{@input.val()}!"
          alert data.error
        else
          @display.html "<div>#{data.message}</div>"
  @input.val('')
