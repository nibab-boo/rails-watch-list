const circularButtonEffect = () =>   {
  const buttons = document.querySelectorAll('.list-title');
  console.log("I am in circular effect");
  const image_finder = (e) => {
    let image_box = e.currentTarget.parentElement.previousElementSibling;
    let images = image_box.querySelectorAll("img");
    if (e.type == 'mouseover') {
      images.forEach(image => image.classList.add("image-hover"));
    } else {
      images.forEach(image => image.classList.remove("image-hover"));
    }
  };

  buttons.forEach(button => {
    button.addEventListener("mouseover", image_finder, false);
    button.addEventListener("mouseout", image_finder,false);
  });
};

export { circularButtonEffect };