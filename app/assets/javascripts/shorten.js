$(function(){
  $("#shortener-field").focus();
  $("#copy").on('click', preventSubmit)
})

function newLink(link){
  toggleButton();
  addFormEventListener();
  replaceText(link);
}

function refreshTop100(content){
  $("tbody").html(content);
}

function revertToShortener(){
  removeFormEventListener();
  toggleButton();
}

function replaceText(text){
  $("#shortener-field").val(text)
  $("#shortener-field").select();
}

function toggleButton(){
  $(".form-button").toggleClass("hide")
}

function addFormEventListener(){
  $("#shortener-field").on("keydown", revertToShortener)
  $("#new_url").on("submit", preventSubmit)
}

function removeFormEventListener(){
  $("#shortener-field").off();
  $("#new_url").off();
}

function preventSubmit(e){
  e.preventDefault();
  e.stopPropagation();
}