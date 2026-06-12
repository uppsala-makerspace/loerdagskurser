import processing.sound.*;

float x1=130; 
float y1=469;

PImage  x2 ;
PImage  x ;
PImage  y ;
PImage  xd ;
PImage  yd ;
PImage  idiot ;
PImage in;
void setup()
{
  fullScreen();
  x=loadImage("candy h.png");
  y=loadImage("ftg.png");
  xd=loadImage("tree.png");
  yd=loadImage("ball.png");
  idiot =loadImage( "You are an idot.png");
  x2=loadImage("hats.jpg");
in =loadImage("these.png");
}
void draw() {
  background(2, 245, 255);
  image(x, width/3+65, -78);
  rect(0, 500, width, height/2);
  image(y, 40, 397);
  image(xd, width-300, 293);

  image(yd, x1, y1);
  fill(0, 255, 0);
  stroke( 0, 255, 00);
  if (key=='a')
  {
    background(2, 245, 255);
    image(idiot, 0, 0);
  }
  if (key=='t')

  {

    background(2, 245, 255);
image(in,width/49-6,height/4+60);
    image(x2, width/2, height/3+50-25);
    rect(0, 500, width, height/2);
    fill(0, 255, 0);
    text("Hey you are under",900,305);
    text("arrest since you guys are",875,320);
   text(" suppose to be in the Zelda Kingdom",858,335);
 text  ( "not in the fnaf world",868,345);
  text("hey littel kid you dont",270,260);
  text( "know who you're messing",270,270);
  text(" with so you better leave or else" ,250,280);
  text("this will not be good and you",250,290);
  text(" asked why we are here well",260,300);
  text(" that is since we have lost ",268,310);
  text ("a killer ball",290,320);
  
 
 }
}
void keyPressed() 
{
  if (key=='u')x1+=9;
  if (key=='o') {
    frameRate(1000);
    y1--;
    x1=x1-2;
  }
  if (key=='h') {
     frameRate (1000);
    y1++;
    x1=x1-3;
  }

}
