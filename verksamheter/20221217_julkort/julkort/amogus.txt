PImage AMOGUS;

void setup() {
  size(1000, 1000);
  AMOGUS = loadImage("amogus.png");
  AMOGUS.resize(250, 250);
}

void draw() {
  image(AMOGUS, 250, 0);
}
