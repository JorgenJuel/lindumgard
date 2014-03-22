
/*
 * Snippet Author: CSS-Tricks
 * src: http://css-tricks.com/snippets/javascript/addclass-function/
 */
function addClass(id,new_class){
 var i,n=0;

 new_class=new_class.split(",");

 for(i=0;i<new_class.length;i++){
   if((" "+document.getElementById(id).className+" ").indexOf(" "+new_class[i]+" ") === -1){
     document.getElementById(id).className+=" "+new_class[i];
     n++;
   }
  }

 return n;
}



/*
 * Author: Jørgen Juel
 */

/*
 * Created from above snippet
 */
function removeClass(id,old_class){
  var i,n=0;

  old_class=old_class.split(",");

  for(i=0;i<old_class.length;i++){
   if((" "+document.getElementById(id).className+" ").indexOf(" "+old_class[i]+" ") === 1){
      var classes = document.getElementById(id).className;
     document.getElementById(id).className = classes.replace(old_class[i], "");
     n++;
   }
  }

  return n;
}

function hasClass(id, checkClass){
  if(document.getElementById(id).className.search(checkClass) !== -1){
    return 1;
  }else{
    return 0;
  }
}

/*
 * On menubutton click, activate or deactivate mobile menu
 */
var menuButton = document.getElementById("mobile-menu");
menuButton.onclick = function () {
  if(hasClass("main-menu", "active")){
    removeClass("main-menu", "active");
  }else{
    addClass("main-menu", "active");
  }
  return false;
};



/*
 * On scroll past header, activate menubar
 */
//var body = document.getElementsByTagName("body");
function onScrollEventHandler(){
  console.log(window.pageYOffset);
  if(window.pageYOffset>95){
    addClass("main-header", "scrolled");
  }else{
    removeClass("main-header", "scrolled");
  }
}
if(window.addEventListener){
  window.addEventListener('scroll', onScrollEventHandler, false);
}else if(window.attachEvent){
  window.attachEvent('scroll', onScrollEventHandler);
}