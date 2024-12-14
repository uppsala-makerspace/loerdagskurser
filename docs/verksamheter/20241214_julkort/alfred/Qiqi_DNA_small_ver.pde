float x1 = 0;
float x2 = 0;
float x3 = 0;
float x4 = 0;
float x5 = 0;
float x6 = 0;

void setup()
{
  size(200, 200);
}

void draw()
{
  final float y1 = (cos(x1 / 10) * 20) + (height / 2);
  fill(255,0,0);
  ellipse(x1, y1, 5, 5);
  x1 = x1 + 2;
  final float y2 = (sin(x2 / 10) * 20) + (height / 2);
  fill(0,0,255);
  ellipse(x2, y2, 5, 5);
  x2 = x2 + 2;
  final float y3 = (cos(x1 / 10) * 20) + (height / 4);
  fill(255,255,0);
  ellipse(x3, y3, 5, 5);
  x3 = x3 + 2;
  final float y4 = (sin(x2 / 10) * 20) + (height / 4);
  fill(0,255,0);
  ellipse(x4, y4, 5, 5);
  x4 = x4 + 2;
  final float y5 = (cos(x5 / 10) * 20) + (height / 4 * 3);
  fill(255,127.5,0);
  ellipse(x5, y5, 5, 5);
  x5 = x5 + 2;
  final float y6 = (sin(x6 / 10) * 20) + (height / 4 * 3);
  fill(255,0,255);
  ellipse(x6, y6, 5, 5);
  x6 = x6 + 2;
}
