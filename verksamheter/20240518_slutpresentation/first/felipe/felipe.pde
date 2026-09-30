float[] xs;
float[] ys;

void setup()
{
size(900, 900);
xs = new float[1024];
ys = new float[1024];
for (int i=0; i<1024; ++i)
{
xs[i] = width/2;
ys[i] = height/2;
  }
surface.setResizable(true);
   background(0,0,0);
}

void draw()
{
  for (int i=0; i<1024; ++i)
  {
    stroke(64514 * i % 256,144523 * i % 256,65735 * i % 256);
    xs[i] += random(-9,9);
    ys[i] += random(-9,9);
    ellipse(xs[i], ys[i], 1, 1);
  }
  // Go through all particles
  for (int i=0; i<1024; ++i)
  {
    // Go through all particles
    for (int j=0; j<1024; ++j)
    {
      if (i == j) continue;
      if (xs[i] == xs[j] && ys[i] == ys[j])
      {
        xs[i] = 0;
      }
    }
      // If particle 1 and particle 2 are near, do a colision 
  }
}
