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
      url: "/"
      data:
        barcode: unicode
      success: (data) ->
