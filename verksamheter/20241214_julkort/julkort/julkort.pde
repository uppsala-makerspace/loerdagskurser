float alfred_x1 = 0;
float alfred_x2 = 0;
float alfred_x3 = 0;
float alfred_x4 = 0;
float alfred_x5 = 0;
float alfred_x6 = 0;

float enrico_x = -200;
int enrico_c = -300;
int enrico_b = -400;
int enrico_g = -500;
int enrico_n = -600;
int enrico_h = - 700;
int enrico_l = -800;
int enrico_i = - 900;
int enrico_o = - 1000;
int enrico_k = -1100;
int enrico_Y = -1200;
int enrico_j = -1300;

PImage felipe_image;

PImage herman_julgran;

//Leonid
int lrfx = 400;
PImage lrMask;
PImage heMask;
PGraphics lrVid;
PGraphics heVid;

// Kevin
import gifAnimation.*;
Gif train;
PImage trainbg;

float malekX = 610;
float malekgron = 0;

PImage pablo_image;

void setup_felipe()
{
  felipe_image = loadImage("felipe.png");
}

void setup_herman()
{
  herman_julgran = loadImage("herman_julgran.png");
}

void setup_kevin(){
  trainbg = loadImage("trainbg.png");
  train = new Gif(this, "lokanimation.gif");
  train.play();
}

void setup_leonid()
{
  heMask = createImage(800,800,ALPHA);
  lrMask = createImage(800,800,ALPHA);
  lrMask.loadPixels();
  for (int i = 0; i < lrMask.pixels.length; i++) {
    lrMask.pixels[i] = color(0); 
    if(i%800 >= lrfx && i%800 < lrfx + 200)
      if((floor(i/800) >= 000 && floor(i/800) < 200) || (floor(i/800) >= 400 && floor(i/800) < 600))
        lrMask.pixels[i] = color(0, 90, 102);
    
  }
  lrMask.updatePixels();
  lrVid = createGraphics(800,800);
  heVid = createGraphics(800,800);
  background(0,255,0);

}

void setup_pablo()
{
  pablo_image = loadImage("pablo.png");
}


void setup()
{
  size(800, 800);
  setup_felipe();
  setup_herman();
  setup_kevin();
  setup_leonid();
  setup_pablo();
}

void draw_alfred()
{
  final float y1 = (cos(alfred_x1 / 10) * 20) + (height / 2);
  fill(255,0,0);
  ellipse(alfred_x1, y1, 5, 5);
  alfred_x1 = alfred_x1 + 2;
  final float y2 = (sin(alfred_x2 / 10) * 20) + (height / 2);
  fill(0,0,255);
  ellipse(alfred_x2, y2, 5, 5);
  alfred_x2 = alfred_x2 + 2;
  final float y3 = (cos(alfred_x1 / 10) * 20) + (height / 4);
  fill(255,255,0);
  ellipse(alfred_x3, y3, 5, 5);
  alfred_x3 = alfred_x3 + 2;
  final float y4 = (sin(alfred_x2 / 10) * 20) + (height / 4);
  fill(0,255,0);
  ellipse(alfred_x4, y4, 5, 5);
  alfred_x4 = alfred_x4 + 2;
  final float y5 = (cos(alfred_x5 / 10) * 20) + (height / 4 * 3);
  fill(255,127.5,0);
  ellipse(alfred_x5, y5, 5, 5);
  alfred_x5 = alfred_x5 + 2;
  final float y6 = (sin(alfred_x6 / 10) * 20) + (height / 4 * 3);
  fill(255,0,255);
  ellipse(alfred_x6, y6, 5, 5);
  alfred_x6 = alfred_x6 + 2;
}

void draw_enrico() {
  // Enrico
  textSize(20);
  //background(0);
  fill(0); rect(0,0,200,200); //RJCB 
  fill(255); //RJCB
  stroke(0); //RJCB
  text("merry x-mas", 50, 50);
  ellipse(enrico_x, 100, 50, 50);
  enrico_x = enrico_x + 2;
  ellipse(enrico_n, 100, 50, 50);
  ellipse(enrico_b, 100, 50, 50);
  ellipse(enrico_g, 100, 50, 50);
  ellipse(enrico_c, 100, 50, 50);
  ellipse(enrico_o, 100, 50, 50);
  ellipse(enrico_h, 100, 50, 50);
  ellipse(enrico_l, 100, 50, 50);
  ellipse(enrico_i, 100, 50, 50);
  ellipse(enrico_j, 100, 50, 50); 
  ellipse(enrico_k, 100, 50, 50);
  ellipse(enrico_Y, 100, 50, 50);
  enrico_b = enrico_b + 2;
  enrico_c = enrico_c + 2;
  enrico_n = enrico_n + 2;
  enrico_g = enrico_g +2;
  enrico_o = enrico_o +2;
  enrico_h = enrico_h + 2;
  enrico_l = enrico_l +2;
  enrico_i = enrico_i + 2;
  enrico_j = enrico_j +2;
  enrico_k = enrico_k + 2;
  enrico_Y = enrico_Y + 2;
}

void draw_felipe()
{
  image(felipe_image, 200, 0, 200, 200);
}

void draw_herman()
{
  fill(#00AA00);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("God", 100, 300);
  text("Jul", 100, 500);
  image(herman_julgran, 600, 200, 200, 400);  
}

void draw_leonid()
{
colorMode(HSB, 100);
stroke(frameCount%100, 100, 100);
for(int i = 0; i < 400; i++) { stroke((frameCount+i/10f)%100, 100, 100); line(200, 400+i, 400, 400+i); }
stroke(0);
colorMode(RGB, 255);


  heVid.beginDraw();
  heVid.noStroke();
  heVid.fill(0,25);
  heVid.rect(0,0,800,800);
  heVid.rectMode(CENTER);
  heVid.stroke(255);
  heVid.strokeWeight(8);
  heVid.noFill();
  heVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), sin(frameCount/32f) * 300f + 400f);
  heVid.rotate(frameCount/32f);
  heVid.rect(0,0,90,90);
  heVid.rotate(-frameCount/32f);
  heVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( sin(frameCount/32f) * 300f + 400f));
  heVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), -sin(frameCount/32f) * 300f + 400f);
  heVid.rotate(frameCount/32f);
  heVid.triangle(-30f * 1.5f, -23f * 1.5f, 0, 29f * 1.5f, 30f * 1.5f, -23f * 1.5f);
  heVid.rotate(-frameCount/32f);
  heVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( -sin(frameCount/32f) * 300f + 400f));
  lrVid.fill(0);
  lrVid.noStroke();
  heVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), sin(frameCount/32f) * 300f + 400f);
  heVid.rotate(frameCount/32f);
  heVid.rect(0,0,90,90);
  heVid.rotate(-frameCount/32f);
  heVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( sin(frameCount/32f) * 300f + 400f));
  heVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), -sin(frameCount/32f) * 300f + 400f);
  heVid.rotate(frameCount/32f);
  heVid.triangle(-30f * 1.5f, -23f * 1.5f, 0, 29f * 1.5f, 30f * 1.5f, -23f * 1.5f);
  heVid.rotate(-frameCount/32f);
  heVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( -sin(frameCount/32f) * 300f + 400f));
  heVid.fill(0);
  heVid.stroke(0);
  heVid.noStroke();
  heVid.rectMode(CORNER);
  heVid.rect(000,000,800,400);
  heVid.rect(000,400,200,400);
  heVid.rect(400,400,400,400);
  heVid.endDraw();
  heMask = heVid.copy();

  heVid.beginDraw();
  heVid.noStroke();
  heVid.fill(204,25);
  heVid.background(0);
  heVid.rectMode(CENTER);
  heVid.stroke(255);
  heVid.strokeWeight(8);
  heVid.fill(255);
  heVid.colorMode(HSB, 100);
  heVid.stroke((frameCount + 50)%100, 100, 100);
  for(int i = 0; i < 400; i++) { heVid.stroke((frameCount+i/10f+50)%100, 100, 100); heVid.line(200, 400+i, 400, 400+i); }
  heVid.stroke(0);
  heVid.colorMode(RGB, 255);
  heVid.fill(255);
  heVid.stroke(0);
  heVid.rectMode(CORNER);
  heVid.endDraw();
  heVid.mask(heMask);
  image(heVid,0,0); heVid.beginDraw();


  lrVid.beginDraw();
  lrVid.noStroke();
  lrVid.fill(204,25);
  lrVid.rect(0,0,800,800);
  lrVid.rectMode(CENTER);
  lrVid.stroke(255);
  lrVid.strokeWeight(8);
  lrVid.noFill();
  lrVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), sin(frameCount/32f) * 300f + 400f);
  lrVid.rotate(frameCount/32f);
  lrVid.rect(0,0,90,90);
  lrVid.rotate(-frameCount/32f);
  lrVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( sin(frameCount/32f) * 300f + 400f));
  lrVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), -sin(frameCount/32f) * 300f + 400f);
  lrVid.rotate(frameCount/32f);
  lrVid.triangle(-30f * 1.5f, -23f * 1.5f, 0, 29f * 1.5f, 30f * 1.5f, -23f * 1.5f);
  lrVid.rotate(-frameCount/32f);
  lrVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( -sin(frameCount/32f) * 300f + 400f));
  lrVid.fill(0);
  lrVid.noStroke();
  lrVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), sin(frameCount/32f) * 300f + 400f);
  lrVid.rotate(frameCount/32f);
  lrVid.rect(0,0,90,90);
  lrVid.rotate(-frameCount/32f);
  lrVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( sin(frameCount/32f) * 300f + 400f));
  lrVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), -sin(frameCount/32f) * 300f + 400f);
  lrVid.rotate(frameCount/32f);
  lrVid.triangle(-30f * 1.5f, -23f * 1.5f, 0, 29f * 1.5f, 30f * 1.5f, -23f * 1.5f);
  lrVid.rotate(-frameCount/32f);
  lrVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( -sin(frameCount/32f) * 300f + 400f));
  lrVid.fill(255);
  lrVid.stroke(0);
  lrVid.rectMode(CORNER);
  lrVid.endDraw();
  lrVid.mask(lrMask);
  image(lrVid,0,0);
  //image(lrMask,0,0);
}

void draw_kevin(){
  fill(0,145,235);
  rect(600,0,200,200);
  image(trainbg,600,0);
  image(train, 600, 25);
}

void draw_malek()
{
  stroke(malekX - 200, malekgron, random(256));
  fill(malekX - 200, malekgron, random(256));
  rect(malekX, height - 100, 50, 50, 50);
  malekX = malekX + 1;
  malekgron = malekgron + 2;
  if (malekX > 740)
  {
    malekX = 610;
  }
  if (malekgron > 255)
  {
  malekgron = 0;
  }
}

void draw_pablo()
{
  image(pablo_image, 400, 600, 200, 200);
}

void draw()
{
  draw_alfred();
  draw_enrico();
  draw_felipe();
  draw_herman();
  draw_kevin();
  draw_leonid();
  draw_malek();
  draw_pablo();
}
