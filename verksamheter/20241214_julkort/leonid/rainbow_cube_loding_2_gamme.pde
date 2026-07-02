float malekX = 610;
float malekgron = 0;

void setup()
{
  size(800, 800);
}

void draw()
{
  stroke(malekX - 200, malekgron, random(256));
  fill(malekX - 200, malekgron, random(256));
  rect(malekX, height - 100, 50, 50, 50);
  malekX = malekX + 1;
  malekgron = malekgron + 2;
  if (malekX > 740)
  {
    malekX = 610;
  }
  if (malekgron > 255)
  {
  malekgron = 0;
  }
}
