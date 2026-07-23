class enemyClass{
  float id,X,Y,Health;
  enemyClass(int newId, float newX,float newY,float newHealth){
    id = newId;
    X = newX;
    Y = newY;
    Health = newHealth;
  }
  void Compute(){
    final int TargetX = (int) player.x;
    final int TargetY = (int) player.y;
    final double dir = atan2(TargetX-X,TargetY-Y);
    X+=sin((float) dir)*getSpeed();
    Y+=cos((float) dir)*getSpeed();
    if(sqrt(((X-TargetX)*(X-TargetX))
    +((Y-TargetY)*(Y-TargetY)))<25){
      Health-=100;
      HP--;
    }
    //fill(0,0,255);
    //rect(X-25,Y-25,50,50);
    image(enemyTexture, X-25, Y-25);
    /**/fill(0);
    rect(X-20,Y+20,40,20);
    fill(255,0,0);
    rect(X-18,Y+22,Health/100*36,16);
    fill(255);
  }
  float getSpeed(){
    if(id==1){return(1);}else
    if(id==2){return(2);}else
    {return(1);}
  }
}

enemyClass[] Enemies;
int HP,MaxHP;
PImage HealthTexture;
PImage enemyTexture;
int[] GuiAlpha;


void setupEnemyGui(){
  Enemies = new enemyClass[0];
  HealthTexture = loadImage("Hearts3.png");
  if(chicken == false){
  enemyTexture = loadImage("enemy.png");
  }
  if(chicken == true){
  enemyTexture = loadImage("chicken.png");
  }
  MaxHP = 13;
  HP = MaxHP;
  GuiAlpha = new int[22*11];
}

void Enemy(){
  for(int i=0;i<Enemies.length;i++){
    if(Enemies[i].Health<=0){
      //Enemies[i] = new enemyClass(random(width),random(height),100);
    }else{
      Enemies[i].Compute();
    }
  }
}
void Health(){
  /*final color colord = color(255);
  println(colord.brightness()(colord >> 24) & 0xFF);*/
  
  PImage DrawImage = HealthTexture.copy();
  /*for(int i2=0;i2<HealthTexture.width;i2++){
    for(int i=0;i<HealthTexture.height;i++){*/
  for(int i=0;i<GuiAlpha.length;i++){
      if(player.x<55*MaxHP+30 && player.y<100){
        GuiAlpha[i]=100*(((HealthTexture.pixels[i] >> 24) & 0xFF/255));
      }else{
        GuiAlpha[i]=255/**/*(((HealthTexture.pixels[i] >> 24) & 0xFF/255));
      }
    //}
  }
    
    DrawImage.mask(GuiAlpha);
  //text((float) dir,10,10);
  for(int i=0;i<MaxHP;i++){
    if(i<HP){
      image(DrawImage,10+(55*i),20,55,55,0,0,11,11);
    }else{
      image(DrawImage,10+(55*i),20,55,55,11,0,22,11);
    }
  }
    textSize(60);
    fill(0);
  if(HP>MaxHP){
    final String[] Plus = {"+",str(HP-MaxHP)};
    text(join(Plus,""),55*MaxHP+10,55);
  }else if(HP<0){
    final String[] Plus = {"",str(HP)};
    text(join(Plus,""),55*MaxHP+10,55);
  }
    fill(255);
    textSize(10);
    
}

float Distance(float X1,float Y1,float X2,float Y2){
  return (sqrt(((X1-X2)*(X1-X2))
    +((Y1-Y2)*(Y1-Y2))));
}

//Made by The Lift
//Thanks a lot man
//No problem anonymous user /The Lift
//it was me /anonymus user (writen by ludvig)
