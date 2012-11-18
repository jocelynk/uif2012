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

