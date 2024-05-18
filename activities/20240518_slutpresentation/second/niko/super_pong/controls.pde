void drawControls()
{
  if (keyPressed) {
    if (key == 'r') {
      caps = 999999;
      lock = 999999;
      if (pause == false) {
        pause = true;
        delay(100);
      } else
        pause = false;
      delay(100);
    }
    if (key == 'R') {
      caps = 100;
      lock = 600;
      if (pause == false) {
        pause = true;
        delay(100);
      } else
        pause = false;
      delay(100);
    }
    if (key == 'w') {y = y - speed; caps = 100; lock = 999999;}
    if (key == 'a') {x = x - speed; caps = 100; lock = 999999;}
    if (key == 's') {y = y + speed; caps = 100; lock = 999999;}
    if (key == 'd') {x = x + speed; caps = 100; lock = 999999;}
    if (key == 'W') {y = y - speed; caps = 100; lock = 600;}
    if (key == 'A') {x = x - speed; caps = 100; lock = 600;}
    if (key == 'S') {y = y + speed; caps = 100; lock = 600;}
    if (key == 'D') {x = x + speed; caps = 100; lock = 600;}
  }
}
