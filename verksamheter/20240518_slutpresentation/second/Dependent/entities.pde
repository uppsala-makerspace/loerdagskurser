

class EntityClass{
  boolean[] available = (boolean[]) new boolean[65536];
  Entity[] entities;
  float camX=0,camY=0;
  EntityClass(){
    entities = (Entity[]) new Entity[65536];
    for(int i=0;i<entities.length;i++) entities[i] = new Entity(i);
    for(int i=0;i<available.length;i++) available[i]=true;
  }
  
  void render(){
    for(Entity c:entities)if(!available[c.entity])if(c.image)MainGraphic.image(images[c.imageFace],c.X-camX-(c.Width/2),c.Y-camY-(c.Height/2),c.Width,c.Height);
  }
  
  void run(){
      for(Entity c:entities){if(!available[c.entity]){
        if(c.Y>1000){c.Y=CML[CML[0][5]][2];c.YV=0;c.X=CML[CML[0][5]][1];c.XV=0;}
        if(c.Friction==0)c.Friction=1;
        c.YV+=c.Grav;
        c.Y+=c.YV;
        c.XV/=c.Friction;
        c.X+=c.XV;
      }}
      if(true){
      Entity c,d;
      for(int i1=0 ;i1<available.length;i1++)
      if(!available[i1]&&entities[i1].paramcollide){
        c = entities[i1];
        for(int i2=i1+1;i2<available.length;i2++)
        if(!available[i2]&&entities[i2].paramcollide){
          d = entities[i2];
          if(!(c.Weight==0&&d.Weight==0)){
            if(abs((c.X)-(d.X))<(c.Width/2)+(d.Width/2))if(abs((c.Y)-(d.Y))<(c.Height/2)+(d.Height/2)){
              float[] collCheck = {c.X,c.Y,c.Width,c.Height,c.XV,c.YV,d.X,d.Y,d.Width,d.Height,d.XV,d.YV,c.Weight,d.Weight,0,0};
              collCheck = collisionCheck(collCheck);
              c.X=collCheck[0];
              c.Y=collCheck[1];
              c.Width=collCheck[2];
              c.Height=collCheck[3];
              c.XV=collCheck[4];
              c.YV=collCheck[5];
              d.X=collCheck[6];
              d.Y=collCheck[7];
              d.Width=collCheck[8];
              d.Height=collCheck[9];
              d.XV=collCheck[10];
              d.YV=collCheck[11];
            }
          }
        }
        if(!(c.Weight==0))
        for(int i2=0;i2<CML.length;i2++){
        if(DebugMode)if(CML[i2][0]==0){
          float[] collCheck = {c.X,c.Y,c.Width,c.Height,c.XV,c.YV,CML[i2][1],CML[i2][2],CML[i2][3],CML[i2][4],0,0,c.Weight,0,0,0};
          collCheck = collisionCheck(collCheck);
        }
        if(abs((c.X)-(CML[i2][1]))<(c.Width/2)+(CML[i2][3]/2))if(abs((c.Y)-(CML[i2][2]))<(c.Height/2)+(CML[i2][4]/2))
        if(CML[i2][0]==0){
          float[] collCheck = {c.X,c.Y,c.Width,c.Height,c.XV,c.YV,CML[i2][1],CML[i2][2],CML[i2][3],CML[i2][4],0,0,c.Weight,0,0,0};
          collCheck = collisionCheck(collCheck);
          c.X=collCheck[0];
          c.Y=collCheck[1];
          c.Width=collCheck[2];
          c.Height=collCheck[3];
          c.XV=collCheck[4];
          c.YV=collCheck[5];
        }
        }
      }}
  }
  
  float[] collisionCheck(float[] a){
    /*
     0=x1
     1=y1
     2=W1
     3=H1
     4=XV1
     5=YV1
     6=x2
     7=y2
     8=W2
     9=H2
    10=XV2
    11=YV2
    12=We1
    13=We2
    */
    float intersectX = min(a[0]+(a[2]/2),a[6]+(a[8]/2))-max(a[0]-(a[2]/2),a[6]-(a[8]/2));
    float intersectY = min(a[1]+(a[3]/2),a[7]+(a[9]/2))-max(a[1]-(a[3]/2),a[7]-(a[9]/2));
    if(intersectX<0||intersectY<0)return(a);
    float velocityX = a[4]+a[10];
    float velocityY = a[5]+a[11];
    int TB; //TopLeft/TopRight/BottomLeft/BottomRight
    if(a[12]==0){a[14]=0;a[15]=1;} else
    if(a[13]==0){a[14]=1;a[15]=0;} else
      {a[14]=a[12]/(a[12]+a[13]); a[15]=a[13]/(a[12]+a[13]);}
    
    TB=int(dist((a[0]-(a[2]/2)),0,(a[6]+(a[8]/2)),0)<dist((a[0]+(a[2]/2)),0,(a[6]-(a[8]/2)),0));//Sets to 0 if left, else 1 if up
    TB+=int(dist(0,(a[1]+(a[3]/2)),0,(a[7]-(a[9]/2)))>dist(0,(a[1]-(a[3]/2)),0,(a[7]+(a[9]/2))))*2;//Adds none if upwards, else adds 2 if downwards
    if(DebugMode){
      DebugDraw.stroke(#00ff00);
      DebugDraw.line(a[0]-(a[2]/2.5)-camX,a[1]-(a[3]/2.5)-camY,a[6]+(a[8]/2.5)-camX,a[7]+(a[9]/2.5)-camY);
      DebugDraw.line(a[0]-(a[2]/2.5)-camX,a[1]+(a[3]/2.5)-camY,a[6]+(a[8]/2.5)-camX,a[7]-(a[9]/2.5)-camY);
      DebugDraw.line(a[0]+(a[2]/2.5)-camX,a[1]-(a[3]/2.5)-camY,a[6]-(a[8]/2.5)-camX,a[7]+(a[9]/2.5)-camY);
      DebugDraw.line(a[0]+(a[2]/2.5)-camX,a[1]+(a[3]/2.5)-camY,a[6]-(a[8]/2.5)-camX,a[7]-(a[9]/2.5)-camY);
      DebugDraw.stroke(#ff0000);
      if(TB==3)DebugDraw.line(a[0]-(a[2]/2.5)-camX,a[1]-(a[3]/2.5)-camY,a[6]+(a[8]/2.5)-camX,a[7]+(a[9]/2.5)-camY);
      if(TB==1)DebugDraw.line(a[0]-(a[2]/2.5)-camX,a[1]+(a[3]/2.5)-camY,a[6]+(a[8]/2.5)-camX,a[7]-(a[9]/2.5)-camY);
      if(TB==2)DebugDraw.line(a[0]+(a[2]/2.5)-camX,a[1]-(a[3]/2.5)-camY,a[6]-(a[8]/2.5)-camX,a[7]+(a[9]/2.5)-camY);
      if(TB==0)DebugDraw.line(a[0]+(a[2]/2.5)-camX,a[1]+(a[3]/2.5)-camY,a[6]-(a[8]/2.5)-camX,a[7]-(a[9]/2.5)-camY);
          
    }
    float firstX=(a[0]+(a[2]*((TB%2)*2-1))); float secondX=(a[6]-(a[8]*((TB%2)*2-1))); float firstY=(a[1]+(a[3]*(floor(TB/2)*2-1))); float secondY=(a[7]-(a[9]*(floor(TB/2)*2-1)));
    if(TB==0){firstX=a[0]+(a[2]/2);secondX=a[6]-(a[8]/2);firstY=a[1]+(a[3]/2);secondY=a[7]-(a[9]/2);}
    if(TB==1){firstX=a[0]-(a[2]/2);secondX=a[6]+(a[8]/2);firstY=a[1]+(a[3]/2);secondY=a[7]-(a[9]/2);}
    if(TB==2){firstX=a[0]+(a[2]/2);secondX=a[6]-(a[8]/2);firstY=a[1]-(a[3]/2);secondY=a[7]+(a[9]/2);}
    if(TB==3){firstX=a[0]-(a[2]/2);secondX=a[6]+(a[8]/2);firstY=a[1]-(a[3]/2);secondY=a[7]+(a[9]/2);}
    
    if(dist(firstX,firstY,secondX,secondY)<2){return(a);}
    
    if(((TB==0&&firstX-firstY<secondX-secondY)||(TB==2&&firstX+firstY<secondX+secondY))||((TB==1&&firstY+firstX>secondY+secondX)||(TB==3&&firstX-firstY>secondX-secondY))){
      if(a[6]<a[0]){
        if((a[4]-a[10])>1) return(a);
        a[0]+=intersectX*a[14];
        a[6]-=intersectX*a[15];//Right collision
      }else{
        if((a[10]-a[4])>1) return(a);
        a[0]-=intersectX*a[14];
        a[6]+=intersectX*a[15];//Left collision
      }
      if(a[12]==0||a[13]==0)velocityX=0;
      a[4]=velocityX*a[14];
      a[10]=velocityX*a[15];
    }else{
      if(a[7]<a[1]){
        if((a[5]-a[11])>1) return(a);
        a[1]+=intersectY*a[14];
        a[7]-=intersectY*a[15];//Down collision
      }else{
        if((a[11]-a[5])>1) return(a);
        a[1]-=intersectY*a[14];
        a[7]+=intersectY*a[15];//Up collision
      }
      if(a[12]==0||a[13]==0)velocityY=0;
      a[5]=velocityY*a[14];
      a[11]=velocityY*a[15];
    }
    return(a);
  }
  
  int newEntity(){
    for(int i=0;i<available.length+1;i++){
      if(i>=available.length){
        println();
        print("Array Error - Could not create entity at or beyond array spot " + available.length);
        exit();
        return 0;
      }else{
        if(available[i]){
          available[i]=false;
          return i;
        }
      }
    }
    return 0;
  }
  
  class Entity{
    int entity = 0;
    float X,Y,XV,YV,Weight,Grav,Width,Height,Friction;
    boolean paramfriendly=false,paramhostile=false,paramprojectile=false,paramenemy=false,paramplayer=false,paramliving=false,paramcollide=true;
    boolean image = false; int imageFace = 3;
    int type=0;
    String[] TypeData;
    /*Types
    0 - normal entity
    1 - weapon
      0 - Firerate
      1 - Semi/burst/auto
      2 - Magazine
      3 - MagazineMaximum
      4 - BulletType
    2 - pickups
      0 - Amount
      1 - Type
    */
    //parameters param;
    Entity(int i){
      entity = i;
      X=0;
      Y=0;
      XV=0;
      YV=0;
      Weight=0;
      Grav=0;
      Width=0;
      Height=0;
      Friction=0;
      type=0;
      //param = (parameters) new parameters();
    }
    /*class parameters{
      boolean friendly,hostile,projectile,enemy,player,living;
      parameters(){
        friendly=false;
        hostile=false;
        projectile=false;
        enemy=false;
        player=false;
        living=false;
      }
    }*/
  }
}

int posToCor(int pos){
  return pos/16;
}

int posToCor(float pos){
  return int(pos/16);
}

int corToPos(int pos){
  return pos*16;
}

int corToPos(float pos){
  return int(pos*16);
}
