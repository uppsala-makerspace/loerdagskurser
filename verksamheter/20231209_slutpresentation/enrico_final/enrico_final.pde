float x = 350;

void setup()
{
  size(300, 200);
}
void draw()
{
  stroke(random(255), random(255), random(255));
  point(random(x), random(150));
stroke(random(255), random(255), random(255));
line(random(x), random(150), random(150), random(300));
stroke(255, 0, 0);
ellipse(300, 150, 300, 150);
ellipse(0, 0, 0, 0);
}
