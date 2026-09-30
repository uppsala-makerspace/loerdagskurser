float x = 2000;
float y = 1100;
float v = mouseX;
float cursor_x;
float cursor_y;
int gx, gy;
int tx, ty;
int hx, hy;
void setup()
{
  textSize(1);
  fullScreen();
  gx = (int)random(400);
  gy = (int)random(800);
  tx = (int)random(200);
  ty = (int)random(900);
  hy = (int)random(100);
  hy = (int)random(1000);
}

void draw()
{
  noCursor();
    cursor_x=mouseX;
    cursor_y=mouseY;

  background(255, 0, 0);
  fill(255);
  rect(00, 0, x, y);
  fill(0);
  ellipse(hy, hx, 100, 100);
  ellipse(cursor_x, cursor_y, 100, 100);
  fill(200, 200, 200);
  ellipse(gy, gx, 50, 50);
 fill(200, 200, 200);
  ellipse(ty, tx, 50, 50);
   fill(255, 255, 255);
  x = x -0.2;
  y = y - 0.1;
  if (mouseX>x) {
    println("exit x");
exit();
  }
  if (mouseY==tx && mouseX == ty) {
    println("exit y 500");
exit();
  }
  if (mouseY>y)
  if (mouseX == hy && mouseY == hy) {
    println("exit x 1000");
exit();
  }

  if (mouseX == gy && mouseY == gy) {
    println("ddd");
    textSize(300);
  text("YOU WIN", 300, 400);
  }
  if (mouseX == gy && mouseY == gy) {
    fill(255);
  }
    if (mouseX == gy)
    background(0);
  if (mouseX == gy) {
    println("stop y");
 stop();
  }
    if (mouseX == gx)
    background(0);
  if (mouseX == gx) {
    println("stop x");
    stop();
  }
}
