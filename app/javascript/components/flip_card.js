export const flipCardClick = () => {
  const flipCards = document.querySelector(".row.justify-content-center.mb-5") 
  console.log(flipCards);
  // flipCards.forEach((card) => {
    flipCards.addEventListener("click", (event) => {
        if (event.target.parentNode.parentNode.parentNode.classList.contains('flip-card')) {
          event.target.parentNode.parentNode.parentNode.classList.toggle("flipped");
        } else if (event.target.parentNode.parentNode.parentNode.parentNode.classList.contains('flip-card')) {
          event.target.parentNode.parentNode.parentNode.parentNode.classList.toggle("flipped"); 
        }       
    });
  // })
};