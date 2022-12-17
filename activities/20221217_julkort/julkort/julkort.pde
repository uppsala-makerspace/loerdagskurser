
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

void setup_kevin() {
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


int ramis_current_red = 0;
int ramis_current_green = 0;
int ramis_current_blue = 0;
int ramis_red_change = 1;
int ramis_green_change = 2;
int ramis_blue_change = 3;
int ramis_current_size_x = 50;
int ramis_current_size_y = 50;

int ramis_min_x = 250;
int ramis_max_x = 499;
int ramis_min_y = 500;
int ramis_max_y = 749;

int bjorn_xstart = 500;
int bjorn_ystart = 500;
int bjorn_mossbredd = 50;
int bjorn_moss_hojd = 75;
int bjorn_moss_position_y = 25;
int bjorn_ogon_bredd = 25;
int bjorn_ogon_position_y = 15;
int bjorn_pupill_position_max_y = 25;
int bjorn_pupill_position_min_y = 5;
int bjorn_pupill_position_y = 15;
int bjorn_pupill_position_max_x = 25;
int bjorn_pupill_position_min_x = 5;
int bjorn_pupill_position_x = 15;
int bjorn_pupill_addering = -1;


lift Lift = new lift(500,750);

int ludvigCount = 0;
int ludvigTextX = 760;
float ludvigSnowX = 0;
float ludvigSnowY = 0;

void setup()
{
  size(1000, 1000);
  setup_gunnar();
  setup_kevin();
  setup_bjorn();
background(0);
  
}

void draw()
{
  // Vidar
  draw_vidar();

  // Herman
  
  // Gunnar
  draw_gunnar();
  // Kevin
  draw_kevin();

  // Richel
  fill(255, 128, 0);
  rect(250, 250, 250, 250); 

  // Christoffer
  drawRamis();

  // Bjoern
  draw_bjorn();

  // Leonid
  Lift.drawLift();

  // Ludvig
  draw_ludvig();
  
  // GOD JUL
  fill(256,0,0);
  textSize(200);
  text("G", 0, 250 + 250);
  text("O", 500, 250 + 250);
  text("D", 750, 250 + 250);
  }

void drawRamis() {
  stroke(0, 0, 0);
  fill(0, 0, 0);
  square(ramis_min_x, ramis_min_y, 249);
  
  ramis_current_red += ramis_red_change;
  ramis_current_green += ramis_green_change;
  ramis_current_blue += ramis_blue_change;
  
  if (ramis_current_red > 255) {
    ramis_current_red = 255;
    ramis_red_change = -ramis_red_change;
  } else if (ramis_current_red < 0) {
    ramis_current_red = 0;
    ramis_red_change = -ramis_red_change;
  }
  
  if (ramis_current_green > 255) {
    ramis_current_green = 255;
    ramis_green_change = -ramis_green_change;
  } else if (ramis_current_green < 0) {
    ramis_current_green = 0;
    ramis_green_change = -ramis_green_change;
  }
  
  if (ramis_current_blue > 255) {
    ramis_current_blue = 255;
    ramis_blue_change = -ramis_blue_change;
  } else if (ramis_current_blue < 0) {
    ramis_current_blue = 0;
    ramis_blue_change = -ramis_blue_change;
  }
  
  // Body
  int center_x = (ramis_min_x+ramis_max_x)/2;
  int center_y = (ramis_min_y+ramis_max_y)/2;
  stroke(ramis_current_red, ramis_current_green, ramis_current_blue);
  fill(ramis_current_red, ramis_current_green, ramis_current_blue);
  ellipse(center_x,
    center_y, 
    249, 
    249);
  
  // Body parts
  stroke(ramis_current_green, ramis_current_blue, ramis_current_red);
  fill(ramis_current_green, ramis_current_blue, ramis_current_red);
  ellipse(center_x-50,
    center_y-50, 
    20, 
    20);
  ellipse(center_x+50,
    center_y-50, 
    20, 
    20);
  ellipse(center_x,
    center_y, 
    20, 
    20);
    
  ellipse(center_x-70,
    center_y+40, 
    20, 
    20);
  ellipse(center_x+70,
    center_y+40, 
    20, 
    20);
  ellipse(center_x-45,
    center_y+50, 
    20, 
    20);
  ellipse(center_x+45,
    center_y+50, 
    20, 
    20);
  ellipse(center_x-18,
    center_y+55, 
    20, 
    20);
  ellipse(center_x+18,
    center_y+55, 
    20, 
    20);
}


void draw_kevin( ) {
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

void draw_vidar()
{
  fill(#813B05);

  stroke(#502E02);
  rect(100, 200, 50, 50);
  //line(100, 200, 100, 250);
  stroke(#502E02);
  //line(150, 200, 150, 250);
  stroke(#1B8105);
  line(0, 200, 250, 200);
  stroke(#1B8105);
  line(125, 0, 250, 200); 
  stroke(#1B8105);
  fill(#1B8105);
  triangle(0, 200, 125, 0, 250, 200); 
  //line(125, 0, 250, 200); 
  line(125, 0, 250, 200); 
  line(125, 0, 250, 200); 
  line(125, 0, 250, 200); 
  line(125, 0, 250, 200); 
  line(125, 0, 250, 200); 
  
}






































void setup_bjorn() {
  size(1000, 1000);
}

void draw_bjorn() {


  color c = color(255, 100, 100);
  fill(c);  // Use color variable 'c' as fill color
  noStroke();
  rect( bjorn_xstart, bjorn_ystart, 250, 250);
  c = color(255, 255, 255);
  fill(c);  // Use color variable 'c' as fill color
  stroke(1);
  ellipse(bjorn_xstart+125, bjorn_ystart+125, 100, 120);


  c = color(10, 100, 10); //Mössa
  fill(c);
  stroke(1);
  triangle(bjorn_xstart+125-bjorn_mossbredd, bjorn_ystart+125-bjorn_moss_position_y, bjorn_xstart+125, bjorn_ystart+50-bjorn_moss_position_y, bjorn_xstart+125+bjorn_mossbredd, bjorn_ystart+125-bjorn_moss_position_y);

  c = color(255, 100, 100); //Näsa
  fill(c);
  ellipse(bjorn_xstart+125, bjorn_ystart+135, 15, 20);


  c = color(255, 255, 255); //pupiller
  fill(c);  
  if (bjorn_pupill_position_y>=bjorn_pupill_position_max_y)
    bjorn_pupill_addering = -1;
  if (bjorn_pupill_position_y<=bjorn_pupill_position_min_y)
    bjorn_pupill_addering = 1;
  bjorn_pupill_position_y+=bjorn_pupill_addering;

  textSize(128);
//  text(bjorn_pupill_position_y, 40, 120);


  ellipse(bjorn_xstart+125+bjorn_ogon_bredd, bjorn_ystart+125-bjorn_ogon_position_y, 15, 20);//ögon
  ellipse(bjorn_xstart+125-bjorn_ogon_bredd, bjorn_ystart+125-bjorn_ogon_position_y, 15, 20);//ögon
  c = color(0, 0, 0);
  fill(c);  // Use color variable 'c' as fill color
  stroke(1);
  ellipse(bjorn_xstart+125+bjorn_ogon_bredd, bjorn_ystart+125-bjorn_pupill_position_y, 5, 5);//Pupill
  ellipse(bjorn_xstart+125-bjorn_ogon_bredd, bjorn_ystart+125-bjorn_pupill_position_y, 5, 5);//Pupill
  
  
  c = color(255, 255, 255);
  fill(c);  // Use color variable 'c' as fill color
  stroke(1);
  arc(bjorn_xstart+125, bjorn_ystart+125+30, 50, 50, 0+bjorn_pupill_position_y/40.0, PI-bjorn_pupill_position_y/40.0);
  noFill();
}



int Gunnar_numFrames = 12;  // The number of frames in the animation
int Gunnar_currentFrame = 0;
PImage[] images = new PImage[Gunnar_numFrames];

void setup_gunnar()
{
  //frameRate(4);
  
  images[0]  = loadImage("Gunnar1.png");
  images[1]  = loadImage("Gunnar2.png"); 
  images[2]  = loadImage("Gunnar3.png");
  images[3]  = loadImage("Gunnar4.png"); 
  images[4]  = loadImage("Gunnar5.png");
  images[5]  = loadImage("Gunnar6.png");
  images[6]  = loadImage("Gunnar7.png");
  images[7]  = loadImage("Gunnar8.png"); 
  images[8]  = loadImage("Gunnar9.png");
  images[9]  = loadImage("Gunnar10.png"); 
  images[10]  = loadImage("Gunnar11.png");
  images[11]  = loadImage("Gunnar12.png");
}

int gunnar_frame = 0;

void draw_gunnar()
{
  ++gunnar_frame;
  background(256,256,256);
  rect(500,0,250,250);
  if (gunnar_frame % 8 == 0)
  {
    Gunnar_currentFrame = (Gunnar_currentFrame+1) % Gunnar_numFrames;  // Use % to cycle through frames
  }
  int offset = 0;
  for (int x = 0; x < 6; x += images[0].width/200) { 
    image(images[(Gunnar_currentFrame+offset) % Gunnar_numFrames], 500, 0);
    offset+=2;
  }

}

void draw_ludvig(){
  stroke(0);
  fill(0);
  rect(750, 750, 1000, 1000);
  fill(255, 255, 255);
  ellipse(875, 955, 150, 150);
  fill(255, 0, 0);
  triangle(775, 950, 875, 780, 975, 950);
  fill(255, 125, 150);
  ellipse(875, 955, 100, 50);
  
  
  
  fill(255);
  ellipse(875,780, 30, 30);
  fill(155, 155, 255);
  textSize(50);
  text("Ha En Hoo", ludvigTextX, 800);
  textSize(40);
  text("Tastisk Jul", ludvigTextX + 30, 850);
  ludvigCount = ludvigCount + 1;
  if( ludvigCount >= 60 && ludvigCount <= 200){
    ludvigTextX = ludvigTextX + 2;
  }
  if(ludvigCount > 200){
    noStroke();
    fill(255);
    ellipse(random(756, 1000), random(756, 1000), 6, 6);
  }
}
