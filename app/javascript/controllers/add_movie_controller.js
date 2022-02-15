import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["input", "form","submit", "list", "cards", "add"]

  connect() {
    this.addTarget.style.display = "none"
  }

  search() {
    e.preventDefault();
    console.log("hello");
    // https://imdb-api.com/API/SearchMovie/k_j2w9qy6i/
    if (this.inputTarget.value.size > 0) {
      const url = `https://imdb-api.com/API/SearchMovie/k_j2w9qy6i/this.inputTarget`
    }
  }

  add(e) {
    // console.log(e.currentTarget);
    console.log(e);
    this.formTarget.style.display="none"
    this.addTarget.style.display = "block"
  }

  new(e) {
    console.log(e)
  }

  
  
  update(e) {
    e.preventDefault();
    const data = new FormData(this.formTarget)
    console.log(...data);
      const url = `https://imdb-api.com/API/SearchMovie/k_j2w9qy6i/${this.inputTarget.value}`
      fetch(url)
      .then(response => response.json())
      .then(data =>{
        console.log("inside fetch"); 
        console.log(data)
        if (data.results == "null") {
          const result = "<p>Cannot be empty</p>";
          this.cardsTarget.insertAdjacentHTML('afterbegin',result)
        } else if (data.results.length == 0) {
          const result = "NO movies found"
          this.cardsTarget.insertAdjacentHTML('afterbegin',result)
        } else {
          this.cardsTarget.innerHTML = "";
          data.results.forEach((result) => {
            const info = `
            <div class="col-auto mx-auto">
                <input type="hidden" name="movie[image]" value="${result.image}">
                <label class="bookmark-card-label">
                    <input type="radio" name="movie[id]" value="${result.id}">
                    <div class="new-bookmark-card shadow">
                    <img src = "${result.image}" class="new-bookmark-card bookmark-card-hover">
                    <p  lang="de" class="text-light">
                      ${result.title}
                    </p>
                  </div>
                </label>
              </div>
            `
            this.cardsTarget.insertAdjacentHTML('afterbegin',info)
          })
        }
        })
      // fetch(url,{
      //   method: "POST",
      //   body: data,
      //   mode: "no-cors",
      //   cache: "no-cache",
      //   headers: {
      //     "Content-Type": "form-data",
      //     'Accept': 'text/plain'
      //   }
      // }).then(response => response.text())
      // .then((data) => {
      //   this.listTarget.insertAdjacentHTML('beforeend', data);
      //   // console.log(data);
      // })
  }
}