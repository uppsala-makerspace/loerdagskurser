class Mario {
  boolean Alive=true;

  StringList animateplr;
  public Mario(float x, float y) {
    
    animateplr = new StringList();
    animateplr.append("mario.png");
    animateplr.append("MSTW.png");
    //this.y = y;
    //this.x = x;

  
  }
  public void forever(){
    if (keyPressed) {
      if (key == 'd' ||key == 'D') {
        plrx = plrx + 3;
        block_pos1 = block_pos1 - 3;
        block_pos2 = block_pos2 - 3;
        //String item = animateplr.get(1);

        //img = loadImage(item);
      }
  
      if (key == 'a' ||key == 'A') {
        plrx = plrx - 3;
        //String item = animateplr.get(1);

        //img = loadImage(item);
      }
    }
  }
}
