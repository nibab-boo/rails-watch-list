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
import { movieMove } from '../components/movie_click_effect'; // this is importing the troublemaker
import { yann_card } from '../components/yann_card';
import { typingEffect, bannerTyper } from '../components/init_typed';
import { showCardEffect } from '../components/init_aos';
console.log("working");

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  const clickAble = document.querySelector('.show-movie-poster');
  if (clickAble) {
    movieMove(); // If I uncomment this, everything else don't work.
  }
  const buttons = document.querySelectorAll('.list-title');
  if (buttons) {
    circularButtonEffect();
  }
  const yanns_card = document.querySelector(".movie_poster")
  if (yanns_card) {
    yann_card();
  }
  showCardEffect();
  const typing_effect = document.querySelector("#typed-text")
  if (typing_effect) {
    typingEffect();
  }
  const banner_typer = document.querySelector("#cinema-banner-text")
  if (banner_typer) {
    bannerTyper();
  }
});




