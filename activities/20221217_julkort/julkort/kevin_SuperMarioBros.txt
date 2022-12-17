import processing.sound.*;

SoundFile file;
SoundFile files;


// maintheme

float block_pos1 = 750;
float block_pos2 = 780;
StringList animateplr;
int gombaanimering = 10;
PImage img;
boolean isjumping = false;
float timer = 0;
boolean debugShow = false;
float hastig_nedat = 0;
float gx = 800;
float gy = 0;
int id = 0;
float cx = 300;
float cy = 200;
float plrx = 750;
float plry = 0;
Gomba gomba;
Blocks blocks;
Mario mario;
Items items;
void setup() {
  frameRate(60);
  file = new SoundFile(this, "maintheme.mp3");
  file.play();
  size(1000, 1000);

  img = loadImage("mario.png");
  img.resize(50, 50);
  gomba = new Gomba(gx, gy);
  blocks = new Blocks(770, 0, id);
  //items = new Items(0, cx, cy);
  mario = new Mario(plrx, plry);
}

void draw( ) {
  if(mario.Alive){
  marioScript();
  }else{rect(750,0,250,250);}
}
void marioScript(){
  mario.forever();
  rect(750,0,250,250);
  //background(0, 150, 255);
  fill(0, 150, 255);
  stroke(0, 150, 255);
  rect(750,0,250,250);
  fill(255);
  textSize(56);
  text("World: 1-1", 750, 0);

  gomba.startaAnimering();
  blocks.rita();
  //witems.rita();
  if (keyPressed)
  {


    //if (keyPressed &&  key == '0') {
     // debugShow = !debugShow;
    //s}
    if ((key == 'q' ||key == 'Q') && isjumping == false) {
      hastig_nedat = 1;
      isjumping = true;
      files = new SoundFile(this, "superjump.wav");
      files.play();
    }
  }
  if (debugShow == true) {
    text(frameRate, 400, 200);
    text(plrx, 200, 50);
    text(plry, 800, 50);
    //text(ganime, 200, 100);
    text(gx, 750, 0);
  }
  stroke(255, 150, 0);
  fill(255, 150, 0);
  rect(block_pos1, 60, 30, 30);
  rect(block_pos2, 60, 30, 30);
  stroke(255, 0, 0);
  fill(255, 0, 0);
  
  plry = plry - hastig_nedat; // obs: här har vi ett fel!!! fixa det KS16!!!
  // sus
  image(img, plrx, plry);
  if (block_pos1 <= 750) {
    block_pos1 = 950;
  }
  if (block_pos2 <= 750) {
    block_pos2 = 950;
  }
  if (plrx >= 950) {
    plrx = 950;
  }
  if (plrx <= 750) {
    plrx = 750;
  }

  if (plry >= 200) {
    file.stop();
    files = new SoundFile(this, "death.mp3");
    files.play();
    mario.Alive=false ;
  }

  if (plrx > block_pos1 - 86 && plrx < block_pos1 + 50 + 32 && plry + 86 > 600) {
    hastig_nedat = 0;
    isjumping = false;
    if (debugShow == true) {
      text("Landar", 800, 100);
    }
  if (plrx > cx - 86 && plrx < cx + 50 + 32 && cy + 86 > 600) {
    file.stop();
    files = new SoundFile(this, "smb_coin.wav");
    files.play();
    }

    if (isjumping == true) {
      hastig_nedat += 0.1;
    }
    //rect(600, 600, 50, 50);
  }
   if (plrx > cx - 86 && plrx < cx + 50 + 32 && cy + 86 > 600) {
    //file.stop();
    files = new SoundFile(this, "smb_coin.wav");
    files.play();
    }

    if (isjumping == true) {
      hastig_nedat -= 0.004;
    }
}
