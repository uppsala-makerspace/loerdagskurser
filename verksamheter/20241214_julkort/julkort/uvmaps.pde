/**
 * En klass som kan hantera en bildfil som är 128 x 256 pixlar stor.
 * Varje delbild är 64 x 64 pixlar stor.
 *
 * Efter att objektet är skapat med eb bildfil som input så kan man hämta
 * varje delbild genom att anropa bild(x) där x är 0 - 199
 *
 * Exempel:
 *
 * UVMap bilder = new UIMap("min_bildfil.png");
 * PImage bild_10 = bilder.bild(10);
 */
class UVMap {
  PImage bild;
  
  /**
   * Skapa en bildkarta av den angivna filen
   */
  public UVMap(String filnamn) {
    bild = loadImage(filnamn);
  }
  
  /**
   * Returnera en specifik del av bilden
   */
  public PImage bild(int bildId, int yy) {
    PImage b;
    
    int x = (bildId % 10) * 32;
    int y = (bildId / 10) * 32;
    b = createImage(32, 32, RGB);
    b = bild.get(x, y, 32, yy);
    
    return b;
  }
  
  /**
   * Returnerar en tom bild med bara ett rutnät för alla individuella bilder.
   */
  public PImage tomBild() {
    PGraphics pg = null;
    
    pg = createGraphics(128, 256);
    pg.beginDraw();
    pg.background(255);
    pg.stroke(0);
    for (int x = 0; x < 11; x++) {
      if (x > 0) {
        pg.line(x*32, 0, x*32, 900);
      }
    }
    for (int y = 0; y < 32; y++) {
      if (y > 0) {
        pg.line(0, y*32, 1200, y*32);
      }
    }
    pg.endDraw();

    return pg;
  }
}  
