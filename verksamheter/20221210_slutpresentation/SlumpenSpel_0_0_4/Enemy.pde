class enemyClass{
  float X,Y,Health;
  enemyClass(float newX,float newY,float newHealth){
    X = newX;
    Y = newY;
    Health = newHealth;
  }
  void Compute(){
    final int TargetX = (int) player.x;
    final int TargetY = (int) player.y;
    final double dir = atan2(TargetX-X,TargetY-Y);
    X+=sin((float) dir);
    Y+=cos((float) dir);
    if(sqrt(((X-TargetX)*(X-TargetX))
    +((Y-TargetY)*(Y-TargetY)))<25){
      Health-=100;
      HP--;
    }
    fill(255);
    rect(X-25,Y-25,50,50);
    fill(0);
    rect(X-20,Y+20,40,20);
    fill(255,0,0);
    rect(X-18,Y+22,Health/100*36,16);
    fill(255);
  }
}

enemyClass[] Enemies;
int HP,MaxHP;
PImage HealthTexture;
int[] GuiAlpha;


void setupEnemyGui(){
  Enemies = new enemyClass[15];
  for(int i=0;i<Enemies.length;i++){
    Enemies[i] = new enemyClass(random(width),random(height),100);
  }
  HealthTexture = loadImage("Hearts2.png");
  MaxHP = 13;
  HP = MaxHP+10;
  GuiAlpha = new int[22*11];
}

void Enemy(){
  for(int i=0;i<Enemies.length;i++){
    if(Enemies[i].Health<=0){
      Enemies[i] = new enemyClass(random(width),random(height),100);
    }
    Enemies[i].Compute();
  }
}
void Health(){
  final PImage DrawImage = HealthTexture;
  for(int i=0;i<GuiAlpha.length;i++){
    if(player.x<55*MaxHP+30 && player.y<100){
      GuiAlpha[i]=100;
    }else{
      GuiAlpha[i]=255;
    }
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
