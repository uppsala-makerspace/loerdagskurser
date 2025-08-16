fysicmotor fmotor;
void setup() {
  fullScreen();
  fmotor =  new fysicmotor();
  fmotor.setups();
}
void draw(){
  fmotor.draws();
}
