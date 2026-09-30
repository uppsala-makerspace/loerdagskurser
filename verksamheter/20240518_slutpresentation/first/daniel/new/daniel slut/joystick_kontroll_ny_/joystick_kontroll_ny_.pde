import processing.serial.*;
Serial port;
float real_x = 0;
float real_y = 0;
float r_x = width / 2;
float r_y = height / 2;
void setup()
{
  fullScreen();
  println(Serial.list());
  port = new Serial(this, Serial.list()[1], 9600);
  background(255, 255, 255);
  real_x = width/2;
  real_y = height/2;
}

void draw()
{
  background(255, 255, 255);
  while(port.available() > 0) {
    final int x = port.read();
    final int y = port.read();
    real_x = 0;
    real_y = 0;
    if (x > 125) real_x = 1;
    if (x < 20) real_x = -1;
  
    if (y > 128) real_y = -1;
    if (y < 10) real_y = 1;
  
    r_x += real_x;
    r_y += real_y;
    fill(0, 0, 0);
    ellipse(r_x, r_y, 100, 100);
    
    
  }
}
