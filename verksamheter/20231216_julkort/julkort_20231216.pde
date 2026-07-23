import processing.sound.*;

SoundFile walks;

Player1 play1;
Player2 play2;

boolean green, negro;

float malekX = 200;
float malekgron = 0;
float danielfarg = 0;
fysicmotor fmotor;
PImage hhj;

void setup() {
  size(300,300,P3D);
  play1 = new Player1();
  play2 = new Player2();

  walks = new SoundFile(this, "star.mp3");
  //walks.loop(); //For now
  
  for (int i = 0; i != 4; ++i)
  {
    line(0, i * 100, width, i * 100);
    line(i * 100, 0, i * 100, height);
  }
  
  textAlign(CENTER);
  textSize(100);
  fmotor =  new fysicmotor();
  hhj = loadImage("hhj.png");
  hhj.resize(70,120);
  fmotor.ksetups();
}

void draw() {
  noStroke();
  fill(200);
  rect(0, 0, 300, 200);
  rect(0, 200, 200, 100);
  fill(0);
  rect(100, 0, 100, 100);
  
  for (int i = 0; i != 4; ++i)
  {
    stroke(0);
    strokeWeight(1);
    line(0, i * 100, width, i * 100);
    line(i * 100, 0, i * 100, height);
  }
  
  if (key == 'g')negro=false;
  if (key == 'g')green=true;
  if (key == 'n')negro=true;
  if (key == 'n')green=false;
  if (green == true) rect(100, 0, 100, 100);
  if (negro == true) rect(100, 0, 100, 100);

  strokeWeight(20);
  stroke(255);
  line(width/2, 100, width/2, 0);

  play1.show();
  play1.move();
  play1.where();

  play2.show();
  play2.move();
  play2.where();

  stroke(0);
  fill(0);
  
  
  
  textSize(32);
  text("Svenskar är galna", -25, -25);
  stroke(malekX - 200, malekgron, random(256));
  fill(malekX - 200, malekgron, random(256));
  noStroke();
  rect(malekX, height - 80, 50, 50);
  malekX = malekX + 1;
  malekgron = malekgron + 2;
  if (malekX > width + 50)
  {
    malekX = 200;
  }
  if (malekgron > 255)
  {
  malekgron = 0;
  }
  fill(128 + random(127), 128 + random(127), 128 + random(127));
  rect(200,100,100,100);
  fill(0, danielfarg, 0);
  ellipse(50, 50, 100, 100);
  fill(danielfarg, 0, 0);
  ellipse(50, 50, 50, 50);
  danielfarg += 1;
  if (danielfarg  == 255)
  {
    danielfarg= 0;
  }
  fill(255,255,255);
  rect(100,100,100,100);
  image(hhj,100,80);
  fmotor.kdraws();
  
  fill(255, 0, 0);
  
  
  
  textSize(85);
  text("GO", 50, 180);
  text("DJ", 50, 280);
  text("UL", 150, 280);
  
  //ha hdraw(); langst ner
  hdraw();
}

void keyPressed() {
  if (keyCode == UP) {
    play1.upIsDown = true;
  }
  if (keyCode == DOWN) {
    play1.doIsDown = true;
  }
  if (keyCode == RIGHT) {
    play1.riIsDown = true;
  }
  if (keyCode == LEFT) {
    play1.leIsDown = true;
  }
  if (key == 'w') {
    play2.wIsDown = true;
  }
  if (key == 's') {
    play2.sIsDown = true;
  }
  if (key == 'd') {
    play2.dIsDown = true;
  }
  if (key == 'a') {
    play2.aIsDown = true;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    play1.upIsDown = false;
  }
  if (keyCode == DOWN) {
    play1.doIsDown = false;
  }
  if (keyCode == RIGHT) {
    play1.riIsDown = false;
  }
  if (keyCode == LEFT) {
    play1.leIsDown = false;
  }
  if (key == 'w') {
    play2.wIsDown = false;
  }
  if (key == 's') {
    play2.sIsDown = false;
  }
  if (key == 'd') {
    play2.dIsDown = false;
  }
  if (key == 'a') {
    play2.aIsDown = false;
  }
}

void hdraw() {
  copy(mouseX - 50, mouseY - 50, 100, 100, 200, 0, 100, 100);
}
