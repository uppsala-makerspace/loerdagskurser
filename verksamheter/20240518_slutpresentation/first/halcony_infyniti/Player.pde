class Player {
  PVector ps, st;

  int hack_time;
  int kultime;
  int kx, ky;

  int colors;

  int hurspelare;

  boolean upIsDown, doIsDown, leIsDown, riIsDown, wIsDown, sIsDown, dIsDown, aIsDown;
  boolean hacks1, hacks2;

  Player(int hurspelare_) {
    hurspelare = hurspelare_;
    st = new PVector(50, 50);
    if (hurspelare == 1) {
      colors=#1FD0FF;
      ps = new PVector(width/1.25, height/2);
    }
    if (hurspelare == 2) {
      colors=#FF0808;
      ps = new PVector(width/4, height/2);
    }
  }

  void show() {
    if (hurspelare == 1) {
      fill(colors);
      noStroke();
      ellipse(ps.x, ps.y, st.x, st.y);
    }
    if (hurspelare == 2) {
      fill(colors);
      noStroke();
      ellipse(ps.x, ps.y, st.x, st.y);
    }
  }

  void move() {
    if (hurspelare == 1) {
      if (play1.upIsDown == true) ps.y -= 5;
      
      if (play1.doIsDown == true) ps.y += 5;
      
      if (play1.riIsDown == true) ps.x += 5;
      
      if (play1.leIsDown == true) ps.x -= 5;
    }
    if (hurspelare == 2) {
      if (play2.wIsDown == true) ps.y -= 5;
      
      if (play2.sIsDown == true) ps.y += 5;
      
      if (play2.dIsDown == true) ps.x += 5;
      
      if (play2.aIsDown == true) ps.x -= 5;
    }
  }

  void where() {
    if (hurspelare == 1) {
      if (ps.x < width/2 + 25) ps.x = width/2 + 25;

      if (ps.x > width-25) ps.x = width-25;
      
      if (ps.y > height-25) ps.y = height-25;

      if (ps.y < 25) ps.y = 25;
    } else if (hurspelare == 2) {
      if (ps.x > width/2-25) ps.x = width/2-25;

      if (ps.x < 25) ps.x = 25;

      if (ps.y > height-25) ps.y = height-25;

      if (ps.y < 25) ps.y = 25;
    }
  }


  void shut() {
    if (hurspelare==1) {
    }
    if (hurspelare==2) {
    }
  }

  /*void hack() {
    if (hurspelare==1) {
      if (ps.x<width/2+32.5&&ps.x>width/2-32.5&&ps.y<height/2+32.5&&ps.y>height/2-32.5&&keyCode=='e'&&
        keyPressed == true&&second()-hack_time1>5&&hacks1==false) {
        hacks1==true;
      }
    }

    if (hurspelare==2) {
      if (ps.x<width/2+32.5&&ps.x>width/2-32.5&&ps.y<height/2+32.5&&ps.y>height/2-32.5&&keyCode=='.'&&
        keyPressed == true&&second()-hack_time2>5&&hacks2==false) {
        hacks2==true;
      }
    }
  }*/
}
