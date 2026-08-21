float y = 0;

void setup()
{
  size(300, 200);
}

void draw()
{
  ellipse(y, 50, 40, 40);
  y = y + 2;
}
