export const movieArrowAction = () => {
  const arrow = document.querySelector('.arrow');
  arrow.addEventListener("click", (e)=>{
    e.currentTarget.classList.toggle = "show"
  });
};