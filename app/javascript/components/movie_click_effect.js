const clickAble = document.querySelector('.show-movie-poster');
export const movieClickEffect = clickAble.addEventListener("click", ()=> {
  const moveAble = document.getElementById('show-movie-info');
  let bottomVal = parseInt(moveAble.style.bottom, 10);
  let rightVal = parseInt(moveAble.style.right, 10);
  if (bottomVal <= -250){
    moveAble.dataset.value = '20'
  }
  else if(bottomVal >= -40) {
    moveAble.dataset.value = "-20"
  }
  let value = parseInt(moveAble.dataset.value, 10);
  moveAble.style.bottom = (bottomVal + value) + "px";
  moveAble.style.right = (rightVal + (value/2)) + "px";
});