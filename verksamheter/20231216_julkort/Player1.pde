class Player1 {
  PVector ps, st;

  boolean upIsDown, doIsDown, leIsDown, riIsDown;

  Player1() {
    ps = new PVector(100/1.35, 100-15);
    st = new PVector(15, 15);
  }

  void show() {
    fill(#1FD0FF);
    noStroke();
    ellipse(ps.x, ps.y, st.x, st.y);
  }

  void move() {
    if (play1.upIsDown == true) {
      ps.y -= 3;
    }
    if (play1.doIsDown == true) {
      ps.y += 3;
    }
    if (play1.riIsDown == true) {
      ps.x += 3;
    }
    if (play1.leIsDown == true) {
      ps.x -= 3;
    }
  }

  void where() {
    if (ps.x < width/2+35) {
      ps.x = width/2+35;
    }
    if (ps.x > width-25) {
      ps.x = width-25;
    }
    if (ps.y > height-25) {
      ps.y = height-25;
    }
    if (ps.y < 0+25) {
      ps.y = 0+25;
    }
  }
}
