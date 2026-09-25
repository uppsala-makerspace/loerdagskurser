PImage julgran;

void setup() {
  size(800, 800);
  julgran = loadImage("julgran.png");
}

void draw() {
  fill(#00AA00);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("God", 100, 300);
  text("Jul", 100, 500);
  image(julgran, 600, 200, 200, 400);
}
