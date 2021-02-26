window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull-down")/**プルダウンメニューの定義 */

  pullDownButton.addEventListener('mouseover', function(){
    pullDownButton.setAttribute("style", "background-color:#FFBEDA;")/*マウスオーバーの色 */
  })

  pullDownButton.addEventListener('mouseout', function(){
    pullDownButton.removeAttribute("style", "background-color:#FFBEDA;")/*マウスアウトの色 */
  })

  pullDownButton.addEventListener('click', function() {
    if (pullDownParents.getAttribute("style") == "display:block;") {
      // pullDownParentsにdisplay:block;が付与されている場合,実行される
      pullDownParents.removeAttribute("style", "display:block;")
    } else {
      // pullDownParentsにdisplay:block;が付与されていない場合実行される
      pullDownParents.setAttribute("style", "display:block;")
    }/*プルダウンメニューが表示される。クリックした時の処理 */
  })
})


