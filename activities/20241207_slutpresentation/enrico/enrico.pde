float x = -500;
float y = 4500;
float e = -3300;
float m = -4400;
float g = 4700;
float t = -19000;
void setup()
{
  background(0, 0, 0);
  fullScreen();
}
void draw()
{
  background(0);
  fill(255, 255, 255);
  ellipse(800, 6000, 10500, 10500);
  fill(100, 100, 100);
  ellipse(200, 900, 100, 100);
  ellipse(800, 850, 75, 75);
  fill( 0, 0, 255);
  ellipse(t, 1000, 200, 20);
  stroke(0, 0,0);
  fill(0, 255, 0);
  ellipse(x, 255, 100, 100);
  ellipse(e, 255, 100, 100);
  ellipse(m, 800, 100, 100);
  ellipse(y, 800, 100, 100);
  fill(255, 0, 100);
  ellipse(g, 800, 100, 100);
  fill(255, 255, 255);
  point(random(100), random(100));
  ellipse(y, 775, 50, 50);
  ellipse(g, 775, 50, 50);
  ellipse(m, 755, 50, 50);
  fill(0, 0, 0);
  ellipse(y, 775, 25, 25);
  ellipse(g, 775, 25,25);
  ellipse(m, 775, 25, 25);
  fill(255, 0, 0);
  ellipse(y, 825, 25, 25);
  ellipse(g, 825, 25, 25);
  fill(100, 100, 100);
  ellipse(x, 300, 200, 100);
  ellipse(e, 300, 200, 100);
  fill(255, 255, 0);
  ellipse(0, 0, 300, 300);
  fill(0, 0, 255);
  ellipse(900, 100, 50, 50);
  fill(155, 0, 155);
  ellipse(800, 50, 75, 75);
  ellipse(500, 100, 75, 75);
  fill(255, 255, 255);
  ellipse(1000, 50, 75, 75);
  x = x + 1;
  y = y - 1;
  e = e + 2;
  m = m - 1;
  g = g - 1;
  t = t +4;
}
