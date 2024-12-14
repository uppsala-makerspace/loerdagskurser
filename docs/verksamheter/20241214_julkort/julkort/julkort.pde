float enrico_x = -200;
int c = -300;
int b = -400;
int g = -500;
int n = -600;
int h = - 700;
int l = -800;
int i = - 900;
int o = - 1000;
int k = -1100;
int Y = -1200;
int j = -1300;

float x1 = 0;
float x2 = 0;
float x3 = 0;
float x4 = 0;
float x5 = 0;
float x6 = 0;

void setup()
{
  textSize(20);
  size(800, 800);
}

void draw_alfred()
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

void draw_enrico() {
  // Enrico
  //background(0);
  fill(0); rect(0,0,200,200); //RJCB 
  fill(255); //RJCB 
  text("merry x-mas", 50, 50);
  ellipse(enrico_x, 100, 50, 50);
  enrico_x = enrico_x + 2;
  ellipse(n, 100, 50, 50);
  ellipse(b, 100, 50, 50);
  ellipse(g, 100, 50, 50);
  ellipse(c, 100, 50, 50);
  ellipse(o, 100, 50, 50);
  ellipse(h, 100, 50, 50);
  ellipse(l, 100, 50, 50);
  ellipse(i, 100, 50, 50);
  ellipse(j, 100, 50, 50); 
  ellipse(k, 100, 50, 50);
  ellipse(Y, 100, 50, 50);
  b = b + 2;
  c = c + 2;
  n = n + 2;
  g = g +2;
  o = o +2;
  h = h + 2;
  l = l +2;
  i = i + 2;
  j = j +2;
  k = k + 2;
  Y = Y + 2;
}



void draw()
{
  draw_alfred();
  draw_enrico();
}



  
