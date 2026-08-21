import processing.sound.*;

boolean left, right, up, down, rotRight, rotLeft, chicken, ftLobby, ftDeath, deathSound;
PImage background,death,lobby;
int deathValue=241,firstTime = 0, play = 0;
Player player;
Weapon[] weapon;
int weaponUsed = 0;
int timer=0;

SoundFile intro;
SoundFile deathS;
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
  lobby = loadImage("lobby.png");
  //death.resize(800, (77/256*800)/120*firstTime);
  wave=1;
  thread("waveScript");
  timer=0;
  
}

void draw(){
  
  if(play == 0){
    if(deathSound == true){
      deathS.stop();
      deathSound = false;
    }
    if(ftLobby == false) { 
      intro = new SoundFile(this, "intro.wav");
    intro.play();
    }
    ftLobby= true;
    image(lobby, 0, 0);
    lobby.resize(800, 800);
    player.move();
    player.checkColision();
    player.displayPlayer();
    if(dist(player.x, player.y, 360, 700) < 100){ play= 1; }
      ftDeath = false;
    
    if(dist(player.x, player.y, 100, 600) < 150){ play = 2; }
      
  }
  
  if(play == 2){
    background(200, 200, 200);
    player.move();
    player.checkColision();
    player.displayPlayer();
    
    textSize(64);
    textAlign(CENTER);
    text("Press c for suprise ;)", 400, 400);
    if(chicken == true){play = 0;  setup(); }
  }
  
  if(play == 1){
    ftLobby = false;
  background = loadImage("background.png");
  death = loadImage("YOU DIED.png");
  background.resize(800, 801);
  image(background, 0,0);
  if(firstTime <= 240||deathValue<=240){
    textSize(128);
    textAlign(CENTER);
    if(firstTime <= 180){
      text(((180-firstTime)/60)+1, 400, 400);
    }else if(firstTime <= 240){
      text("GO", 400, 400);
    }
    if(deathValue <= 180){
      text(((180-deathValue)/60)+1, 400, 400);
    }else if(deathValue <= 240){
      text("GO", 400, 400);
    }
    firstTime++;
    if(deathValue<=240){
      if(ftDeath == false){
        deathS = new SoundFile(this, "death.wav");
    
        deathS.play();
        deathSound = true;
      }
      ftDeath = true;
      deathValue++;
      final PImage deathScreen = death.copy();
      
      if(deathValue<60){
        //deathScreen.resize(800, int((float)(( 77/256D*800)/120*firstTime)));
        tint(255,255/60*deathValue);
        image(deathScreen, width/2-(800/2),
        /*(500/60*deathValue)+
        (player.x/60*(60-deathValue))*/
        /*((player.y)/60*(60-deathValue))+
        ((500)/60*deathValue)
        -*/500-((int((float)(( death.height/256D*800)/60*deathValue)))/2),
        800,/*int((float)(( 77/256D*800)/60*deathValue))*/((int((float)(( death.height/256D*800)/60*deathValue)))));
        noTint();
        /*println(
        ((player.y)/60*(60-deathValue))+
        ((500)/60*deathValue)
        );*/
      }else{
       
        //deathScreen.resize(800, 77/256*800);
        /*image(deathScreen, width/2-(deathScreen.width/2),
        height/2-(deathScreen.height/2));*/
        image(deathScreen, width/2-(800/2),
        500-((int((float)( 77/256D*800)))/2),
        800,int((float)( 77/256D*800)));
      }
      if(deathValue==240){setup(); play = 0;}
    }
    return;
  } 
  intro.stop();
  timer++;
  player.move(); //flyttar spelaren
  player.checkColision(); //Kollar om den har gått in i något
  weapon[weaponUsed].calculateWeapon();//räknar ut vapnet
  weapon[weaponUsed].displayWeapon();//Visar vapnet
  player.displayPlayer();//visar spelare
  Enemy();
  Health();
  if(HP<0){deathValue=0;}
  }
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
     case 67: //C
     chicken = true;
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
