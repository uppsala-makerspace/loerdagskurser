float width = 140;
float height = 140;
float y = 100;
float x = 150;
float hastighet = 2;
void setup()
{
  size(300,200);
}
void draw()
{
  ellipse(x,y, width,height);
  y = y + hastighet;
  {
  }
  if(y > 300)
  {
    hastighet=-hastighet;
  
  }
  if(y<70)
{
  hastighet=+2;
}
}
