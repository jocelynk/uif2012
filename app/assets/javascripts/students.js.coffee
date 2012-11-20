jQuery ->
  obj = 
    count: 0
    
  if document.getElementById('enrollment_nested_form') isnt null
    if document.getElementById('enrollment_nested_form').children.length <= 1
      $('form').on 'click', '.add_fields', (event) ->
        regexp = new RegExp($(this).data('id'), 'g')
        $(this).before($(this).data('fields').replace(regexp, obj.count++))
          
        fn = (obj) ->
          $('#student_enrollments_attributes_' + obj + '_section_id').parent().hide()
          sections = $('#student_enrollments_attributes_' + obj + '_section_id').html()
          console.log("section: " + sections)
          $(document).on( 'change', '#student_enrollments_attributes_' + obj + '_program', (event) ->
            program = $('#student_enrollments_attributes_' + obj + '_program'+' :selected').text()
            console.log($('#student_enrollments_attributes_' + obj + '_program'+' :selected'))
            escaped_program = program.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
            options = $(sections).filter("optgroup[label=#{escaped_program}]").html()
            console.log($(sections).filter("optgroup[label=#{escaped_program}]"))
            console.log("options: " + options)
            
            if options
              $('#student_enrollments_attributes_' + obj + '_section_id').html(options)
              console.log($('#student_enrollments_attributes_' + obj + '_section_id'));
              $('#student_enrollments_attributes_' + obj + '_section_id').parent().show()
            else
              $('#student_enrollments_attributes_' + obj + '_section_id').empty()
              $('#student_enrollments_attributes_' + obj + '_section_id').parent().hide() 
          )
        fn(obj.count-1)
        event.preventDefault()
    else
      $("#enrollment_nested_form").children(".fields").each ->
        self = this
        program_select = $(this).find('.field .pro select').attr('id')

        sections = $(this).find('.field .sec select').html()

        label = $(this).find('.field .sec select option:selected').parent().attr('label')
        text = $(this).find('.field .pro select option:contains('+label+')').val()
        $(this).find('.field .pro select').val(text)
        program = $(this).find('.field .pro select :selected').text()
        escaped_program = program.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        options = $(sections).filter("optgroup[label=#{escaped_program}]").html()
        $(this).find('.field .sec select').html(options)
        
        fn1 = ->
          $(document).on( 'change', '#'+program_select, (event) ->
              new_program = $(self).find('.field .pro select :selected').text()
              escaped_program = new_program.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
              options = $(sections).filter("optgroup[label=#{escaped_program}]").html()

              if options
                $(self).find('.field .sec select').html(options)
            )
        fn1()
        
      obj.count = $("#enrollment_nested_form").children(".fields").length+1  
      $('form').on 'click', '.add_fields', (event) ->
        console.log(obj.count)
        regexp = new RegExp($(this).data('id'), 'g')
        $(this).before($(this).data('fields').replace(regexp, obj.count++))
      
        fn2 = (obj) ->
          $('#student_enrollments_attributes_' + obj + '_section_id').parent().hide()
          sections = $('#student_enrollments_attributes_' + obj + '_section_id').html()
          console.log("section: " + sections)
          $(document).on( 'change', '#student_enrollments_attributes_' + obj + '_program', (event) ->
            program = $('#student_enrollments_attributes_' + obj + '_program'+' :selected').text()
            console.log($('#student_enrollments_attributes_' + obj + '_program'+' :selected'))
            escaped_program = program.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
            options = $(sections).filter("optgroup[label=#{escaped_program}]").html()
            console.log($(sections).filter("optgroup[label=#{escaped_program}]"))
            console.log("options: " + options)
            
            if options
              $('#student_enrollments_attributes_' + obj + '_section_id').html(options)
              console.log($('#student_enrollments_attributes_' + obj + '_section_id'));
              $('#student_enrollments_attributes_' + obj + '_section_id').parent().show()
            else
              $('#student_enrollments_attributes_' + obj + '_section_id').empty()
              $('#student_enrollments_attributes_' + obj + '_section_id').parent().hide() 
          )
        fn2(obj.count-1)
        event.preventDefault()
    
  
