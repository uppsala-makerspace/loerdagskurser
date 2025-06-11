float x = 50;
float x2 = 650;
float hastighet = 2;
float hastighet2 = -2;
void setup()
{
  size(700, 4000);
}

void draw()
{
  stroke(random(255), random(180), random(170));
  line(0, random(height), 60, 50);

  ellipse(x,100,100,100);
  x = x + hastighet;
  if (x > 325) {
    hastighet = -hastighet;
  
  }
   if (x < 1)
  {
    hastighet = -hastighet;
  
  }
  stroke(0, 5, 5);
  ellipse(x2,100,100,100);
  x2 = x2 + hastighet2;
  if (x2 < 1) {
    hastighet2 = -hastighet2;
  
  }
   if (x2 > 650)
  {
    hastighet2 = -hastighet2;
  
  }
}
