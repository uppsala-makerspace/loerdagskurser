float x = 150;
float y = 100;
float hastighet_till_hoger = 1;
float hastighet_nerat = 1;

void setup()
{
  size(300, 200);
}

void draw()
{
  background(#0F67D6);
  ellipse(x, y, 50, 50);
  x = x + hastighet_till_hoger;
  y = y + hastighet_nerat;
  if (x > 275)
  {
    hastighet_till_hoger = -hastighet_till_hoger;
  }
  if (x < 25)
  {
    hastighet_till_hoger = -hastighet_till_hoger;
  }
  if (y > 175)
  {
    hastighet_nerat = -hastighet_nerat;
  }
  if (y < 175)
  {
    hastighet_nerat = -hastighet_nerat;
  }
  if (y>17)
{
      hastighet_nerat = -hastighet_nerat;
}
}
