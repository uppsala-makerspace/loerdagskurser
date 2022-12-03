float plrx = 225;
float block_pos1 = 200;
float block_pos2 = 250;

void setup() {
  size(1200, 650);
}
void draw( ){
  background(0, 150, 255);
  fill(255, 255, 255);
  textSize(56);
  text("World: 1-1", 500, 50);
    if (keyPressed)
    {
      if (key == 'd' ||key == 'D') {
      plrx = plrx + 3;
      block_pos1 = block_pos1 - 3;
      block_pos2 = block_pos2 - 3;
      }
      if (key == 'a' ||key == 'A') plrx = plrx - 3;
    }
  stroke(255, 150, 0);
  fill(255, 150, 0);
  rect(block_pos1,600,50,50);
  rect(block_pos2,600,50,50);
  stroke(255, 0, 0);
  fill(255, 0, 0);
  ellipse(plrx, 573, 50, 50);
  if (block_pos1 <= 0) {
  block_pos1 = 1200;
  }
  if (block_pos2 <= 0) {
  block_pos2 = 1200;
  }
  if (plrx >= 1200) {
  plrx = 1200;
  }
  if (plrx <= 0) {
  plrx = 0;
  }

}
