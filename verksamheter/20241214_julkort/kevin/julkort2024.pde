import gifAnimation.*;
Gif train;
PImage trainbg;
void setup(){
  size(800,800);
  trainbg = loadImage("trainbg.png");
  train = new Gif(this, "lokanimation.gif");
  train.play();
}
void draw(){
  fill(0,145,235);
  
  rect(600,0,200,200);
  image(trainbg,600,0);
  image(train, 600, 25);
}
