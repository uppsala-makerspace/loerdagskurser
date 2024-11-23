void setup()
{
  size(300, 200);
}

void draw()
{
  stroke(random(256), random(256), random(256));
  line(random(width), random(height), random(width), random(height));
}
