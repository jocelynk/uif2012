$(document).ready -> 
  $("#clickme").button().click ->
    $("#popup").dialog "open"
    $('.container').css('opacity', '0.2')

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
      
     
    
>>>>>>> f4ad9f68ec467bec85ef6b5ebd81e9115a8d60ad


