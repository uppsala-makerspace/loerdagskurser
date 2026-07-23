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
float[] objects;
PVector position;
PVector velocity;
float radius, m;
class fysicmotor{  
  int circles(float x,float y, float d) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(3);
    radius = d;
    m = radius*.1;
    return(0);
}
  public void setups()
  {
    objects = new float[sizes];
    //  for (int i = 0;i<sizes;i++) {objects[i] = f    loat(circles(xs[i],ys[i],ds[i]));}
    xs = new float[sizes];
    xs[0] = 400;
    xs[1] = 150;
    xs[2] = 120;
    ys = new float[sizes];
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
    //ys = new float[sizes];
    //ys[0] = 150;
    //ys[1] = 100;
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
    ws[2] = tempw(0,int(ds[2]),10,8); //gauntlet 2
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
        //if (dist(xs[i], ys[i],xs[j],ys[j]) >= 0) {
          //fill(255,0,0);
          speedx[j] = speedx[i] / mass[j] + ds[j] / ws[j];
          speedx[i] = speedx[i] - speedx[j];
          //speedy[0] = speedy[1] / mass[0] + ds[0] / ws[0];
          //speedy[1] = speedy[1] - speedy[0]; 
          xs[1] = xs[1] - 1;
      //}

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
 /* void checkCollision(Ball other) {

    // Get distances between the balls components
    PVector distanceVect = PVector.sub(other.position, position);

    // Calculate magnitude of the vector separating the balls
    float distanceVectMag = distanceVect.mag();

    // Minimum distance before they are touching
    float minDistance = radius + other.radius;

    if (distanceVectMag < minDistance) {
      float distanceCorrection = (minDistance-distanceVectMag)/2.0;
      PVector d = distanceVect.copy();
      PVector correctionVector = d.normalize().mult(distanceCorrection);
      other.position.add(correctionVector);
      position.sub(correctionVector);

      // get angle of distanceVect
      float theta  = distanceVect.heading();
      // precalculate trig values
      float sine = sin(theta);
      float cosine = cos(theta);

      /* bTemp will hold rotated ball positions. You 
       just need to worry about bTemp[1] position*/
      /*PVector[] bTemp = {
        new PVector(), new PVector()
      };

      /* this ball's position is relative to the other
       so you can use the vector between them (bVect) as the 
       reference point in the rotation expressions.
       bTemp[0].position.x and bTemp[0].position.y will initialize
       automatically to 0.0, which is what you want
       since b[1] will rotate around b[0] */
      /*bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
      bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

      // rotate Temporary velocities
      PVector[] vTemp = {
        new PVector(), new PVector()
      };

      vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
      vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
      vTemp[1].x  = cosine * other.velocity.x + sine * other.velocity.y;
      vTemp[1].y  = cosine * other.velocity.y - sine * other.velocity.x;

      /* Now that velocities are rotated, you can use 1D
       conservation of momentum equations to calculate 
       the final velocity along the x-axis. */
      /*PVector[] vFinal = {  
        new PVector(), new PVector()
      };

      // final rotated velocity for b[0]
      vFinal[0].x = ((m - other.m) * vTemp[0].x + 2 * other.m * vTemp[1].x) / (m + other.m);
      vFinal[0].y = vTemp[0].y;

      // final rotated velocity for b[0]
      vFinal[1].x = ((other.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + other.m);
      vFinal[1].y = vTemp[1].y;

      // hack to avoid clumping
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      /* Rotate ball positions and velocities back
       Reverse signs in trig expressions to rotate 
       in the opposite direction */
      // rotate balls
      /*PVector[] bFinal = { 
        new PVector(), new PVector()
      };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // update balls to screen position
      other.position.x = position.x + bFinal[1].x;
      other.position.y = position.y + bFinal[1].y;

      position.add(bFinal[0]);

      // update velocities
      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;*/
    //}
}//}
