$(document).ready ->
  $("#attendance_barcodes input").focus()
  $("#attendance_barcodes input").keyup(displayUnicode)

displayUnicode = ->
  _this = this
  @input = $("#attendance_barcodes input")
  @display = $('#student_checked')
  
  if @input.val()?.length == 12
    $.ajax
      url: '/checkin'
      data:
        barcode: @input.val(),
        event_id: url_query 'event_id'
      success: (data) =>
        # Success if called regardless of whether the actual call succeed, since
        # we are just returning JSON
        if data.error
          alert data.error
        else
          @display.html "<div>#{data.message}</div>"
          setTimeout (->
            _this.display.fadeOut('slow').html('').fadeIn('fast')
          ), 2000
          if data.attendees isnt null
            $('#attend').html('')
            attendees = $('<table/>').addClass("table table-striped")
            headers = $('<thead />')
            headers.append('<tr><th>Student</th><th>Phone Number</th><th>Barcode Number</th><th></th></tr>')
            attendees.append(headers)
            attendees_body = $('<tbody/>')
            for i of data.attendees
              row = $('<tr />')
              row.append('<td><a href="/students/'+data.attendees[i]['id']+'">'+data.attendees[i]['last_name']+ ', ' + data.attendees[i]['first_name'] + '</a></td>')
              if data.attendees[i]['cell_phone'] is null
                row.append('<td>No Phone Number</td>')
              else
                row.append('<td>'+formatPhone(data.attendees[i]['cell_phone'])+'</td>')
              if data.attendees[i]['is_visitor']
                row.append('<td><i class="icon-flag"></i>'+data.attendees[i]['barcode_number']+'</td>')
              else
                row.append('<td>'+data.attendees[i]['barcode_number']+'</td>')
              row.append('<td><a href="/notes/new?id='+data.attendees[i]['id']+'&source=student" class="btn btn-mini"><i class="icon-file"></i> Add note</a></td>');
              attendees_body.append(row)
            attendees.append(attendees_body)
            $('#attend').hide().html(attendees).show()
          else
            $('#attend').html('<h4>No Attendees</h4>')
          if data.absentees isnt null and typeof data.absentees isnt "undefined"
            $('#absent').html('')
            absentees = $('<table/>').addClass("table table-striped")
            headers = $('<thead />')
            headers.append('<tr><th>Student</th><th>Phone Number</th><th>Barcode Number</th><th></th></tr>')
            absentees.append(headers)
            absentees_body = $('<tbody/>')
            for j of data.absentees
              row = $('<tr />')
              row.append('<td><a href="/students/'+data.absentees[j]['id']+'">'+data.absentees[j]['last_name']+ ', ' + data.absentees[j]['first_name'] + '</a></td>')
              if data.absentees[j]['cell_phone'] is null
                row.append('<td>No Phone Number</td>')
              else
                row.append('<td>'+formatPhone(data.absentees[j]['cell_phone'])+'</td>')
              row.append('<td>'+data.absentees[j]['barcode_number']+'</td>')
              row.append('<td><a href="/notes/new?id='+data.absentees[j]['id']+'&source=student" class="btn btn-mini"><i class="icon-file"></i> Add note</a></td>');
              absentees_body.append(row)
            absentees.append(absentees_body)
            $('#absent').hide().html(absentees).show()
          else
            $('#absent').html('<h4>No Absentees</h4>')
    @input.val('')

# Parse URL Queries
url_query = (query) ->
  query = query.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")
  expr = "[\\?&]" + query + "=([^&#]*)"
  regex = new RegExp(expr)
  results = regex.exec(window.location.href)
  if results isnt null
    results[1]
  else
    false

# Example usage - http://www.kevinleary.net/?load=yes
url_param = url_query("load")
alert url_param  if url_param # "yes"


formatPhone = (phonenum) ->
  regexObj = /^(\d{3})(\d{3})(\d{4})$/
  if regexObj.test(phonenum)
    parts = phonenum.match(regexObj)
    phone = ""
    phone += parts[1] + "-" + parts[2] + "-" + parts[3]
    phone
  else
    #invalid phone number
    phonenum
