displayunicode = ->
  arr = new Array()
  
  # var unicode=e.keyCode? e.keyCode : e.charCode
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
      data: #IN HERE IS A JSON OBJECT CONTAINING ALL THE JS VARIABLES YOU
        #WANT TO PASS TO CONTROLLER
        barcode: unicode

      success: (data) -> #make a flash alert or something }// this is the rendered response

$(document).ready ->
  $("#Input").focus()
  count = 0

#from the RoR controller }
