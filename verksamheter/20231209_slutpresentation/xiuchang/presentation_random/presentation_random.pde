float x = random(500);
float y = random(500);
float hastighet = random(5);
void setup()
{
  size(500, 500);
  background(random(256), random(256), random(256));
}
 void draw()
{
  stroke (random(200), random(200), random(200));
  fill(random(100), random(100),random(100));
  ellipse(x, y, random(200), random(200));
  x = random(hastighet);
  if (x>width+random(100))
{
}
  if (y<height+random(100))
  {
    x = random(500);
    y = random(500);
  }
}
