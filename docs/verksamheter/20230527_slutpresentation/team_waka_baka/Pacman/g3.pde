//Main code
/*gh=Ghost
    gh[ghostID][DATA]
    ghostID = Ghost(ShadowBlinkyRed,SpeedyPinkyPink,BashfulInkyCyan,PokeyClydeOrange)
    DATA.0 = Behaviour(spot,chase,jail,return)
    DATA.1 = 
    draw.1 = X pos
    draw.2 = Y pos
    draw.3 = homeX pos
    draw.4 = homeY pos
    draw.5 = dir
    draw.6 = animframe
    draw.7 = colors
    draw.8 = targetX pos
    draw.9 = targetY pos
    
  t=Timer
*/
int[][] gh = {};
int t=0;
public void initializeMainCode(){
  if(true){
    int[] g;
    gh = (int[][]) new int[4][10];
    for(int i=0;i<gh.length;i++){
      g=gh[i];
      g[0]=i;
      if(i%4==0){g[1]=28/2*8-4;g[2]=25/2*8  ;g[5]=1;g[7]=23;g[6]=0;g[3]=  0;g[4]=  0;}
      if(i%4==1){g[1]=30/2*8+4;g[2]=31/2*8-4;g[5]=2;g[7]=24;g[6]=0;g[3]=  0;g[4]=256;}
      if(i%4==2){g[1]=28/2*8-4;g[2]=31/2*8+4;g[5]=0;g[7]=25;g[6]=0;g[3]=224;g[4]=  0;}
      if(i%4==3){g[1]=23/2*8+4;g[2]=31/2*8-4;g[5]=2;g[7]=26;g[6]=0;g[3]=224;g[4]=256;}
    }
  }
}

int[][] player,defPlayer = {
  {28/2*8-4,24*8,0,23,0,87,65,83,68,0,0,0,0, 5,0}/*,
  {28/2*8-4,24*8,0,23,0,87,68,83,65,0,0,0,0, 9,0},
  {24/2*8-8,24*8,0,23,0,37,40,39,38,0,0,0,0, 9,0},
  {32/2*8  ,24*8,0,23,0,40,39,38,37,0,0,0,0, 9,0},
  {28/2*8-4, 6*8,0,23,0,39,38,37,40,0,0,0,0, 9,0}*/}
;

void playerMove(int i){
  /*switch(player[i][2]){
    case 0:
      player[i][1]=-1;
      break;
    case 1:
      player[i][0]=+1;
      break;
    case 2:
      player[i][1]=+1;
      break;
    case 3:
      player[i][0]=-1;
      break;
  }*/
       if(player[i][2]==0){player[i][1]=player[i][1]-1;}
  else if(player[i][2]==1){player[i][0]=player[i][0]+1;}
  else if(player[i][2]==2){player[i][1]=player[i][1]+1;}
  else if(player[i][2]==3){player[i][0]=player[i][0]-1;}
  player[i][3]=(player[i][3]+1)%32;
  if(player[i][0] <4      ){player[i][0]=player[i][0]+(8*26);};
  if(player[i][0]-4>(8*26)){player[i][0]=player[i][0]-(8*26);};
  //player[i][0]=((player[i][0]-16)%(8*20))+16;
}

void ghostBehaviour(int i){
  int[] g;
  g=gh[i];
  if(g[0]==0){
    
  }
}
int[] loaded;
int[] Map={
   0, 5, 7, 7, 7, 7, 7, 7, 7, 7, 9, 0, 0, 0,15, 0,17, 0, 0, 0, 5, 7, 7, 7, 7,11,13, 7, 7, 7, 7, 9,
   0,15, 1, 1, 2, 1, 1, 1, 1, 1,17, 0, 0, 0,15, 0,17, 0, 0, 0,15, 1, 1, 1, 2,19,25, 1, 1, 1, 1,17,
   0,15, 1,26,28,30, 1,26,30, 1,17, 0, 0, 0,15, 0,17, 0, 0, 0,15, 1,26,30, 1,27,31, 1,26,30, 1,17,
   0,15, 1,19,48,25, 1,19,25, 1,17, 0, 0, 0,15, 0,17, 0, 0, 0,15, 1,19,25, 1, 1, 1, 1,19,25, 1,17,
   0,15, 1,19,48,25, 1,19,25, 1,17, 0, 0, 0,15, 0,17, 0, 0, 0,15, 1,19,38,28,28,30, 1,19,25, 1,17,
   0,15, 1,27,29,31, 1,27,31, 1,27, 7, 7, 7,31, 0,27, 7, 7, 7,31, 1,27,29,29,29,31, 1,19,25, 1,17,
   0,15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,19,25, 1,17,
   0,15, 1,26,28,30, 1,26,28,28,28,28,28,28,30, 0,26,28,28,28,30, 1,26,30, 1,26,28,28,40,25, 1,17,
   0,15, 1,19,48,25, 1,27,29,29,41,39,29,29,31, 0,27,29,29,29,31, 1,19,25, 1,27,29,29,41,25, 1,17,
   0,16, 1,19,48,25, 1, 1, 1, 1,19,25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,19,25, 1, 1, 1, 1,19,25, 1,17,
   0,16, 1,19,48,25, 1,26,30, 1,19,25, 0,32, 8, 8, 8,34, 0,26,30, 1,19,25, 1,26,30, 1,19,25, 1,17,
   0,16, 1,27,29,31, 1,19,25, 1,27,31, 0,17, 0, 0, 0,15, 0,19,25, 1,27,31, 1,19,25, 1,27,31, 1,17,
   0,16, 1, 1, 1, 1, 1,19,25, 1, 0, 0, 0,36, 0, 0, 0,15, 0,19,25, 1, 1, 1, 1,19,25, 1, 1, 1, 1,17,
   0,46,28,28,28,30, 1,19,38,28,28,30, 0, 4, 0, 0, 0,15, 0,19,38,28,28,30, 0,19,38,28,28,30, 1,17,
   0,47,29,29,29,31, 1,19,39,29,29,31, 0, 3, 0, 0, 0,15, 0,19,39,29,29,31, 0,19,39,29,29,31, 1,17,
   0,16, 1, 1, 1, 1, 1,19,25, 1, 0, 0, 0,37, 0, 0, 0,15, 0,19,25, 1, 1, 1, 1,19,25, 1, 1, 1, 1,17,
   0,16, 1,26,28,30, 1,19,25, 1,26,30, 0,17, 0, 0, 0,15, 0,19,25, 1,26,30, 1,19,25, 1,26,30, 1,17,
   0,16, 1,19,48,25, 1,27,31, 1,19,25, 0,33, 7, 7, 7,35, 0,27,31, 1,19,25, 1,27,31, 1,19,25, 1,17,
   0,16, 1,19,48,25, 1, 1, 1, 1,19,25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,19,25, 1, 1, 1, 1,19,25, 1,17,
   0,16, 1,19,48,25, 1,26,28,28,40,38,28,28,30, 0,26,28,28,28,30, 1,19,25, 1,26,28,28,40,25, 1,17,
   0,16, 1,27,29,31, 1,27,29,29,29,29,29,29,31, 0,27,29,29,29,31, 1,27,31, 1,27,29,29,41,25, 1,17,
   0,15, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,19,25, 1,17,
   0,15, 1,26,28,30, 1,26,30, 1,26, 8, 8, 8,30, 0,26, 8, 8, 8,30, 1,26,28,28,28,30, 1,19,25, 1,17,
   0,15, 1,19,48,25, 1,19,25, 1,17, 0, 0, 0,15, 0,17, 0, 0, 0,15, 1,19,39,29,29,31, 1,19,25, 1,17,
   0,15, 1,19,48,25, 1,19,25, 1,17, 0, 0, 0,15, 0,17, 0, 0, 0,15, 1,19,25, 1, 1, 1, 1,19,25, 1,17,
   0,15, 1,27,29,31, 1,27,31, 1,17, 0, 0, 0,15, 0,17, 0, 0, 0,15, 1,27,31, 1,26,30, 1,27,31, 1,17,
   0,15, 1, 1, 2, 1, 1, 1, 1, 1,17, 0, 0, 0,15, 0,17, 0, 0, 0,15, 1, 1, 1, 2,19,25, 1, 1, 1, 1,17,
   0, 6, 8, 8, 8, 8, 8, 8, 8, 8,10, 0, 0, 0,15, 0,17, 0, 0, 0, 6, 8, 8, 8, 8,12,14, 8, 8, 8, 8,10
};
  
void keyPressed(){
  println(keyCode);
  for(int i=0;i<player.length;i++){
    for(int i2=0;i2<4;i2++){
      if(keyCode==player[i][5+i2]){
        player[i][9+i2]=1;
      }
    }
  }
  if(keyCode == ESC) key = 0;
}
void keyReleased(){
  for(int i=0;i<player.length;i++){
    for(int i2=0;i2<4;i2++){
      if(keyCode==player[i][5+i2]){
        player[i][9+i2]=0;
      }
    }
  }
}
