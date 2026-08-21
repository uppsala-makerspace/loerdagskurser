PImage bild;

void setup()
{
  fullScreen();
  bild = loadImage("dolphin-with-ai-generated-free-png.png");
} 

void draw()
{
  background(0, 200, 255);
  image(bild, width / 6, height / 11);
}
