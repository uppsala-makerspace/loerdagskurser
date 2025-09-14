boolean left, right, up, down, rotRight, rotLeft;
PImage background;
Player player;
Weapon[] weapon;
int weaponUsed = 0;
void setup(){
  //Gör så att spelet verkligen går 60 fps och har en bra storlek
  size(800,800);
  frameRate(60);
  //Skapar object
  player = new Player();
  weapon = new Weapon[1];
  weapon[0] = new Weapon();
  setupEnemyGui();
  //Sätter variabler som har med vilka knappar som är tryckta att göra
  left = false;
  right = false;
  up = false;
  down = false;
  rotRight=false;
  rotLeft=false;
  background = loadImage("background.png");
}

void draw(){
  background.resize(800, 801);
  image(background, 0,0);
  player.move(); //flyttar spelaren
  player.checkColision(); //Kollar om den har gått in i något
  weapon[weaponUsed].calculateWeapon();//räknar ut vapnet
  weapon[weaponUsed].displayWeapon();//Visar vapnet
  player.displayPlayer();//visar spelare
  Enemy();
  Health();
  
}
//Kollar om en knapp har blivigt tryckt
void keyPressed(){
  switch(keyCode){
   case 37: //left
     left=true;
     break;
   case 38: //up
     up = true;
     break;
   case 39: //right
     right = true;
     break;
   case 40: //down
     down = true;
     break;
   case 69: //E
     rotRight = true;
     break;
   case 81: //Q
     rotLeft = true;
     break;
  }
}
//Kollar om en knapp har blivigt Släppt
void keyReleased(){
  switch(keyCode){
   case 37: //left
     left=false;
     break;
   case 38: //up
     up = false;
     break;
   case 39: //right
     right = false;
     break;
   case 40: //down
     down = false;
     break;
   case 69: //E
     rotRight = false;
     break;
   case 81: //Q
     rotLeft = false;
     break;
  }
}
