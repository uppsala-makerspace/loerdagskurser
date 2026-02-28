

class Player{
  int Excalibur,HP,Ammo,Magazine,MagazineMaximum,BulletDelay,Direction;
  int playerData;
  Player(){
    playerData = entities.newEntity();
    entities.entities[playerData].X = float(CML[CML[0][5]][1]);
    entities.entities[playerData].Y = CML[CML[0][5]][2];
    entities.entities[playerData].Width = CML[CML[0][5]][4];
    entities.entities[playerData].Height = CML[CML[0][5]][5];
    entities.entities[playerData].paramplayer = true;
    entities.entities[playerData].paramfriendly = true;
    entities.entities[playerData].paramliving = true;
    entities.entities[playerData].image = true;
    entities.entities[playerData].imageFace = 3;
    entities.entities[playerData].Grav=0.1;
    entities.entities[playerData].Weight=100;
    entities.entities[playerData].Friction=1.1;
    entities.entities[playerData].XV = 0;
    entities.entities[playerData].YV = 0;
    
    Ammo = 2048;
    Magazine = 15;
    MagazineMaximum = 15;
  }
  
  void run() {
    HP %= 10000000;
    
    float x = entities.entities[playerData].X;
    float y = entities.entities[playerData].Y;
    MainGraphic.translate(x - entities.camX + 5, y - entities.camY+0);
    MainGraphic.rotate(atan2(AimY - (y - entities.camY), AimX - (x - entities.camX)));
    MainGraphic.image(images[9], -3, -5);
    MainGraphic.rotate(-atan2(AimY - (y - entities.camY), AimX - (x - entities.camX)));
    MainGraphic.translate(-(x - entities.camX+ 5), -(y - entities.camY+0));
    if(keyed[16] >= 2 && Magazine > 0 && BulletDelay - nFrame<=0) {
      bullets[bulletIndex] = new Bullet(x + 2, y-5, atan2(AimY - (y - entities.camY), AimX - (x - entities.camX)), 32, true);
      bulletIndex++;
      bulletIndex %= bullets.length;
      Magazine--;
      BulletDelay=nFrame+3;
    }
    if(keyed[46] == 2 && Ammo > 0) {
      Magazine = 0;
      while (Magazine < MagazineMaximum && Ammo > 0) {
        Magazine++;
        Ammo--;
      }
    }
    
    for(int i = 0; i < ammoBoxes.length; i++) {
      float x1 = entities.entities[playerData].X;
      float y1 = entities.entities[playerData].Y;
      float width1 = entities.entities[playerData].Width;
      float height1 = entities.entities[playerData].Height;
      float x2 = entities.entities[ammoBoxes[i]].X;
      float y2 = entities.entities[ammoBoxes[i]].Y;
      float width2 = entities.entities[ammoBoxes[i]].Width;
      float height2 = entities.entities[ammoBoxes[i]].Height;
      if (x1 < x2 + width2 && x1 + width1 > x2 && y1 < y2 + height2 && y1 + height1 > y2) {
        Ammo += 2048;
        entities.available[i] = true;
        entities.entities[i].type = 2048;
        int[] newAmmoBoxes = new int[ammoBoxes.length - 1];
        
        for(int o = 0; o < ammoBoxes.length; o++) if(o != i) newAmmoBoxes = (int[]) append(newAmmoBoxes, ammoBoxes[o]);
        
        ammoBoxes = newAmmoBoxes;
      }
    }
  }
}
