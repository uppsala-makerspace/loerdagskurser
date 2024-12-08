void setup()
{
  size(500,500);
}

void draw()
{
 fill(mouseX, mouseY - mouseX);
 ellipse(mouseY, mouseX, 100,100);
 fill(mouseX, mouseY, -676);
 ellipse(mouseX, mouseY, 50,50);
}
