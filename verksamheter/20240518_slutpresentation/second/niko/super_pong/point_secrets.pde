void drawSecrets()
{
  if (score >20) {
    fill(255, 255, 0);
    text("Hello. Im the naviator. My dialog is yellow.", nav[0], nax[0]);
  }
  if (score >25) {
    nax[0] = width + width;
    nav[0] = width + width;
  }
    if (score > 99) {
      fill(255,255,0);
    text("Yo it's inverted.",nav[1],nax[1]);
      l = 0;
      d = 255;
    }
  if (score > 199) {
    nax[1] = width + width;
    nav[1] = width + width;
    l=255;
    d=0;
  }
  if (score > 68)
  {
    t[0] = t[0] + 5;
    image(troll, t[1], t[0]);
    fill(255,255,0);
    textSize(20);
    text(" you've been trolled",nav[N - 1],nax[N - 1]);
    if(score == 74){nav[N - 1] = width + width; nax[N - 1] = width + width;}
  }
  if (h == 1) {
    fill(l);
    text("Hey no hacking here.", width / 2, 700);
  }
}
