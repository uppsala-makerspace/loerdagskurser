

void setup()
{
  size(900, 900); 
}
 
 void draw()
{
 fill(mouseX, mouseY, mouseX + mouseY);
 ellipse(mouseX, mouseY, 3000, 3000);
 fill(mouseY, mouseX, 53);
 ellipse(mouseY, mouseX, 3000, 3000);
}
