

class Button {
  float x, y, w, h;
  int state;
  String label;
  
  Button(float x, float y, float w, float h, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
  }
  
  boolean isPressed() {
    if(mousePressed && mouseButton == LEFT && mouseX > x && mouseY > y && mouseX < x + w && mouseY < y + h) return true;
      
    return false;
  }
  
  void display() {
    fill(255 - int(mousePressed && mouseButton == LEFT && mouseX > x && mouseY > y && mouseX < x + w && mouseY < y + h) * 100);
    stroke(0);
    rect(x, y, w, h);
    textAlign(LEFT, TOP);
    textSize(32);
    fill(0);
    text(label, x + 1, y + 2);
    if(isPressed() && state == 1) state = 2;
    if(isPressed() && state == 0) state = 1;
    if(state == 3) state = 0;
    if(!isPressed() && (state == 1 || state == 2)) state = 3;
  }
}
