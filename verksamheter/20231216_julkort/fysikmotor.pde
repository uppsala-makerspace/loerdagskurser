float[] kxs;
float[] kys;
float[] kds;
float[] krs;
float[] kspeedx;
float[] kspeedy;
int ksizes = 3;
float[] kws;
float[] kmass;
float[] kmd;
float[] kobjects;
PVector kposition;
PVector kvelocity;
float kradius, m;
class fysicmotor{  
  int circles(float x,float y, float d) {
    kposition = new PVector(x, y);
    kvelocity = PVector.random2D();
    kvelocity.mult(3);
    kradius = d;
    m = kradius*.1;
    return(0);
}
  public void ksetups()
  {
    kobjects = new float[ksizes];
    //  for (int i = 0;i<ksizes;i++) {kobjects[i] = float(circles(kxs[i],kys[i],kds[i]));}
    kxs = new float[ksizes];
    kxs[0] = 170;
    kxs[1] = 150;
    kxs[2] = 120;
    kmd = new float[3];
    kmd[0] = 670;
    kmd[1] = 900;
    kmd[2] = 897;
    kspeedx = new float[ksizes];
    kspeedx[0] = 0;
    kspeedx[1] = 0;
    kspeedx[2] = 0;
    kspeedy = new float[ksizes];
    kspeedy[0] = 0;
    kspeedy[1] = 0;
    kspeedy[2] = 0;
    kys = new float[ksizes];
    kys[0] = 150;
    kys[1] = 145;
    kys[2] = 145;
    kds = new float[ksizes];
    kds[0] = 30;
    kds[1] = 15;
    kds[2] = 16;
    krs = new float[ksizes];
    krs[0] = kds[0] / 2;
    krs[1] = kds[1] / 2;
    krs[2] = kds[2] / 2;
    kws = new float[ksizes];
    kws[0] = tempw(0,int(kds[0]),20,3);
    kws[1] = tempw(0,int(kds[1]),8,2);
    kws[2] = tempw(0,int(kds[2]),10,2); //gauntlet 2
    kmass = new float[ksizes];
    kmass[0] = kmd[0] * kds[0] * kds[0] * 1;//kmass[0] = kds[0] * kws[0];//tempw(0,int(kds[0]),20,18);
    kmass[1] = kmd[1] * kds[1] * kds[1] * 1;//kds[1] * kws[1];//tempw(0,int(kds[1]),8,6);
    kmass[2] = kmd[2] * kds[2] * kds[2] * 1;//kds[1] * kws[1];//tempw(0,int(kds[1]),8,6);
  }
  public void kdraws()  
  {
    for (int i=0;i<ksizes;i++)
    {
      for (int j=0;j<ksizes;j++){
      if (i == j) {continue;}
      fill(255,255,255);
      kxs[i] = kxs[i] + kspeedx[i];
      kys[i] = kys[i] + kspeedy[i];
      // #F2F2F2
      if (dist(kxs[i], kys[i],kxs[j],kys[j]) < krs[j] + krs[i])
      {
       // if (dist(kxs[i], kys[i],kxs[j],kys[j]) >= 0) {
         float tx = kxs[i] - kxs[j];
         if(tx > 0) {tx = 1;}
         else if(tx < 0) {tx = -1;}
         if (tx == -1){
            kspeedx[j] = kspeedx[i] / kmass[j] + kds[j] / kws[j];
            kspeedx[i] = kspeedx[i] - kspeedx[j];
            kxs[1] = kxs[1] - 1;
           }
         else if (tx == 1){
            kspeedx[j] = kspeedx[i] / kmass[j] - kds[j] / kws[j];
            kspeedx[i] = kspeedx[i] - kspeedx[j];
            kxs[1] = kxs[1] + 1;
           }
          //fill(255,0,0);
          //kspeedx[j] = kspeedx[i] / kmass[j] + kds[j] / kws[j];
          //kspeedx[i] = kspeedx[i] - kspeedx[j];
          //kspeedy[0] = kspeedy[1] / kmass[0] + kds[0] / kws[0];
          //kspeedy[1] = kspeedy[1] - kspeedy[0]; 
          //kxs[1] = kxs[1] - 1;
//      }
      }
      if (kxs[i] < 110) {kxs[i] = 110; kspeedx[i] = 0 - kspeedx[i];}
      else if (kxs[i] > 185) {kxs[i] = 185; kspeedx[i] = 0 - kspeedx[i];}
      if (kys[i] < 110) {kys[i] = 110; kspeedy[i] = 0 - kspeedy[i];}
      else if (kys[i] > 190) {kys[i] = 190; kspeedy[i] = 0 - kspeedy[i];}
      if (kspeedx[i] >= 0) {kspeedx[i] = kspeedx[i] - 0.01;}
      else if (kspeedx[i] <= 0) {kspeedx[i] = kspeedx[i] + 0.01;}
      if (kspeedy[i] >= 0) {kspeedy[i] = kspeedy[i] - 0.01;}
      else if (kspeedy[i] <= 0) {kspeedy[i] = kspeedy[i] + 0.01;} //<>//
      stroke(0);
      strokeWeight(1);
      ellipse(kxs[i],kys[i],kds[i],kds[i]);
    }}
      if (keyPressed) {
        if (key == 'd' ||key == 'D') {
          //kspeedx[1] = 3;
          if (kspeedx[1] <= 1) {
            kspeedx[1] += 0.1;
          }
        }
        if (key == 's' ||key == 'S') {
          //kspeedx[1] = 3;
          if (kspeedy[1] <= 1) {
            kspeedy[1] += 0.1;
          }
        }
        if (key == 'w' ||key == 'W') {
          //kspeedx[1] = 3;
          if (kspeedy[1] >= -1) {
            kspeedy[1] -= 0.1;
          }
        }
        if (key == 'r' ||key == 'R') {
          //if (kspeedx[1] != 0 && kspeedx[1] == 3){
          //  kspeedx[1] = kspeedx[1] - 0.01;
          //}
          kspeedx[1] = 0;
          kspeedy[1] = 0;
        }
        if (key == 'a' ||key == 'A') {
                 //kspeedx[1] = -3;
          if (kspeedx[1] >= -1) {
            kspeedx[1] -= 0.1;
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
    PVector distanceVect = PVector.sub(other.kposition, kposition);

    // Calculate magnitude of the vector separating the balls
    float distanceVectMag = distanceVect.mag();

    // Minimum distance before they are touching
    float minDistance = kradius + other.kradius;

    if (distanceVectMag < minDistance) {
      float distanceCorrection = (minDistance-distanceVectMag)/2.0;
      PVector d = distanceVect.copy();
      PVector correctionVector = d.normalize().mult(distanceCorrection);
      other.kposition.add(correctionVector);
      kposition.sub(correctionVector);

      // get angle of distanceVect
      float theta  = distanceVect.heading();
      // precalculate trig values
      float sine = sin(theta);
      float cosine = cos(theta);

      /* bTemp will hold rotated ball kpositions. You 
       just need to worry about bTemp[1] kposition*/
      /*PVector[] bTemp = {
        new PVector(), new PVector()
      };

      /* this ball's kposition is relative to the other
       so you can use the vector between them (bVect) as the 
       reference point in the rotation expressions.
       bTemp[0].kposition.x and bTemp[0].kposition.y will initialize
       automatically to 0.0, which is what you want
       since b[1] will rotate around b[0] */
      /*bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
      bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

      // rotate Temporary velocities
      PVector[] vTemp = {
        new PVector(), new PVector()
      };

      vTemp[0].x  = cosine * kvelocity.x + sine * kvelocity.y;
      vTemp[0].y  = cosine * kvelocity.y - sine * kvelocity.x;
      vTemp[1].x  = cosine * other.kvelocity.x + sine * other.kvelocity.y;
      vTemp[1].y  = cosine * other.kvelocity.y - sine * other.kvelocity.x;

      /* Now that velocities are rotated, you can use 1D
       conservation of momentum equations to calculate 
       the final kvelocity along the x-axis. */
      /*PVector[] vFinal = {  
        new PVector(), new PVector()
      };

      // final rotated kvelocity for b[0]
      vFinal[0].x = ((m - other.m) * vTemp[0].x + 2 * other.m * vTemp[1].x) / (m + other.m);
      vFinal[0].y = vTemp[0].y;

      // final rotated kvelocity for b[0]
      vFinal[1].x = ((other.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + other.m);
      vFinal[1].y = vTemp[1].y;

      // hack to avoid clumping
      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      /* Rotate ball kpositions and velocities back
       Revekrse signs in trig expressions to rotate 
       in the opposite direction */
      // rotate balls
      /*PVector[] bFinal = { 
        new PVector(), new PVector()
      };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // update balls to screen kposition
      other.kposition.x = kposition.x + bFinal[1].x;
      other.kposition.y = kposition.y + bFinal[1].y;

      kposition.add(bFinal[0]);

      // update velocities
      kvelocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      kvelocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.kvelocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.kvelocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;*/
    //}
}//}
