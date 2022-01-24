export const flipCardClick = () => {
  const flipCards = document.querySelectorAll(".flip-card") 
  flipCards.forEach((card) => {
    card.addEventListener("click", (event) => {
        event.currentTarget.classList.toggle("flipped");
    });
  })
};