int red = 256,x=100;
int[] st;
float hastighet = 912;
PVector ps;
boolean culor;

void setup() {
  fullScreen(P3D);
  background(0);
  
  st = new int[2];
  
  ps = new PVector(width/4,height/4);
  st[0] = width/2;
  st[1] = height/2;
  
  surface.setSize(st[0],st[1]);
  surface.setLocation(width/2,height/2);
}

void draw(){
  fill(red,0,0);
  translate(ps.x,ps.y,0);
  lights();
  sphere(x);
  translate(-ps.x,-ps.y,0);
  surface.setSize(st[0],st[1]);
}

void keyPressed() {
  if(key==ESC)key='e';
  if(key==DELETE)exit();
  if(key=='w'){
    x-=2;
    st[0]-=2;
    st[1]-=2;
  }
  if(key=='s'){
    x+=2;
    st[0]+=2;
    st[1]+=2;
  }
}

void keyReleased() {
  if(key=='w'){
    x-=0;
    st[0]-=0;
    st[1]-=0;
  }
}
