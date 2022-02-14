import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["input", "form", "list", "submit"]

  connect() {
    console.log("connected");
    console.log(this.listTarget)
    console.log(this.formTarget)
    console.log(this.inputTarget);
    console.log(this.submitTarget);
  }
  
  update(e) {
    e.preventDefault();
    console.log(this.inputTarget.value);
    const url = `${this.formTarget.action}`
    console.log(url)
    const data = new FormData(this.formTarget)
    // data.append("title", this.inputTarget.value)
    console.log(...data);

    fetch(url,{
      method: "POST",
      body: data,
      mode: "no-cors",
      cache: "no-cache",
      headers: {
        "Content-Type": "form-data",
        'Accept': 'text/plain'
      }
    }).then(response => response.text())
    .then((data) => {
      this.listTarget.insertAdjacentHTML('beforeend', data);
      // console.log(data);
    })
  }
}