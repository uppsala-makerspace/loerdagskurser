float x =150;
float y = 100;
float hastighet_at_hoger = 1;
float hastighet_nedat = 1;

void setup()
{
  fullScreen();
}

void draw()
{
  ellipse(x, y, 50, 50);
  x = x + hastighet_at_hoger;
  y = y + hastighet_nedat;
  if (x > 275)
{
hastighet_at_hoger = -hastighet_at_hoger;
}
if(x < 25)
{
  hastighet_at_hoger = -hastighet_at_hoger;
}
if(y > height - 25)
{hastighet_nedat= -hastighet_nedat;}
}
