lift Lift = new lift(500,750);
void setup(){
  size(1000,1000);
  //print((color(000,255,000) >> 8) & 0xFF/255);
  //print(pow(256,2));
  //print(256*256);
}
void draw(){
  Lift.drawLift();
  line(random(1000),random(1000),random(1000),random(1000));
}
