int wave=0;
void waveScript(){
  if(wave==1){WaveScript1();return;}
}
  void WaveScript1(){
    for(int i=0;i<15;i++){
      //Enemies[i] = new enemyClass(random(width),random(height),100);
      Enemies = (enemyClass[]) append(Enemies,(enemyClass) new enemyClass(1,0,random(height),100));
      Wait(60);
    }
    Wait(120);
    for(int i=0;i<7;i++){
      //Enemies[i] = new enemyClass(random(width),random(height),100);
      Enemies = (enemyClass[]) append(Enemies,(enemyClass) new enemyClass(1,0,random(height),100));
      Wait(30);
      Enemies = (enemyClass[]) append(Enemies,(enemyClass) new enemyClass(1,width,random(height),100));
      Wait(30);
    }
    Wait(120);
    for(int i=0;i<3;i++){
      //Enemies[i] = new enemyClass(random(width),random(height),100);
      for(int i2=0;i2<6;i2++){
        Enemies = (enemyClass[]) append(Enemies,(enemyClass) new enemyClass(2,random(width),0,100));
        Wait(45);
      }
      Enemies = (enemyClass[]) append(Enemies,(enemyClass) new enemyClass(1,0,height,100));
      Enemies = (enemyClass[]) append(Enemies,(enemyClass) new enemyClass(1,width,height,100));
    }
    Wait(240);
    for(int i=0;i<9;i++){
      Enemies = (enemyClass[]) append(Enemies,(enemyClass) new enemyClass(1,0,(8-i)*100,100));
      Enemies = (enemyClass[]) append(Enemies,(enemyClass) new enemyClass(1,i*100,0,100));
      Enemies = (enemyClass[]) append(Enemies,(enemyClass) new enemyClass(1,width,i*100,100));
      Enemies = (enemyClass[]) append(Enemies,(enemyClass) new enemyClass(1,(8-i)*100,height,100));
    }
    Wait(240*3);
  }
  //(BulletClass[]) append(Bullets,newBullets)
void Wait(float w){
  w+=timer;
  while(w>timer){
    delay(int(1/60*1000));
  }
}
