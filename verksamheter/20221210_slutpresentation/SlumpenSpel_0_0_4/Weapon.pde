class Weapon{
  //Skapar alla variabler
  float x, y, xOut, yOut, dist, angle, rotMaxSpeed,waggle,waggleTimer;
  //Sätt variablerna till de dom ska vara
  Weapon(){
    dist= 60;
    angle = 0;
    rotMaxSpeed=0.15;
    waggle = 0;
    waggleTimer = 0;
  }
  //methods
  void calculateWeapon(){
  x = cos(angle+waggle) * dist + player.x ;
  y = sin(angle+waggle) * dist + player.y ;
  
  xOut = cos(angle+waggle) * (dist+20) + player.x ;
  yOut = sin(angle+waggle) * (dist+20) + player.y ;
    final double dir = -atan2(player.x-mouseX,player.y-mouseY)-HALF_PI;
    angle = (float) dir;
  /*if(rotRight){
    angle=angle+rotMaxSpeed;
  }
  if(rotLeft){
    angle=angle-rotMaxSpeed;
  }*/
  if (mousePressed && (mouseButton == LEFT)){
  waggleTimer++;
  waggle = sin(waggleTimer/3)/10;
  for(int i=0;i<Enemies.length;i++){
    if(Distance(xOut,yOut,Enemies[i].X,Enemies[i].Y)<30){
      Enemies[i].Health-=10;
    }
  }
  }else{
    waggleTimer = 0;
    waggle = 0;
  }
  }
  void displayWeapon(){
   strokeWeight(6);
   point(x,y);
   strokeWeight(4);
   line(x,y,xOut,yOut);
   strokeWeight(1);
    text(x, 10, 50);
    text(y, 10, 70);
   
  }
}
