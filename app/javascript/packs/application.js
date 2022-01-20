// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import 'bootstrap';
import { circularButtonEffect } from '../components/index';
import { yann_card } from '../components/yann_card';
import { typingEffect } from '../components/init_typed';
import { showCardEffect } from '../components/init_aos';
// import { movieClickEffect } from '../components/movie_click_effect';
console.log("working");

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  showCardEffect();
  circularButtonEffect();
  yann_card();
  typingEffect();
  movieClickEffect();
});




