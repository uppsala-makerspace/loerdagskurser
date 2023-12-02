float x = 350;
float y = -50;
void setup()
{
size(300, 200);
}
void draw()

{
 stroke(random(255), random(255), random(255));
 ellipse(x,y,100,100);
 x = x - 1;
 y = y + 1;
 if  (x < -50)
 {
   x = 350;
 }
if (y > 250)
{
  y = -50;
}
}
   
