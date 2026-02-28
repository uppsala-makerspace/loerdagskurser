
import processing.serial.*;
Serial port;

int x = 0;

void setup()
{
  size(1000, 276);
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
  background(255, 255, 255);
}

void draw()
{
  while(port.available() > 0) {
    print("YAY!!!");
    final int y = port.read();
    point(x, y + 10);
    ++x;
    if (x > 1000) x = 0;
  }
}
