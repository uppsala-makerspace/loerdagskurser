float[] xs;
float[] ys;
float[] ds;
float[] rs;
float[] speedx;
float[] speedy;
int sizes = 3;
float[] ws;
float[] mass;
float[] md;
class fysicmotor{
  public void setups()
  {
    xs = new float[sizes];
    xs[0] = 400;
    xs[1] = 150;
    xs[2] = 120;
    md = new float[3];
    md[0] = 670;
    md[1] = 900;
    md[2] = 897;
    speedx = new float[sizes];
    speedx[0] = 0;
    speedx[1] = 0;
    speedx[2] = 0;
    speedy = new float[sizes];
    speedy[0] = 0;
    speedy[1] = 0;
    speedy[2] = 0;
    ys = new float[sizes];
    ys[0] = 150;
    ys[1] = 100;
    ys[2] = 100;
    ds = new float[sizes];
    ds[0] = 180;
    ds[1] = 60;
    ds[2] = 70;
    rs = new float[sizes];
    rs[0] = ds[0] / 2;
    rs[1] = ds[1] / 2;
    rs[2] = ds[2] / 2;
    ws = new float[sizes];
    ws[0] = tempw(0,int(ds[0]),20,18);
    ws[1] = tempw(0,int(ds[1]),8,6);
    ws[2] = tempw(0,int(ds[2]),10,8);
    mass = new float[sizes];
    mass[0] = md[0] * ds[0] * ds[0] * 1;//mass[0] = ds[0] * ws[0];//tempw(0,int(ds[0]),20,18);
    mass[1] = md[1] * ds[1] * ds[1] * 1;//ds[1] * ws[1];//tempw(0,int(ds[1]),8,6);
    mass[2] = md[2] * ds[2] * ds[2] * 1;//ds[1] * ws[1];//tempw(0,int(ds[1]),8,6);
  }
  public void draws()  
  {
    background(224,224,224);
    for (int i=0;i<sizes;i++)
    {
      for (int j=0;j<sizes;j++){
      if (i == j) {continue;}
      fill(255,255,255);
      xs[i] = xs[i] + speedx[i];
      ys[i] = ys[i] + speedy[i];
      // #F2F2F2
      if (dist(xs[i], ys[i],xs[j],ys[j]) < rs[j] + rs[i])
      {
        //fill(255,0,0);
        speedx[j] = speedx[i] / mass[j] + ds[j] / ws[j];
        speedx[i] = speedx[i] - speedx[j];
        //speedy[0] = speedy[1] / mass[0] + ds[0] / ws[0];
        //speedy[1] = speedy[1] - speedy[0]; 
        xs[1] = xs[1] - 1;
      }
      if (speedx[i] >= 0) {speedx[i] = speedx[i] - 0.01;};
      if (speedx[i] <= 0) {speedx[i] = speedx[i] + 0.01;};
      if (speedy[i] >= 0) {speedy[i] = speedy[i] - 0.01;};
      if (speedy[i] <= 0) {speedy[i] = speedy[i] + 0.01;};
      ellipse(xs[i],ys[i],ds[i],ds[i]);
    }}
      if (keyPressed) {
        if (key == 'e' ||key == 'E') {
          //speedx[1] = 3;
          if (speedx[1] <= 3) {
            speedx[1] += 0.1;
          }
        }
        if (key == 'd' ||key == 'D') {
          //speedx[1] = 3;
          if (speedy[1] <= 3) {
            speedy[1] += 0.1;
          }
        }
        if (key == 's' ||key == 'S') {
          //speedx[1] = 3;
          if (speedy[1] >= -3) {
            speedy[1] -= 0.1;
          }
        }
        if (key == 'r' ||key == 'R') {
          //if (speedx[1] != 0 && speedx[1] == 3){
          //  speedx[1] = speedx[1] - 0.01;
          //}
          speedx[1] = 0;
          speedy[1] = 0;
        }
        if (key == 'w' ||key == 'W') {
                 //speedx[1] = -3;
          if (speedx[1] >= -3) {
            speedx[1] -= 0.1;
          }
        }
      }
  }
  
  
  int genheat(float spo,float spt,int bs,int tbtsiso,int tbtsist) {
    if (bs == 1) {return(int(spo + spt) / tbtsiso + tbtsist);}else {return(int(spo - spt) + tbtsiso / tbtsist);}
  }
  
  int tempw(int ih, int r, int mw, int tbtsis) {
    if (ih == 1) {return(r / 2 + mw + tbtsis);} else{
    return(r + mw + tbtsis);
    }
  }
}
