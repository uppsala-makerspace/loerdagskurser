float y = 500;
float x = 500;
float p1x = 100;
float p1y = 250;
float y2 = 3;
float x2 = 3;
float p2x = width-200;
float p2y = 250;
float p2y1 = 7;
float p1t = 0;
float p2t = 0;
float rcp1 = 255;
float gcp1 = 255;
float rcp2 = 255;
float gcp2 = 255;
void setup()
{
  textSize(100);
  fullScreen();
}
void draw() 
{
  p2x = width-200;
  background(0, 255, 0);
  fill(rcp1, gcp1, gcp1); 
text(p1t, width/4, 100);
fill(rcp2, gcp2, gcp2); 
text(p2t, width/1.5, 100);
fill(255, 255, 255);
  rect(p1x, p1y, 50, 400);
   rect(p2x, p2y, 50, 400);
  ellipse(x, y, 100, 100);
  y = y + y2;
   x = x + x2; 
  
 p2y = p2y - p2y1;
     if(key == 'W' || key == 'w')
     {p1y = p1y -3;}
      if(key == 'S' || key == 's')
     {p1y = p1y +3;}
     if(y < 50)
     {y2 = -y2;}
     if(y > height - 50)
     {y2 =-y2;
    }
     
       if(p2y < 50)
     {
     p2y1 = -p2y1;
   }
     if(p2y > height - 400)
     {
       p2y1 =-p2y1;
   }
     if(y >  p2y && y < p2y+400 && x == p2x-50)
  {
    x2 = -x2;
}
   if(y >  p1y && y < p1y +400 && x  ==p1x+ 100)
  {
    x2 = -x2;}
    if(x < 0)
    {y = height/2;
    x = width/2;
  x2 = -x2;
p2t = p2t + 1;}
    if(x > width)
    {y = height/2;
    x = width/2;
  x2 = -x2;
  p1t = p1t +1;
}
  if(p1t > p2t)
  {
    gcp2 = 0;
    rcp1 = 0;
}
 if(p1t < p2t)
  {
    gcp2 = 255;
    rcp2 = 0;
      gcp1 = 0;
    rcp1 = 255;
}
if(p1t == p2t)
  {
    gcp2 = 255;
    rcp2 = 255;
      gcp1 = 255;
    rcp1 = 255;
}
}
