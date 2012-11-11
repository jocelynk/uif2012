jQuery ->
  $('#registration_section_id').parent().hide()
  $('#registration_student_id').parent().parent().hide()
  sections = $('#registration_section_id').html()
  console.log("section: " + sections)
  $('#registration_program').change ->
    program = $('#registration_program :selected').text()
    escaped_program = program.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(sections).filter("optgroup[label=#{escaped_program}]").html()
    console.log("options: " + options)
    if options
      $('#registration_section_id').html(options)
      $('#registration_section_id').parent().show()
      $('#registration_student_id').parent().parent().show()        
    else
      $('#registration_section_id').empty()
      $('#registration_section_id').parent().hide()
      $('#registration_student_id').parent().parent().hide()        
