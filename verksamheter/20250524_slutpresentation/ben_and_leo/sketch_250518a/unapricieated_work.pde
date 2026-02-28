float monke=0;
float bebemonke=0;
float fatmonke=550;
float xemonke=1000;
float yemonke=1000;
float zemonke=100;

void setup()
{
  size(1000, 1000, P3D);
}

void draw()
{
  background(0,0,0);
  translate(monke,bebemonke,fatmonke);
  lights();
  fill(255, 63.75, 0);
  noStroke();
  sphere(120);
  translate(-monke,-bebemonke,-fatmonke);
  monke+=1;
  bebemonke+=1;
  fatmonke+=1;
  fill(0, 175, 255);
  translate(xemonke, yemonke, zemonke);
  if (monke>width && bebemonke>height) 
  {
    monke=940; bebemonke=940; background(0,0,0);
  }
  sphere(550);
  if (fatmonke>550)
  {
    monke=550;
    fatmonke=100;
    bebemonke=550;
  }
}
