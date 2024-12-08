class Menu {
  PVector ps, st, text1;

  Menu() {
    ps = new PVector(0, 0);
    st = new PVector(500, height);
    text1 = new PVector(60, 100);
  }

  void show() {
    fill(125);
    rect(ps.x, ps.y, st.x, st.y);
  }

  void texts() {
    textSize(60);
    fill(100, 0, 0);
    text("halcony Infyniti", text1.x, text1.y);
  }
}
