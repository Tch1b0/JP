function changePhrase(){
    var phrases = ["Hello", "Hallo", "Bonjour", "Hej", "Olá", "Hola"];
    var pickedphrase = phrases[Math.floor(Math.random() * phrases.length)];
    document.getElementById("WelcomePhrase").innerText = pickedphrase;
}