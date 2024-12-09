class Bullet {
  float x, y, xv, yv;
  boolean running = false;
  
  Bullet(float x, float y, float d, float v) {
    this.x = x;
    this.y = y;
    this.xv = v * cos(d);
    this.yv = v * sin(d);
    running = true;
  }
  Bullet(float x, float y, float d, float v, boolean r) {
    this.x = x;
    this.y = y;
    this.xv = v * cos(d);
    this.yv = v * sin(d);
    running = r;
  }
  
  void display() {
    MainGraphic.stroke(#B47600);
    MainGraphic.strokeWeight(3);
    MainGraphic.line(x - entities.camX, y - entities.camY, x-xv - entities.camX, y-yv - entities.camY);
    
    x += xv;
    y += yv;
  }
}
