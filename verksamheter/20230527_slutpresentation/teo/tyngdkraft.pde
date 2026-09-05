float x = 150;
float y = 100;
float hastighet_at_hoger = 1;
float hastighet_nedat = 1;
PImage pizza;
void setup()
{
 fullScreen();
pizza = loadImage("pizza1.jpg");
}
void draw()
{
  x = x + hastighet_at_hoger;
  y = y + hastighet_nedat;
  if (x> width -170)
  {
    hastighet_at_hoger = -hastighet_at_hoger;
  }
  if (x < 60)
  {
    hastighet_at_hoger = -hastighet_at_hoger;
  }
  if(y > height -50)
  {
    hastighet_nedat = -hastighet_nedat;
  }
  if (y < 50)
  {
    hastighet_nedat = -hastighet_nedat;
  }
  background(255, 255, 255);
  image(pizza, x, y, 200, 200 );
 }
    
    
  
