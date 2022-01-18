export const yann_card = () => {
  document.querySelector(".card-hello img")
    .addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("tapped");
  });
};
