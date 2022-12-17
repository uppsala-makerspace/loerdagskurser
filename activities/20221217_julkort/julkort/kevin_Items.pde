class Items {
  int id;
  float x, y;
  PImage itemt;
  
  public Items(int id, float x, float y) {
    this.id = id; this.x = x; this.y = y;
    itemt = loadImage("coin.png");
  }
  
  public void rita() {
    if (id == 0) {
      itemt.resize(50, 50);
      image(itemt, x, y);
    }
  
  }
}
