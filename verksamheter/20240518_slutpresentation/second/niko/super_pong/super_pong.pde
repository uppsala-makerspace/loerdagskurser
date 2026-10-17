//ddddddddrddddddaadaarrrrrrrrrerrrrrwwwddddddddddwwwdswaaaaswwwd
void setup() {
  fullScreen();
  t = new float [2];
  t[0] = height / 5;
  t[1] = width / 4;
  nav = new float [N];
  nax = new float [N];
  for (int i = 0; i < N; ++i) {
    nax[i] = 700;
    nav[i] = width / 2;
  }
  nav[N - 1] = width / 4 + width / 2;
  nax[N - 1] = 600;
  hiscore =int(loadStrings("hiscore.txt")[0]);
  troll = loadImage("troll_face.png");
  x1 = random(height / 2); // value
  y1 = random(width / 2);
  x = width / 2 - 50;
  y = height / 2 - 50;
  ball = 100;
  ballin = ball / 2;
  BALL = 100;
  BALLIN = BALL / 2;
  hitbox = new float [4];
  x2 = -1000000000;
  y2 = -1000000000;
  if (score > 0) {
    score = -99999999;
    hiscore = -9999999;
    h = 1;
  }
}


void draw() {
  fill(l);
  speed1 = q;
  speed0 = w;
  if (pause == false) {
    s = s + 1;
  }
  if (s == 50) {
    score = score + 1;
    s = 0;
  }
  if (pause == true) {
    speed0 = 0;
    speed1 = 0;
  } else {
    speed0 = w;
    speed1 = q;
  }
  x1 = x1 + speed0;
  y1 = y1 + speed1;
  luck=random(1000);
  background(d);
  fill(l);
  hitbox[1] = x + 50;
  hitbox[3] = y + 50;
  drawScreen();
  if (x > width + 100) x = -100;
  if (x < -100) x = width + 100;
  if (y > height + 100) y = -100;
  if (y < -100) y = height + 100;
  if (x1 > width + 25) {
    String[] lines = new String[1];
    lines[0] = str(hiscore);
    saveStrings("hiscore.txt", lines);
    exit();
  }
  if (x1 < -25) {
    String[] lines = new String[1];
    lines[0] = str(hiscore);
    saveStrings("hiscore.txt", lines);
    exit();
  }
  if (y1 > height + 25) {
    String[] lines = new String[1];
    lines[0] = str(hiscore);
    saveStrings("hiscore.txt", lines);
    exit();
  }
  if (y1 < -25) {
    String[] lines = new String[1];
    lines[0] = str(hiscore);
    saveStrings("hiscore.txt", lines);
    exit();
  }
  if (hiscore < score) {
    hiscore = score;
  }
  if (p == 1) {
    x2 = width / 2;
    y2 = height / 2;
    p = 2;
    if (p == 2) {
      x2 = random(10, -10);
      y2 = random(10, -10);
    }
  }
  drawControls();
  if (pause == true) {
    speed = 0;
  } else
    speed = 10;

  if ( x1 < hitbox[1] + 25) {
    if (x1 > x - 25) {
      if (y1 < 50) {
        q = 6;
      }
      if (y1 > height - 75) {
        q = -6;
      }
    }
  }
  if (y1 < hitbox[3] + 25) {
    if (y1 > y + 25) {
      if (x1 < 50) {
        w = 6;
      }
      if (x1 > width - 75) {
        w = -6;
      }
    }
  }
  drawSecrets();
}
