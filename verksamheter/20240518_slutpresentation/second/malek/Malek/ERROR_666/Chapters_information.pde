 void information()
 {
 rect(410, 20, 180, 80, 18);
  rect(410, 110, 180, 80, 18);
  rect(410, 200, 180, 80, 18);
    
        
        //Coming Soon
     if (mousePressed == true && mouseX > 20 && mouseY > 20 && mouseY < 20)
    {
      grej_klickat = true;
      save("window.tif");
      sekund_naer_klickat = millis();
    } else
    {
      //; // nothing
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
      fill(255);
      text("COmIng so0n", 200, 170);
    }
  }
