//ddddddddrddddddaadaarrrrrrrrre
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
  speed1 = w;
  speed0 = w;
  if (pause == false) {
    s = s + 1;
  }
  if (s == 50) {
    score = score + 1;
    s = 0;
  }
  if (pause == true) {
    w = 0;
  } else
    w = 6;
  x1 = x1 + speed0;
  y1 = y1 + speed1;
  luck=random(1000);
  background(d);
  fill(l);
  if (h == 1) {
    fill(l);
    text("hey no hacking here", width / 2, 700);
  }
  if (score >20) {
    fill(255, 255, 0);
    text("Hello. Im the naviator. My dialog is yellow", nav[0], nax[0]);
  }
  if (score >25) {
    nax[0] = width + width;
    nav[0] = width + width;
  }
  fill(l);
  hitbox[1] = x + 50;
  hitbox[3] = y + 50;
  textSize(200);
  text("SUPER PONG", width/2-400, height/ 2);
  textSize(20);
  text("v:3,3,3", 1800, 1000);
  textSize(50);
  text("SCORE:", 100, 100); //score thing
  text(score, 255, 100);
  text("HISCORE:", 100, 150);
  text(hiscore, 300, 150);
  rect(width -50, y, BALL, ball); // squares moving
  rect(- 50, y, BALL, ball);
  rect(x, height - 50, BALL, ball);
  rect(x, - 50, BALL, ball);
  ellipse(x1, y1, 50, 50);
  fill(255, 200, 200);
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
  if (keyPressed) {
    if (key == 'r') {
      if (pause == false) {
        pause = true;
        delay(1);
      } else
        pause = false;
        delay(1);
    }
    if (key == 'R') {
      if (pause == false) {
        pause = true;
        delay(1);
      } else
        pause = false;
        delay(1);
    }
    if (key == 'w') y = y - speed;
    if (key == 'a') x = x - speed;
    if (key == 's') y = y + speed;
    if (key == 'd') x = x + speed;
    if (key == 'W') y = y - speed;
    if (key == 'A') x = x - speed;
    if (key == 'S') y = y + speed;
    if (key == 'D') x = x + speed;
  }
  if (pause == true) {
    speed = 0;
  } else
    speed = 10;

  if ( x1 < hitbox[1] + 25) {
    if (x1 > x - 25) {
      if (y1 < 50) {
        speed1 = w;
      }
      if (y1 > height - 75) {
        speed1 = -w;
      }
    }
  }
  if (y1 < hitbox[3] + 25) {
    if (y1 > y + 25) {
      if (x1 < 0 + 50) {
        speed0 = w;
      }
      if (x1 > width - 75) {
        speed0 = -w;
      }
    }
    if (score > 99) {
      l = 0;
      d = 255;
    }
  }
  if (score > 199) {
    l=255;
    d=0;
  }
  if (score > 68)
  {
    t[0] = t[0] + 5;
    image(troll, t[1], t[0]);
  }
}
