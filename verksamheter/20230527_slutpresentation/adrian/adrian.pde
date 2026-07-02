void setup()
{
  size(1000, 500);
}

void draw()
{
  fill(random(255), random(255), random(255));
  line(10, (height), height, random(width));
   line(10, (width), width, random(height));
    line(100, random(width), width, (height));
      line(0, random(height), width, (height));
            line(45, (height), width, (height));
               line(6, random(height), random(width), (width));

ellipse(1,40,400000,20);
ellipse(1,80,400000,20);
ellipse(1,120,400000,25);
ellipse(1,160,400000,20);
ellipse(1,200,400000,20);
ellipse(40,200,20,400000);
ellipse(80,200,20,400000);
ellipse(120,200,20,400000);
ellipse(160,200,20,400000);
stroke(random(255), 128, 500);
ellipse(200,200,5,400000);
ellipse(240,200,20,400000);
ellipse(280,200,45,400000);
ellipse(150,100,100,250);
}
