count = 0
$(document).ready ->
  $("#Input").focus()
  $("#Input").keyup(displayunicode)
   
displayunicode = ->
  arr = undefined
  display = undefined
  unicode = undefined
  val = undefined
  arr = new Array()
  unicode = document.getElementById("Input").value
  display = document.getElementById("add-here")
  val = ""
  if unicode.length is 12
    count++
    unicode = document.getElementById("Input").value
    val = "<div class='ani'>" + "<span>" + count + "</span>" + ":" + unicode + "</div>"
    display.innerHTML += val
    document.getElementById("Input").value = ""
    $.ajax
      url: "/checkin"
      data:
        barcode: unicode,
        e_id: url_query("event_id") 
      success: (data) -> 
        console.log("asdfasdfasdfasdfas")
        console.log(data)
      err: (err) ->
        console.log(err)
      
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

