void setup()
{
  size(300, 200);
}

void draw()
{
  stroke(random(231), 23, 7);
  line(10, (height), height, random(width));
   line(10, (width), width, random(height));
    line(100, random(width), width, (height));
      line(0, random(height), width, (height));
            line(45, (height), width, (height));
               line(6, random(height), random(width), (width));
}
