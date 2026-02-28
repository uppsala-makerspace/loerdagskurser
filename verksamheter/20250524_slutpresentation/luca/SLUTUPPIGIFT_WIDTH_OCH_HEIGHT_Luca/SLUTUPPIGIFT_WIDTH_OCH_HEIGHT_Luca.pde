float x = -50;
float y = -50;

void setup()
{
  size(300, 200);
}
 
void draw()
{
  ellipse(x,y,100,100);
  x = x -1;
  y = y +1;
  if (x < -150)
  {
    x = 250;
  }
if (y > 250)
{
  y = -50;
}
}
