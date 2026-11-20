final int screenSize = 1;

import processing.sound.*;

int texture, GameTimer, mapPal, pellets;
byte Level, gameState;
boolean superP;

PImage menuImage;
boolean isMenuUp = true;

int[][] draws = (int[][]) new int[32*36][2];
int[][] drawsPos = (int[][]) new int[32*36][2];

void settings(){
  size(32 * 8 * screenSize, 36 * 8 * screenSize);
  smooth(0);
  //print(TextureData.length);
  Level = 0;
  LoadTextures();
  mapPal = 0;
  for(int i = 0; i < drawsPos.length; i++){
    if(i < 64){
      drawsPos[i][0] = i % 32 + 0; drawsPos[i][1] = 35 + floor(i / 32);
    }else if(i < (32 * 28) + 64){
      drawsPos[i][0] = floor(i / 32) - 0; drawsPos[i][1] = 3 + (i % 32);
    }else{
      drawsPos[i][0] = (i - 1024) % 32 + 0; drawsPos[i][1] = 1 + floor((i - 1024) / 32);
    }
  }
}

//en ändring och en till.

void setup(){
  //AnimTexTimer = 0;
  //AnimTexSpeed = 8;
  //AnimTexAmont = 6;
  //texture = 128 * 5;
  initializeMainCode();
  //player = defPlayer;
  //loaded=Map;
  player = (int[][]) new int[defPlayer.length][15];
  for(int i = 0; i < player.length; i++) arrayCopy(defPlayer[i], player[i]);
  //arrayCopy(defPlayer,player);
  loaded = (int[]) new int[Map.length];
  arrayCopy(Map, loaded);
  superP = false;
  pellets = 240;
  surface.setAlwaysOnTop(true);
  GameTimer = 0;
  menuImage = createImage(224, 288, RGB);
  menuImage.pixels = int(loadStrings("string"));
  menuImage.resize(width, height);
}

void draw(){
  GameTimer++;
  if(GameTimer <= 1){
    return;
  }else if(pellets == 0){setup();/*initializeMainCode();player = defPlayer;loaded=Map;superP=false;pellets=240;return;*/Level++; }else{
  superP=false;
  //texture = (texture + 1) % (ColorPalettes.length * 128);
  //AnimTexTimer++;
  //AnimTexTimer = AnimTexTimer % (AnimTexSpeed * AnimTexAmont);
  background((((float) millis()) / 10) % 256);
  drawAllTextures();
  drawTextures();
  if(pellets != 1) {
    windowTitle("Pacman - " + str(pellets) + " pellets left");
  }else{
    windowTitle("Pacman - 1 pellet left");
  }
  println(pellets);
  for(int i = 0; i < gh.length; i++){
    ghostBehaviour(i);
  }
  for(int i = 0;i < player.length; i++){
    for(int g=0;g<gh.length;g++){
      if(abs(gh[g][1]-player[i][0])<8&&abs(gh[g][2]-player[i][1])<8){player[i][14]=1;player[i][3]=0;}
    }
    if(player[i][14]!=0){player[i][3]++;if(player[i][3]/8<5){
      DrawTex(267+(floor((player[i][3]/3)/8)*4),player[i][13]+2-floor((player[i][3]%24)/8),player[i][0]+12,player[i][1]-4);
      DrawTex(266+(floor((player[i][3]/3)/8)*4),player[i][13]+2-floor((player[i][3]%24)/8),player[i][0]+20,player[i][1]-4);
      DrawTex(269+(floor((player[i][3]/3)/8)*4),player[i][13]+2-floor((player[i][3]%24)/8),player[i][0]+12,player[i][1]+4);
      DrawTex(268+(floor((player[i][3]/3)/8)*4),player[i][13]+2-floor((player[i][3]%24)/8),player[i][0]+20,player[i][1]+4);
    }else if(player[i][2]/8<11){
      DrawTex(267+(floor((player[i][3]/2)/8)*4),player[i][13]+3+floor((player[i][3]%16)/8),player[i][0]+12,player[i][1]-4);
      DrawTex(266+(floor((player[i][3]/2)/8)*4),player[i][13]+3+floor((player[i][3]%16)/8),player[i][0]+20,player[i][1]-4);
      DrawTex(269+(floor((player[i][3]/2)/8)*4),player[i][13]+3+floor((player[i][3]%16)/8),player[i][0]+12,player[i][1]+4);
      DrawTex(268+(floor((player[i][3]/2)/8)*4),player[i][13]+3+floor((player[i][3]%16)/8),player[i][0]+20,player[i][1]+4);
    }}else{
    if((player[i][0] % 8 == 0 && player[i][1] % 8 == 0) || (player[i][0] == 108 && player[i][1] % 8 == 0 && player[i][4] == 0)){
      if(loaded[((player[i][0])/8*32)+((player[i][1])/8)]==1||loaded[((player[i][0])/8*32)+((player[i][1])/8)]==2){if(loaded[((player[i][0])/8*32)+((player[i][1])/8)]==1){pellets--;}else{superP=true;}loaded[((player[i][0])/8*32)+((player[i][1])/8)]=0;}
            if((player[i][ 9]==1||player[i][4]==0)&&loaded[((player[i][0]+0)/8*32)+((player[i][1]-8)/8)]<3){player[i][2]=0;player[i][4]=4;
      }else if((player[i][10]==1||player[i][4]==1)&&loaded[((player[i][0]+8)/8*32)+((player[i][1]+0)/8)]<3){player[i][2]=1;player[i][4]=4;
      }else if((player[i][11]==1||player[i][4]==2)&&loaded[((player[i][0]+0)/8*32)+((player[i][1]+8)/8)]<3){player[i][2]=2;player[i][4]=4;
      }else if((player[i][12]==1||player[i][4]==3)&&loaded[((player[i][0]-8)/8*32)+((player[i][1]+0)/8)]<3){player[i][2]=3;player[i][4]=4;
      }
            if(loaded[((player[i][0]+0)/8*32)+((player[i][1]-8)/8)]<3&&player[i][2]==0){playerMove(i);
      }else if(loaded[((player[i][0]+8)/8*32)+((player[i][1]+0)/8)]<3&&player[i][2]==1){playerMove(i);
      }else if(loaded[((player[i][0]+0)/8*32)+((player[i][1]+8)/8)]<3&&player[i][2]==2){playerMove(i);
      }else if(loaded[((player[i][0]-8)/8*32)+((player[i][1]+0)/8)]<3&&player[i][2]==3){playerMove(i);
      }
    }else{
      /*if(player[i][2]%2==0){if(player[i][ 8]==1){player[i][2]=0;
                      }else if(player[i][10]==1){player[i][2]=2;}
                      }else{if(player[i][ 9]==1){player[i][2]=1;
                      }else if(player[i][11]==1){player[i][2]=3;}
                      }*/
            if(player[i][ 9]==1){player[i][4]=0;
      }else if(player[i][10]==1){player[i][4]=1;
      }else if(player[i][11]==1){player[i][4]=2;
      }else if(player[i][12]==1){player[i][4]=3;
      }
      playerMove(i);
    }
    DrawTex(227+(player[i][2]*4),floor(player[i][3]/8)+player[i][13],player[i][0]+12,player[i][1]-4);
    DrawTex(226+(player[i][2]*4),floor(player[i][3]/8)+player[i][13],player[i][0]+20,player[i][1]-4);
    DrawTex(229+(player[i][2]*4),floor(player[i][3]/8)+player[i][13],player[i][0]+12,player[i][1]+4);
    DrawTex(228+(player[i][2]*4),floor(player[i][3]/8)+player[i][13],player[i][0]+20,player[i][1]+4);
  }}
  for(int i=0;i<gh.length;i++){
    if(GameTimer>=i){
    gh[i][6]=(gh[i][6]+1);
    for(int die=0;die<1;die++){
    if(gh[i][6]%3>=0){
      if(gh[i][2]>96&&gh[i][2]<144&&gh[i][1]>76&&gh[i][1]<140){
        if((gh[i][2]%8==0 || gh[i][1]==108) && gh[i][6]>=i*480*1){
          if(gh[i][1]<108){gh[i][5]=1;}if(gh[i][1]>108){gh[i][5]=3;}if(gh[i][1]==108){gh[i][5]=0;}ghostMove(i);
        }else{gh[i][2]=gh[i][2]+((-2*(int(gh[i][5]<2)))+1);if(gh[i][2]<=116){gh[i][5]=2;}if(gh[i][2]>=124){gh[i][5]=0;}
        }
      }else{
        gh[i][8]=gh[i][3];
        gh[i][9]=gh[i][4];
        if(i==0){gh[i][8]=player[0][0];gh[i][9]=player[0][1];}
        if(i==1){
          if(player[0][2]==0){gh[i][8]=player[0][0]+24;gh[i][9]=player[0][1]-24;}else
          if(player[0][2]==1){gh[i][8]=player[0][0]+24;gh[i][9]=player[0][1]+ 0;}else
          if(player[0][2]==2){gh[i][8]=player[0][0]+ 0;gh[i][9]=player[0][1]+24;}else
          if(player[0][2]==3){gh[i][8]=player[0][0]-24;gh[i][9]=player[0][1]+ 0;}
        }
        if(i==2){
          if(player[0][2]==0){gh[i][8]=player[0][0]+24;gh[i][9]=player[0][1]-24;}else
          if(player[0][2]==1){gh[i][8]=player[0][0]+24;gh[i][9]=player[0][1]+ 0;}else
          if(player[0][2]==2){gh[i][8]=player[0][0]+ 0;gh[i][9]=player[0][1]+24;}else
          if(player[0][2]==3){gh[i][8]=player[0][0]-24;gh[i][9]=player[0][1]+ 0;}
          gh[i][8]=gh[i][8]+(gh[i][8]-gh[i-2][1]);gh[i][9]=gh[i][9]+(gh[i][9]-gh[i-2][2]);
          strokeWeight(3);
          stroke(#00FFFF);
          line((32 * 8) - (gh[i-2][1] + 8),gh[i-2][2]+16,(32 * 8) - (gh[i][8] + 8),gh[i][9]+16);
        }
        if(i==3){if(dist(player[0][0],player[0][1],gh[i][1],gh[i][2])>72){gh[i][8]=player[0][0];gh[i][9]=player[0][1];}}
        if(i==0){DrawTex(243+(gh[i][5]*6)+(floor((gh[i][6]%32)/16)*0),gh[i][7],gh[i][8]+12,gh[i][9]-4);}
        if(i==1){DrawTex(242+(gh[i][5]*6)+(floor((gh[i][6]%32)/16)*0),gh[i][7],gh[i][8]+20,gh[i][9]-4);}
        if(i==2){DrawTex(245+(gh[i][5]*6)+(floor((gh[i][6]%32)/16)*2),gh[i][7],gh[i][8]+12,gh[i][9]+4);}
        if(i==3){DrawTex(244+(gh[i][5]*6)+(floor((gh[i][6]%32)/16)*2),gh[i][7],gh[i][8]+20,gh[i][9]+4);}
        if(gh[i][1]==108&&gh[i][2]==96&&gh[i][5]%2==0){gh[i][5]=(int(gh[i][1]-gh[i][8]>0)*2)+1;} //<>//
        if(gh[i][1]%8==0&&gh[i][2]%8==0){
          gh[i][5]=findClosest(gh[i][1],gh[i][2],gh[i][8],gh[i][9],gh[i][5]);
        }//else{
          ghostMove(i);}
      //}
     } //<>//
      DrawTex(243+(gh[i][5]*6)+(floor((gh[i][6]%32)/16)*0),gh[i][7],gh[i][1]+12,gh[i][2]-4);
      DrawTex(242+(gh[i][5]*6)+(floor((gh[i][6]%32)/16)*0),gh[i][7],gh[i][1]+20,gh[i][2]-4);
      DrawTex(245+(gh[i][5]*6)+(floor((gh[i][6]%32)/16)*2),gh[i][7],gh[i][1]+12,gh[i][2]+4);
      DrawTex(244+(gh[i][5]*6)+(floor((gh[i][6]%32)/16)*2),gh[i][7],gh[i][1]+20,gh[i][2]+4); //<>// //<>//
    } //<>// //<>//
  }}
  for(int i=0;i<4;i++){
    DrawTexture(194,mapPal,80+((i+(24*int(i>1)))*32),0,0);
    DrawTexture( 27,mapPal,79+((i+(24*int(i>1)))*32),0,0);
    DrawTexture(192,mapPal,78+((i+(24*int(i>1)))*32),0,0); //<>// //<>//
  } //<>// //<>//
  if(GameTimer%120==15){ //<>//
    if(true){if(true){print("");}}
  } //<>// //<>//
}} //<>// //<>//
 //<>//
void mousePressed() { //<>// //<>// //<>//
  PImage screenShot;
  screenShot=createImage(width,height,RGB);
  loadPixels(); //<>// //<>//
  screenShot.pixels = pixels; //<>// //<>//
  screenShot.save(".gitignore/screenShot.png"); //<>// //<>// //<>//
  if(true){if(true){}} //<>// //<>//
}

void ghostMove(int i){
               if(gh[i][5]==0){gh[i][2]=gh[i][2]-1;} //<>// //<>//
          else if(gh[i][5]==1){gh[i][1]=gh[i][1]+1;}
          else if(gh[i][5]==2){gh[i][2]=gh[i][2]+1;} //<>//
          else if(gh[i][5]==3){gh[i][1]=gh[i][1]-1;}
          if(gh[i][1] <4      ){gh[i][1]=gh[i][1]+(8*26);};
          if(gh[i][1]-4>(8*26)){gh[i][1]=gh[i][1]-(8*26);}; //<>// //<>//
}
 //<>//
int findClosest(int XA,int YA,int XB,int YB,int dir){ //<>// //<>//
  int[] closest = {9999,9999,9999,9999};
  int close = 9999;
  for(int i=0;i<4;i++){
    if(loaded[((XA+0)/8*32)+((YA-8)/8)]<3/**/&&( (i==0))&&(!(i==(dir+2)%4))&&(closest[i]>ceil(dist(XA+0,YA-8,XB,YB)))){closest[i]=ceil(dist(XA+0,YA-8,XB,YB));}else{closest[i]=closest[i];}
    if(loaded[((XA+8)/8*32)+((YA+0)/8)]<3/**/&&( (i==1))&&(!(i==(dir+2)%4))&&(closest[i]>ceil(dist(XA+8,YA+0,XB,YB)))){closest[i]=ceil(dist(XA+8,YA+0,XB,YB));}else{closest[i]=closest[i];}
    if(loaded[((XA+0)/8*32)+((YA+8)/8)]<3/**/&&( (i==2))&&(!(i==(dir+2)%4))&&(closest[i]>ceil(dist(XA+0,YA+8,XB,YB)))){closest[i]=ceil(dist(XA+0,YA+8,XB,YB));}else{closest[i]=closest[i];} //<>// //<>//
    if(loaded[((XA-8)/8*32)+((YA+0)/8)]<3/**/&&( (i==3))&&(!(i==(dir+2)%4))&&(closest[i]>ceil(dist(XA-8,YA+0,XB,YB)))){closest[i]=ceil(dist(XA-8,YA+0,XB,YB));}else{closest[i]=closest[i];}
  }
  for(int i=0;i<4;i++){
    if(closest[i]<close){close=closest[i];} //<>// //<>//
  }
  print(""); //<>//
       if(closest[0]==close){close=0;}
  else if(closest[1]==close){close=1;}
  else if(closest[2]==close){close=2;}
  else if(closest[3]==close){close=3;} //<>// //<>//
  else{close=(dir+2)%4;}
  return(close); //<>//
}

String encrypt(String input, boolean decrypt) {
  // Define an encryption keh
  String keh = "abcdefghijklmnopqrstuvwxyz1325476980";
  
  // Create an empty string to store the result
  String result = "";
  
  // Loop through each character in the input string
  for (int i = 0; i < input.length(); i++) {
    // Get the current character
    char c = input.charAt(i);
    
    // Find the index of the current character in the encryption keh
    int index = keh.indexOf(c);
    
    if (decrypt) {
      // If decrypt is true, then replace the character with the character
      // at the previous index in the keh (wrapping around if necessary)
      result += keh.charAt((index - 1 + keh.length()) % keh.length());
    } else {
      // If decrypt is false (i.e., encrypt), then replace the character with the character
      // at the next index in the keh (wrapping around if necessary)
      result += keh.charAt((index + 1) % keh.length());
    }
  }
  
  return result;
}
