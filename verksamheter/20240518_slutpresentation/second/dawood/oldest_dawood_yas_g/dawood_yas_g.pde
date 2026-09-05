

import processing.sound.*;
SoundFile file;



//rec =70 sec dawood//

float [] x;
float [] y;
float [] xd;
float []yd;
String p="easy mode";
String m="hard mode";
int  b=255;
int  g=50;
int r =0;
int q=30;
int o=0;
int t =0;
int points=0;
int numbb=30;
void setup() {
  size(500, 500);
  frameRate(40);
file=new SoundFile(this,"were.mp3");
file.play();
  //
  x=new float [numbb];
  xd=new float [numbb];
  yd=new float [numbb];
  y=new float [numbb];
  for (int i=0; i<numbb; i++) {
    x[i]=random(10, 490);
    y[i]=random(10, 490);
    yd[i]=random(-3, 3);
    xd[i]=random(-3, 3);
  }
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  strokeWeight(4);
  text(t, width/2, 23);
  t++;
  ellipse(width/2+5+10-3-1-1,height-50-10-5,30,30);
  for (int i=0; i<numbb; i++) {
    fill(r, g, b);
    ellipse(x[i], y[i], q, q);
    x[i]=x[i]+xd[i];
    y[i]=y[i]+yd[i];
    if (x[i]>width-10||x[i]<10) {
      xd[i]=-xd[i];
    }
    if (y[i]>width-10||y[i]<10) {
      yd[i]=-yd[i];
    }
  }

  textSize(32);
  text(o, width/2, height-20);
  fill(0, 50, 255);
  text("Points:"+points, 0, 50);
  textSize(12);
  text(" for easy mode click", 1, 90);
  textSize(24);
  text(" E", 114, 90);
  textSize(12);
  text("for hard mode click", 140, 90);
  textSize(24);
  text(" H", 250, 90);
  textSize(12);
  text("for normal mode click", 279, 90);
  textSize(24);
  text("M", 410, 90);
  textSize(12);
  text("and for super hard click", 1, 110);
  textSize(24);
  text("U", 145, 110);

  if (numbb==0) {
    textSize(32);
    fill(r, g, b);
    text("Game Over!", width/2, height/2);
  }
}


  
void mousePressed() {
  if (numbb==0) {
    textSize(32);
    fill(r, g, b);
    text("Game Over!", width/2, height/2);
    
  }
  for (int i=0; i<numbb; i++) {
    float dist =sqrt(x[i]-mouseX)*(x[i]-mouseX)+(y[i]-mouseY)*(y[i]-mouseY);
    if (dist<q||dist==q/2+9) {
      file=new SoundFile(this,"mouse.mp3");
file.play();
      numbb--;
      y[i]=-100;
      x[i]=-100;
      int speedb=abs(int(xd[i]+xd[i]));
      int timeb=int((20000.0/millis())*10);
      points =points+speedb+timeb;
      file=new SoundFile(this,"were.mp3");
file.play();

      o++;
      break;
    }
  }
      if (numbb==0) {
        textSize(32);
        fill(r, g, b);
        text("Game Over!", width/2, height/2);
        file=new SoundFile(this,"somes.mp3");
file.play();

      }
    
   
  }


void keyPressed() { 
  if (keyPressed) {
    if (key =='h') {
      b=255;
      g=50;
      r =0;
      if (numbb==0) {

        textSize(32);
        fill(r, g, b);
        text("Game Over!", width/2, height/2);
      }
      frameRate(100+100+100+900+900+90+90+9000+9000+900);
      
    }
      q=25;
      strokeWeight(8);
    }
    if (key=='e') {
      q=40;
      b=255;
      g=50;
      r =0; 
    
      frameRate(35);
      if (numbb==0) {
        textSize(32);
        fill(r, g, b);
        text("Game Over!", width/2, height/2);
      }
    }
    if (key=='m') {
      q=30;
      b=255;
      g=50;
      r =0;
     
      if (numbb==0) {

        textSize(32);
        fill(r, g, b);
        text("Game Over!", width/2, height/2);
      }
      frameRate(70);
    }
    if (key=='u') {
      if (numbb==0) {
        textSize(32);
        fill(r, g, b);
        text("Game Over!", width/2, height/2);
      }
      frameRate(900  +90);
      q=23;
      r=0;
      b=10;
      g=20;
      
}
      }
