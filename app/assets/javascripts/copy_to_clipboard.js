$(function(){
  var client = new ZeroClipboard($("#copy"))
  client.on("copy", copyToClipboard)
})

function copyToClipboard(event) {
  var clipboard = event.clipboardData;
  var text = $("#shortener-field").val();
  clipboard.setData("text/plain", text)
}