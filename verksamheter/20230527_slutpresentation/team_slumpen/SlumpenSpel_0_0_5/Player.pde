class Player{
  //Skapar alla variabler
  float x,y, w, h;
  float charSizeX = 60;
  float charSizeY = 66;
  float speedX, speedY, maxSpeed;
  PImage skin;
  Player(){
    //laddar in spelaren
    if(chicken == false){
    skin = loadImage("playerTexture.png");
    }
    if(chicken == true){
    skin = loadImage("chicken.png");
    }
    x=width/2;
    y = height/2;
    w = charSizeX;
    h = charSizeY;
    maxSpeed = 10;
    speedX = 0;
    speedY= 0;
    fill(255, 0, 0);
  }
  
  
  
  //methods
  void move(){
    if(left){
      speedX = -maxSpeed;
    }
    if(right){
      speedX = maxSpeed;
    }
    
    if(!left && !right){
      speedX = 0;
    }
    if(left && right){
     speedX = 0; 
    }
    
    if(up){
      speedY = -maxSpeed;
    }
    if(down){
      speedY = maxSpeed;
    }
    
    if(!up && !down){
      speedY = 0;
    }
    if(up && down){
     speedY = 0; 
    }
    
    x += speedX;
    y += speedY;
    fill(0,0,0);
  }
 
  
  
void checkColision(){
  if(x <= -1+charSizeX/2){
    x=charSizeX/2;
  }
  if(x >= width-charSizeX/2){
    x=width-charSizeX/2;
  }
  
  if(y <= -1+charSizeY/2){
    y=charSizeY/2;
  }
  if(y >= height-charSizeY/2){
    y=height-charSizeY/2;
  }
}
  
  
  
void displayPlayer(){
    
    image(skin, x-(charSizeX/2), y-(charSizeY/2));
    fill(0);
    //ellipse(x,y,charSizeX,charSizeY);
    fill(255);
  }
}
