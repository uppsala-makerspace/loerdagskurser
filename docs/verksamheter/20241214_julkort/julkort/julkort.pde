float enrico_x = -200;
int enrico_c = -300;
int enrico_b = -400;
int enrico_g = -500;
int enrico_n = -600;
int enrico_h = - 700;
int enrico_l = -800;
int enrico_i = - 900;
int enrico_o = - 1000;
int enrico_k = -1100;
int enrico_Y = -1200;
int enrico_j = -1300;

float alfred_x1 = 0;
float alfred_x2 = 0;
float alfred_x3 = 0;
float alfred_x4 = 0;
float alfred_x5 = 0;
float alfred_x6 = 0;

void setup()
{
  textSize(20);
  size(800, 800);
}

void draw_alfred()
{
  final float y1 = (cos(alfred_x1 / 10) * 20) + (height / 2);
  fill(255,0,0);
  ellipse(alfred_x1, y1, 5, 5);
  alfred_x1 = alfred_x1 + 2;
  final float y2 = (sin(alfred_x2 / 10) * 20) + (height / 2);
  fill(0,0,255);
  ellipse(alfred_x2, y2, 5, 5);
  alfred_x2 = alfred_x2 + 2;
  final float y3 = (cos(alfred_x1 / 10) * 20) + (height / 4);
  fill(255,255,0);
  ellipse(alfred_x3, y3, 5, 5);
  alfred_x3 = alfred_x3 + 2;
  final float y4 = (sin(alfred_x2 / 10) * 20) + (height / 4);
  fill(0,255,0);
  ellipse(alfred_x4, y4, 5, 5);
  alfred_x4 = alfred_x4 + 2;
  final float y5 = (cos(alfred_x5 / 10) * 20) + (height / 4 * 3);
  fill(255,127.5,0);
  ellipse(alfred_x5, y5, 5, 5);
  alfred_x5 = alfred_x5 + 2;
  final float y6 = (sin(alfred_x6 / 10) * 20) + (height / 4 * 3);
  fill(255,0,255);
  ellipse(alfred_x6, y6, 5, 5);
  alfred_x6 = alfred_x6 + 2;
}

void draw_enrico() {
  // Enrico
  //background(0);
  fill(0); rect(0,0,200,200); //RJCB 
  fill(255); //RJCB 
  text("merry x-mas", 50, 50);
  ellipse(enrico_x, 100, 50, 50);
  enrico_x = enrico_x + 2;
  ellipse(enrico_n, 100, 50, 50);
  ellipse(enrico_b, 100, 50, 50);
  ellipse(enrico_g, 100, 50, 50);
  ellipse(enrico_c, 100, 50, 50);
  ellipse(enrico_o, 100, 50, 50);
  ellipse(enrico_h, 100, 50, 50);
  ellipse(enrico_l, 100, 50, 50);
  ellipse(enrico_i, 100, 50, 50);
  ellipse(enrico_j, 100, 50, 50); 
  ellipse(enrico_k, 100, 50, 50);
  ellipse(enrico_Y, 100, 50, 50);
  enrico_b = enrico_b + 2;
  enrico_c = enrico_c + 2;
  enrico_n = enrico_n + 2;
  enrico_g = enrico_g +2;
  enrico_o = enrico_o +2;
  enrico_h = enrico_h + 2;
  enrico_l = enrico_l +2;
  enrico_i = enrico_i + 2;
  enrico_j = enrico_j +2;
  enrico_k = enrico_k + 2;
  enrico_Y = enrico_Y + 2;
}



void draw()
{
  draw_alfred();
  draw_enrico();
}



  
