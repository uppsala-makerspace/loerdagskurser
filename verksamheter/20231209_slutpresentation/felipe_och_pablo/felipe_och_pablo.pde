import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;

AudioPlayer music;
float x2 = 150;
float y2 = 100;
float x = 150;
float y = 100;
float hastighet_till_hoger = 1;
float hastighet_nerat = 1;
PImage bild;

void setup()
{
  size(300, 200);
  bild = loadImage("ba.png");

  
  minim = new Minim(this);
  
  music = minim.loadFile("fixat av herman.mp3");
  
  music.loop();
  
  bild.resize(width, height);
}

void draw()
{
  background(bild);
  stroke(random(223),134,177);
  fill(random(0,0),234,98);
  ellipse(x, y, 50, 50);
  x = x + hastighet_till_hoger;
  y = y + hastighet_nerat;
  if (x > 275)
   {
 
  x2 = x2 + hastighet_till_hoger;
  y2 = y2 + hastighet_nerat;
  }
  if (x2 > 155)
  {
    hastighet_till_hoger = -abs(hastighet_till_hoger);
  }
  if (x < 25)
  {
    hastighet_till_hoger = abs(hastighet_till_hoger);
  }
  if (y > 175)
  {
    hastighet_nerat = -abs(hastighet_nerat);
  }
  if (y < 175)
  {
    hastighet_nerat = -(hastighet_nerat);
  }
  if (y>17)
{
      hastighet_nerat = -(hastighet_nerat);
}
}

  
