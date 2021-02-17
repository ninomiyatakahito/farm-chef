window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("lists")

  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:#FFBEDA;")/*マウスオーバーの色 */
  })

  pullDownButton.addEventListener('mouseout', function(){
    pullDownButton.removeAttribute("style", "background-color:#FFBEDA;")/*マウスアウトの色 */
  })

  pullDownButton.addEventListener('click', function() {
    console.log("click OK")/*クリックした時の処理 */
  })
})