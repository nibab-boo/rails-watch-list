export const yann_card = () => {
  document.querySelector(".movie_poster").addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("tapped");
  });
};
