

/*
Types
  00 CollisionZone
    01 X
    02 Y
    03 Width
    04 Height
    06 ClipAll
    07 ClipPlayer
    08 ClipEnemies
    09 ClipLiving
    0A ClipProjectiles
    0B ClipHitscan
    0C ClipBullets
    0D ClipHostile
  01 ImageFace
    01 X
    02 Y
    03 Width
    04 Height
    05 ImageReference
    06 Rotation
    07 ImageWidth
    08 ImageHeight
  02 EntitySpawner
    01 X
    02 Y
    03 Rotation
    04 AutoSpawnSingle
    05 AutoSpawnSingleTarget
    80 ActionOnSpawn
  03 EntityReference
    01 X
    02 Y
    06 Type
    80 ActionOnDeath
  04 Trigger
    01 X
    02 Y
    03 Width
    04 Height
    05 Repeatable
    80 ActionOnTouch
  05 CollisionSlope
    01 X
    02 Y
    03 Width
    04 Height
    05 Direction
    06 ClipAll
    07 ClipPlayer
    08 ClipEnemies
    09 ClipLiving
    0A ClipProjectiles
    0B ClipHitscan
    0C ClipBullets
    0D ClipHostile
Actions
  01 SpawnEntity
    81 Target
    82 Reference
  02 EndLevel
    81 NextLevel
  03 Message
    81 ID
  04 Memory
    81 Index
    82 New
  05 WinScreen
    81 Message
    82 Score
*/


void loadMaps(){
}


void changeMaps(){
  mapData = new int[512][256];
  CML = new int[512][256]; //Current Map Loaded
  thisMap = int(loadStrings(MapLocs[CMT]));
  for(int i=0;i<thisMap.length;i++){  if(i<=thisMap.length)  mapData[floor(float(i)/256)][i%256] = thisMap[i]; else  mapData[floor(float(i)/256)][i%256] = 0;}
  println(MapLocs[CMT]);
  CML=mapData;
  
  for(int i = 0; i < CML.length; i++) {
    if(CML[i][0] != 2) continue;
    if(CML[i][3] != 2) continue;
    int entityNum = entities.newEntity();
    ammoBoxes = (int[]) append(ammoBoxes, entityNum);
    
    //parameters, yay
      entities.entities[entityNum].X = CML[i][1];
      entities.entities[entityNum].Y = CML[i][2];
      entities.entities[entityNum].Width = images[10].width;
      entities.entities[entityNum].Height = images[10].height;
      entities.entities[entityNum].image = true;
      entities.entities[entityNum].imageFace = 10;
      entities.entities[entityNum].paramcollide = false;
  }
}

void firstFunction(){
  for(int i=0;i<CML.length;i++){
    //if(CML[i][0]=02)if(boolean(CML[i][4]))
  }
}

void mapAction(int spot){
}
