class Blocks {
  float x, y;
  int id;
  boolean hit;
  PImage bimg;
  
  public Blocks(float x, float y, int id) {
    this.id = id;
    this.x = x;
    this.y = y;
    if (id == 0) {
      bimg = loadImage("lucky block.png");
      bimg.resize(20, 20);
    }
  }
  
  public void rita() {
    if (id == 0) {
      image(bimg, x, y);
    }
  }
}
