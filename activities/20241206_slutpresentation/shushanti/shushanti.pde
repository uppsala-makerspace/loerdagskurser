float x = 100;
float y = 200;
float z = 300;
float a = 100;
float b = 200;
float c = 300;
void setup()
{
  textSize(300);
  fullScreen();
}
void draw()
{
  background(0,0,0);
  fill(0,255,0);
  ellipse(x,350,100,100);
  fill(0,255,0);
  ellipse(y,150,100,100);
  fill(0,255,0);
  ellipse(z,250,100,100);
  fill(200,200,200);
  ellipse(a,380,180,80);
  fill(200,200,200);
  ellipse(b,180,180,80);
  fill(200,200,200);
  ellipse(c,280,180,80);
  
  fill(0,255,0);
  text("ALIEN", 500, 500);
  
  x = x + 10;
  y = y + 20;
  z = z + 5;
  a = a + 10;
  b = b + 20;
  c = c + 5;

  
  
}
