int reb = 456;
float hastighet = 812;


void setup()
{
  size(545, 656);
}
void draw(){
  fill(mouseX, mouseY, 256);
  if(mouseX<=width/4 && mouseY<=height/4)fill(0);
  ellipse(mouseX, mouseY, 50, 50);
  
}
