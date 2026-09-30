import processing.sound.*;

class Gomba {
  // skapa variabler för position, en bild, m.m.
  float x;
  float y;
  StringList animegomba;
  PImage gombaBild;
  SoundFile Stomp;
  int ganime = 0;
  boolean gd = false;
  String g;
  int hastighet = 2;
  
  // skapa objektet
  public Gomba(float x, float y) {
    // spara positioner och ladda en bild
    this.x = x;
    this.y = y;
    animegomba = new StringList();
    animegomba.append("susgomba.png");  // 0: animering 1
    animegomba.append("gomba.png");     // 1: animering 2
    animegomba.append("pwm.png");       // 2: död
  }
  
  // rita upp bilden på rätt position
  public void rita() {
    g = animegomba.get(ganime);
  
    gombaBild = loadImage(g);
    gombaBild.resize(50, 50);

    image(gombaBild, x, y);
   
  }

  // animera
  public void startaAnimering() {
    rita();
    movement();    
    if (gombaanimering < 1 && gd != true) {
      if (ganime == 0) {
        ganime = 1;
      } else {
        ganime = 0;
      }
      gombaanimering = 10;
    }
    gombaanimering = gombaanimering - 1;
    /*if (plrx > x - 74 && plrx < x + 50 + 32 && plry + 86 > y && gd != true) {
      gd = true;
      Stomp = new SoundFile(kevin_SuperMarioBros.this, "smb_stomp.wav");
      ganime = 11;
      Stomp.play();
      hastig_nedat = 1;
      isjumping = true;
      ganime = 2;
      if (debugShow == true) {
        text("gomba död", 800, 100);
      }
    }*/
  }
  public void movement() {
    x = x + hastighet;
  }
}
