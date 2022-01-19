import Typed from 'typed.js';

export const typingEffect = () => {
  console.log("working");
  let options = {
    strings: ['Before creating a list', 'let me ask you something', 'when was the last time', 'you created a note.', 'go on ', 'create your list'],
    typeSpeed: 40,
    loop: true
  };
  
  let typed = new Typed('#typed-text', options);
}