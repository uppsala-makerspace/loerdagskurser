import processing.sound.*;

SoundFile walks;

Player play1, play2;
Menu menu;

int last_key_press = 0; // Last time, in milliseconds, when the last key was pressed
int x1=65;// storlek på bol.

boolean keyd;

void setup() {
  size(600,500,P3D);
  play1 = new Player(1);
  play2 = new Player(2);

  menu = new Menu();

  walks = new SoundFile(this, "star.mp3");
  walks.loop();
  noCursor();
  
  surface.setResizable(true);
}

void draw() {
  background(0);

  translate(width/2, height/2, 0);
  sphere(x1);
  translate(-width/2, -height/2, 0);


  strokeWeight(20);
  stroke(200);
  line(width/2,height,width/2,0);

  play1.show();
  play1.move();
  play1.where();

  play2.show();
  play2.move();
  play2.where();

  if (keyd==false&&key==TAB&&keyPressed == true&&millis()-last_key_press>500) {
    keyd = true;
    last_key_press = millis();
  } else if (keyd==true&&key==TAB&&keyPressed == true&&millis()-last_key_press>500) {
    keyd=false;
    last_key_press = millis();
  }

  if (keyd==true) {
    menu.show();
    menu.texts();
  }
  
  fill(200);
  ellipse(mouseX, mouseY, 25, 25);
}

void keyPressed() {
  if (keyd == false) {
    if (keyCode == UP) play1.upIsDown = true;
    
    if (keyCode == DOWN) play1.doIsDown = true;
    
    if (keyCode == RIGHT) play1.riIsDown = true;
    
    if (keyCode == LEFT) play1.leIsDown = true;
    
    if (key == 'w') play2.wIsDown = true;
    
    if (key == 's') play2.sIsDown = true;
    
    if (key == 'd') play2.dIsDown = true;
    
    if (key == 'a') play2.aIsDown = true;
    
  }
  if (keyd == true) {
    if (keyCode == UP) play1.upIsDown = false;
    
    if (keyCode == DOWN) play1.doIsDown = false;
    
    if (keyCode == RIGHT) play1.riIsDown = false;
    
    if (keyCode == LEFT) play1.leIsDown = false;
    
    if (key == 'w') play2.wIsDown = false;
    
    if (key == 's') play2.sIsDown = false;
    
    if (key == 'd') play2.dIsDown = false;
    
    if (key == 'a') play2.aIsDown = false;
    
  }
}

void keyReleased() {
  if (keyCode == UP) play1.upIsDown = false;
  
  if (keyCode == DOWN) play1.doIsDown = false;
  
  if (keyCode == RIGHT) play1.riIsDown = false;
  
  if (keyCode == LEFT) play1.leIsDown = false;
  
  if (key == 'w') play2.wIsDown = false;
  
  if (key == 's') play2.sIsDown = false;
  
  if (key == 'd') play2.dIsDown = false;
  
  if (key == 'a') play2.aIsDown = false;
}
