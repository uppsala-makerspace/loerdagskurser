float y = 0;
float x = -50;

void setup()
{
  size(789, 789);
}
void draw()
{
point(random(780), random(780));
ellipse(y, y, y, y);
y = y + 1;
{
  fill(mouseX, mouseY, mouseX + 210);
  ellipse(mouseX, mouseY, 50,50);
  fill(mouseY, mouseX, 50,100);
  ellipse(mouseY, mouseX, 50,100);
{
stroke(0, 255, 255);
line(0, random(height), width, random(height));
ellipse(x, height / 2, 50, 50);
}
}
}
