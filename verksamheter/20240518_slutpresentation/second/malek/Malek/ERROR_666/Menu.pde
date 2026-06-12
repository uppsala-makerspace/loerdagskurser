void draw_menu()
{
  rect(410, 20, 180, 80, 18);
  rect(410, 110, 180, 80, 18);
  rect(410, 200, 180, 80, 18);
  fill(0, 75, 0);
  rect(230, 217, 130, 70, 108);
  fill(255);
  triangle (240, 260, 270, 250, 240, 235);

  textSize(40);
  text(ord[0], 270, 265);
  
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

PImage bild;
    {
      bild = loadImage("Meny.jpg");
      image(bild, 5, 5);
       }
    if (mousePressed == true && mouseX > 230 && mouseY > 217 && mouseY < 217 + 70) {
      is_game_running = true;
      background(0);
    }
  }
}
