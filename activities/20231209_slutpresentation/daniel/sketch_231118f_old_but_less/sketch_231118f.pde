float [][] position;
PImage bild;
float x = 0;
float x5 = -50;
float y5 = -50;
float y = 0;
float copies = 200;
float size = 50;
float speedX = 0;
float speedY = 0;
float enemyX = 0;
float enemyY = 0;
float enemySpeedX = 1;
float enemySpeedY = 1;
float eyeX = x;
float eyeY = y;
float eX = 0; 
float eY = 0;
boolean[] keys;
void setup()
{
  noCursor();
  fullScreen();
  x = width / 2 - 25;
  y = height / 2 - 25;
  eyeX = x + 15;
  eyeY = y + 15;
  bild = loadImage("grass.png");
  keys = new boolean[2048];
  position = new float[64][5];
  for(int i=0;i<position.length;i++){
    position[i][2]=0;
  }
  /*
  [i][0] = X
  [i][1] = Y
  [i][2] = Draw?
  [i][3] = Width
  [i][4] = Height
  */
}
void draw()
{
  if (enemyX > 0) enemyX-= 100;
  if (enemyX + width / 10 < 0) enemyX = enemyX + 100;
  if (enemyY > 0) enemyY-= 100;
  if (enemyY + width / 10 < 0) enemyY = enemyY + 100;   
  if (eX < x + 25) eX = eX + 1;
  if (eX > x + 25) eX = eX - 1;
  if (eY > y + 25) eY -= 1;
  if (eY < y + 25) eY += 1;
  fill(0, 180, 0);
  if (dist(eX, eY, x + 25 , y + 25) < 50) exit();
  stroke(0, 255, 0);
  rect(enemyX, enemyY, width / 2 * 2, width / 2 * 2);
  fill(255, 255, 255);

  fill(255, 0, 0);
  image(bild, enemyX, enemyY);
  ellipse(eX, eY, 50, 50);
  for (int i = 0; i > 200; ++i)
  {
    ellipse(enemyX, enemyY, 100, 100);
    enemyX += 100;
  }

  fill(0, 0, 0);
  rect(x, y, size , size);
  fill(255, 0, 0);
  fill(255, 255, 255);
  ellipse(eyeX, eyeY, 20, 20);
  fill(0, 0, 0);
  ellipse(eyeX, eyeY, 10, 10);
  makeRect(x5,y5,150,150);
  makeRect(mouseX,mouseY,10,10);
  for(int i=0;i<position.length;i++){
    if(position[i][2]==1){
      rect(position[i][0], position[i][1], position[i][3], position[i][4]);
    }
    
    position[i][2]=0;
  }
  k();
}
void makeRect(float X, float Y, float Width, float Height){
  int i=0;
  for(i=0;i<position.length-1&&(position[i][2]==1);i++){
  }
    position[i][0]=X;
    position[i][1]=Y;
    position[i][2]=1;
    position[i][3]=Width;
    position[i][4]=Height;
}
void keyPressed(){
  keys[keyCode]=true;
  println(keyCode);
}
void keyReleased(){
  keys[keyCode]=false;
}
void k()
{
    if (keyPressed)
  {
    if (key == 'e')
    {
      exit();
    }
    if (keys[38])
    {
      y5 += 3;
      enemyY = enemyY + 3;
      eyeY = height / 2 - 10;
      eyeX = width / 2;
      eY += 2;
      if (dist(x5 + 100, y5 + 100, x + 50 , y + 50) < 125){
        enemyY -= 3;
        y5 -=3;
      }
    }
    if (keys[40]) 
    {
      enemyY = enemyY - 3;
      eyeY = height / 2 + 10;
      eyeX = width / 2;
      eY -= 2;
      y5 -= 3;
      if (dist(x5 + 100, y5 + 100, x + 50 , y + 50) < 125){ 
        enemyY += 3;
        y5 += 3;
      }
    }
    if (keys[37])
    {
      x5 += 3;
      enemyX = enemyX + 3;
      eyeX = width / 2 - 10;
      eyeY = height / 2;
      eX += 2;
      if (dist(x5 + 100, y5 + 100, x + 50 , y + 50) < 125){ 
        enemyX -= 3;
        x5 -= 3;
      }
    }
    if (keys[39])
    {
      x5 -= 3;
      if (dist(x5 + 100, y5 + 100, x + 50 , y + 50) < 125){ 
        enemyX += 3;
        x5 += 3;
      }
      enemyX = enemyX - 3;
      eyeX = width / 2 + 10;
      eyeY = height / 2;
      eX -= 2;
    }
  }
}
