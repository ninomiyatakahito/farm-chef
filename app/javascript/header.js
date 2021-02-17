window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("lists")

  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:#FFBEDA;")
  })

  pullDownButton.addEventListener('mouseout', function(){
    console.log("mouseout OK")
  })

  pullDownButton.addEventListener('click', function() {
    console.log("click OK")
  })
})