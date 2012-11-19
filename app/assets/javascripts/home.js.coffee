$(document).ready ->
  $("#Input").focus()
  $("#Input").keyup(displayUnicode)
  
displayUnicode = ->
  @input = $('#Input')
  @display = $('#add-here')

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
          console.error "Error scanning #{@input.val()}!"
          alert data.error
        else
          @display.html "<div>#{data.message}</div>"
          console.log(data.attendees)
          console.log(data.absentees)
          if data.attendees isnt null
            attendees = $('<table/>').addClass("table table-striped")
            headers = $('<thead />')
            headers.append('<tr><th>Student</th><th>Barcode</th></tr>')
            attendees.append(headers)
            attendees_body = $('<tbody/>')
            for i of data.attendees
              row = $('<tr />')
              row.append('<td>'+data.attendees[i]['last_name']+ ', ' + data.attendees[i]['first_name'] + '</td>')
              row.append('<td>'+data.attendees[i]['barcode_number']+'</td>')
              attendees_body.append(row)
            attendees.append(attendees_body)
            $('#attend').hide().html(attendees).show()
          if data.absentees isnt null
            absentees = $('<table/>').addClass("table table-striped")
            headers = $('<thead />')
            headers.append('<th>Student</th><th>Barcode</th>')
            absentees.append(headers)
            absentees_body = $('<tbody/>')
            for i of data.absentees
              row = $('<tr />')
              row.append('<td>'+data.absentees[i]['last_name']+ ', ' + data.absentees[i]['first_name'] + '</td>')
              row.append('<td>'+data.absentees[i]['barcode_number']+'</td>')
              absentees_body.append(row)
            absentees.append(absentees_body)
            $('#absent').hide().html(absentees).show()  
            
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

