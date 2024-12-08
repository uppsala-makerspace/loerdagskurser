float [] xs;
float [] ys;
float [] rs;
PImage bild;

boolean grej_klickat = false;
int sekund_naer_klickat = 1000000;
boolean grej2_klickat = false;
boolean grej3_klickat = false;

void setup()
{
  background(0);
  size(600, 320);
  xs = new float[256];
  ys = new float[256];
  rs = new float[256];
  for (int i=0; i<256; ++i)
  {
    xs[i] = 160;
    ys[i] = 100;
    rs[i] = 160;
  }
}


void draw()
{
  for (int i=0; i<256; ++i)
  {
    xs[i] += random(-4, 4);
    ys[i] += random(-4, 4);
    rs[i] += random(-4, 4);
    fill(rs[i]+10, 0, 0);
    stroke(rs[i]+10, 0, 0);
    ellipse(xs[i], ys[i], 10, 10);
  }
  stroke(0);
  fill(255);
  textSize(60);
  text("E", 40, height / 2);
  text("R", 80, height / 2);
  text("R", 120, height / 2);
  text("O", 160, height / 2);
  text("R", 200, height / 2);

  text("6", 260, height / 2);
  text("6", 290, height / 2);
  text("6", 320, height / 2);

  textSize(20);
  text("By: ShiftBlock", 80, 180);

  textSize(11);
  text("version_1.0.0", 5, 315);
  {
    rect(410, 20, 180, 80, 18);
    rect(410, 110, 180, 80, 18);
    rect(410, 200, 180, 80, 18);
    fill(0, 75, 0);
    rect(230, 217, 130, 70, 108);
    fill(255);
    triangle (240, 260, 270, 250, 240, 235);

    textSize(40);
    text("PLAY", 270, 265);

    PImage bild;
    {
      // size(20, 20);
      bild = loadImage("Meny.jpg");
      image(bild, 555, 5);
    }
    if (mousePressed == true && mouseX > 410 && mouseY > 20 && mouseY < 280)
    {
      grej_klickat = true;
      save("window.tif");
      sekund_naer_klickat = millis();
    } else
    {
      ; // nothing
    }
    if (grej_klickat == true && sekund_naer_klickat + 3000 < millis())
    {
      grej_klickat = false;
      background(0);
      bild = loadImage("window.tif");
    }
    if (grej_klickat == true)
    {
      textSize(40);

      rect(width / 2 - 200, height / 2 - 100, 400, 200);
      fill(0);
      text("COmIng so0n", 200, 170);
    }


    if (mousePressed == true && mouseX > 230 && mouseY > 217 && mouseY < 280)
    {
      grej_klickat = true;
      save("window.tif2");
      //save(230, 217, 130, 70, 108);
    } 
    else
    {
      //load();
    }
    if (grej_klickat == true)
    {
      grej_klickat = false;
      background(0);
    }
    if (grej_klickat == true);
  }
}
