float x = 150;
float y = 100;
float hastighet_till_hoger = 3;
float studsar = 0;


void setup()
{
  size(300, 200);
}


void draw()
{
  background(0, 0, 0);
  stroke(128, 0, 0);
  fill(255, 0, 0);
  ellipse(x, y, 50, 50);
  fill(256, 256, 256);
  text(studsar, 10, 40);
  fill(256, 256, 256);
  text("Studsar", 10, 20);
 
  x = x + hastighet_till_hoger;
  if (x > 275)
  {
    hastighet_till_hoger = -hastighet_till_hoger;
    studsar = studsar + 1;
  }
  if (x < 25)
  {
    hastighet_till_hoger = -hastighet_till_hoger;
    studsar = studsar + 1;
  }
}
