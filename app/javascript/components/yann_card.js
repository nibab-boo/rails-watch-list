export const yann_card = () => {
  const movie_posters = document.querySelectorAll(".movie_poster"); 
  movie_posters.forEach((element) => {
    element.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("tapped");
    });
  });
};
