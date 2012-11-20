jQuery ->
  $('#enrollment_section_id').parent().hide()
  $('#enrollment_student_id').parent().parent().hide()
  sections = $('#enrollment_section_id').html()
  console.log("section: " + sections)
  $('#enrollment_program').change ->
    program = $('#enrollment_program :selected').text()
    escaped_program = program.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(sections).filter("optgroup[label=#{escaped_program}]").html()
    console.log("options: " + options)
    if options
      $('#enrollment_section_id').html(options)
      $('#enrollment_section_id').parent().show()
      $('#enrollment_student_id').parent().parent().show()        
    else
      $('#enrollment_section_id').empty()
      $('#enrollment_section_id').parent().hide()
      $('#enrollment_student_id').parent().parent().hide()        
