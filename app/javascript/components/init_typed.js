import Typed from 'typed.js';

export const typingEffect = () => {
  let options = {
    strings: ['Before creating a list', 'let me ask you something', 'when was the last time', 'you created a note.', 'go on ', 'create your list'],
    typeSpeed: 40,
    loop: false
  };
  
  let typed = new Typed('#typed-text', options);
}

export const bannerTyper = () => {
  let godlyThing = ['CINEMA IS THE MOST<br>BEAUTIFUL FRAUD IN<br>THE WHOLE WORLD.<br><br>-  Jean-Luc Godard',
      'REAL IS GOOD.<br>INTERESTING IS BETTER.<br><br>- Stanley Kubrick',
      "I'm a film addict,<br>absolutely crazy<br>about cinema.<br><br>- Somebody",
      "CINEMA WITHOUT POPCORN<br>IS LIKE JERRY WITHOUT TOM.<br><br>-  Tom",
      'I BELIEVE IN NO TALENT,<br>I JUST BELIEVE IN<br>HARD-WORK AND DEDICATION.<br><br>- Something'
    ]
  let options = {
    strings: [godlyThing[[Math.floor(Math.random() * godlyThing.length)]]],
    typeSpeed: 50,
    loop: false,
    showCursor: false,
    contentType: 'html'
  };
  let typed = new Typed('#cinema-banner-text', options);
}