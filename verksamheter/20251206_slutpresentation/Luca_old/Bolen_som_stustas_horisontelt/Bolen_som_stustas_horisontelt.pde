float width = 100;
float height = 100;
float y = 100;
float x = 100;
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
  if(y > 100)
  {
    hastighet=-hastighet;
  
  }
  if(y<100)
{
  hastighet=+2;
}
}
