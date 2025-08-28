class Player2 {
  PVector ps, st;

  boolean wIsDown, sIsDown, dIsDown, aIsDown;

  Player2() {
    ps = new PVector(100+15, 100-15);
    st = new PVector(15, 15);
  }

  void show() {
    fill(#FF0808);
    noStroke();
    ellipse(ps.x, ps.y, st.x, st.y);
  }

  void move() {
    if (play2.wIsDown == true) {
      ps.y -= 3;
    }
    if (play2.sIsDown == true) {
      ps.y += 3;
    }
    if (play2.dIsDown == true) {
      ps.x += 3;
    }
    if (play2.aIsDown == true) {
      ps.x -= 3;
    }
  }

  void where() {
    if (ps.x > 200-17.5) {
      ps.x = 200-17.5;
    }
    if (ps.x < 100+7.5) {
      ps.x = 100+7.5;
    }
    if (ps.y > 100-7.5) {
      ps.y = 100-7.5;
    }
    if (ps.y < 0+7.5) {
      ps.y = 0+7.5;
    }
  }
}
