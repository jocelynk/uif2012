jQuery ->
  obj = 
    count: 0   
  $('form').on 'click', '.add_fields', (event) ->
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, obj.count++))
      
    fn = (obj) ->
      $('#student_registrations_attributes_' + obj + '_section_id').parent().hide()
      sections = $('#student_registrations_attributes_' + obj + '_section_id').html()
      console.log("section: " + sections)
      $(document).on( 'change', '#student_registrations_attributes_' + obj + '_program', (event) ->
        program = $('#student_registrations_attributes_' + obj + '_program'+' :selected').text()
        console.log($('#student_registrations_attributes_' + obj + '_program'+' :selected'))
        escaped_program = program.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(sections).filter("optgroup[label=#{escaped_program}]").html()
        console.log($(sections).filter("optgroup[label=#{escaped_program}]"))
        console.log("options: " + options)
        
        if options
          $('#student_registrations_attributes_' + obj + '_section_id').html(options)
          $('#student_registrations_attributes_' + obj + '_section_id').parent().show()
        else
          $('#student_registrations_attributes_' + obj + '_section_id').empty()
          $('#student_registrations_attributes_' + obj + '_section_id').parent().hide() 
      )
    fn(obj.count-1)
    event.preventDefault()
  
