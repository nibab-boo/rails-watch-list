const circularButtonEffect = () =>   {
  const buttons = document.querySelectorAll('.list-title');

  const image_finder = (e) => {
    let image_box = e.currentTarget.parentElement.previousElementSibling;
    console.log("working");
    let images = image_box.querySelectorAll("img");
    images.forEach(image => image.classList.toggle("image-hover"));
  };

  buttons.forEach(button => {
    button.addEventListener("mouseover", image_finder, false);
    button.addEventListener("mouseout", image_finder,false);
  });
};

export { circularButtonEffect };