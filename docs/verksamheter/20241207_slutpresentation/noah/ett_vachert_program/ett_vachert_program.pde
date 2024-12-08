void setup()
{
  size(856,856);
}
void draw()

{
  noStroke();
  fill(mouseX, mouseY, mouseX + mouseY);
  ellipse(mouseX, mouseY, 150, 150);
  fill(mouseY, mouseX, 855);
  ellipse(mouseY, mouseX,150, 150);
}
