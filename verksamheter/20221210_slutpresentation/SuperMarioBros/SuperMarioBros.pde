import processing.sound.*;
SoundFile file;
SoundFile files;

// maintheme
float plrx = 225;
float plry = 514;
float block_pos1 = 200;
float block_pos2 = 250;
StringList animateplr;
StringList animegomba;
int ganime = 0;
PImage img;
PImage gomba;
boolean gd = false;
boolean isjumping = false;
float timer = 0;
boolean debugShow = false;
float hastig_nedat = 0;
float gx = 400;
float gy = 514;

void setup() {
  frameRate(60);
  //file = new SoundFile(this, "maintheme.mp3");
  file = new SoundFile(this, "maintheme.mp3");
  file.play();
  size(1200, 650);
  animateplr = new StringList();
  animateplr.append("mario.png");
  animateplr.append("MSTW.png");
  img = loadImage("mario.png");


  animegomba = new StringList();
  animegomba.append("susgomba.png");
  animegomba.append("susgomba.png");
  animegomba.append("susgomba.png");
  animegomba.append("susgomba.png");
  animegomba.append("susgomba.png");
  animegomba.append("susgomba.png");
  animegomba.append("susgomba.png");
  animegomba.append("susgomba.png");
  animegomba.append("susgomba.png");
  animegomba.append("susgomba.png");
  animegomba.append("susgomba.png");
  animegomba.append("pwm.png");


  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
  animegomba.append("gomba.png");
}
void draw( ) {
  background(0, 150, 255);
  fill(255, 255, 255);
  textSize(56);
  text("World: 1-1", 500, 50);

  if (keyPressed)
  {
    if (key == 'd' ||key == 'D') {
      plrx = plrx + 3;
      block_pos1 = block_pos1 - 3;
      block_pos2 = block_pos2 - 3;
      String item = animateplr.get(1);
      img = loadImage(item);
    }

    if (key == 'a' ||key == 'A') {
      plrx = plrx - 3;
      String item = animateplr.get(1);
      img = loadImage(item);
    }

    if (keyPressed &&  key == '0') {
      debugShow = !debugShow;
    }
    if (key == 'q' ||key == 'Q' && isjumping == false) {
      hastig_nedat = 1;
    }
  }
  if (debugShow == true) {
    text(frameRate, 400, 200);
    text(plrx, 200, 50);
    text(plry, 800, 50);
    text(ganime, 200, 100);
    text(timer, 200, 200);
  }
  stroke(255, 150, 0);
  fill(255, 150, 0);
  rect(block_pos1, 600, 50, 50);
  rect(block_pos2, 600, 50, 50);
  stroke(255, 0, 0);
  fill(255, 0, 0);

  plry = plry - hastig_nedat;

  image(img, plrx, plry);
  if (block_pos1 <= 0) {
    block_pos1 = 1200;
  }
  if (block_pos2 <= 0) {
    block_pos2 = 1200;
  }
  if (plrx >= 1131) {
    plrx = 1131;
  }
  if (plrx <= 0) {
    plrx = 0;
  }
  String g = animegomba.get(ganime);
  gomba = loadImage(g);
  image(gomba, gx, gy);
  if (ganime <= 22 ) {
    ganime = ganime + 2;
  }

  if (ganime >= 22 ) {
    ganime = 0;
  }

  if (plry >= 678) {
    file.stop();
    files = new SoundFile(this, "death.mp3");
    files.play();
    while (true) ;
  }

  if (plrx > block_pos1 - 86 && plrx < block_pos1 + 50 + 32 && plry + 86 > 600)
  {
    hastig_nedat = 0;
    if (debugShow == true) {
      text("Landar", 800, 100);
    }

    if (plrx > gx - 86 && plrx < gx + 50 + 32 && plry + 86 > gy)
    {
      hastig_nedat = 1;
      if (debugShow == true) {
        text("gomba död", 800, 100);
      }
    }
  }
  if (plry < 175) {
    hastig_nedat = -hastig_nedat;
  }
  //rect(block_pos1, 600, 50, 50);
}
