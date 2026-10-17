/*final int screenSize = 4;

int AnimTexTimer,AnimTexSpeed,AnimTexAmont,texture,Level,GameTimer;

void settings(){
  size((16*screenSize)*16,(16*screenSize)*14);
  smooth(0);
}

void setup(){
  AnimTexTimer=0;
  AnimTexSpeed=8;
  AnimTexAmont=6;
  texture=128*5;
  Level=0;
  GameTimer=0;
  LoadTextures();
}*/

/*void draw(){
  GameTimer++;
  if(GameTimer<=1){
    return;
  }
  texture=(texture+1)%(ColorPalettes.length*128);
  AnimTexTimer++;
  AnimTexTimer=AnimTexTimer%(AnimTexSpeed*AnimTexAmont);
  background((((float) millis())/10)%256);
  drawAllTextures();
  //DrawTexture(0,0,0);
  //DrawTexture(1,32,0); 
  //println(frameRate);
  //DrawText(3,6,"Loading",7);
}*/

void Loading(){
  background(0);
  DrawText(3,6,"Loading",7);
}
  
void drawAllTextures(){
  /*int y = 0;
  for(int i2=0;i2<ColorPalettes.length;i2++){
    for(int i=0;i<TexturesB.length;i++){
      //DrawTexture("Big",i,(floor(texture/128)+i2)%ColorPalettes.length,(i%16)*16,floor(i/16)*16+y,1,1);
      if(i+1==TexturesB.length){
        y += floor(i/16)*16+16;
      }
    }
    for(int i=0;i<Textures.length;i++){
      //DrawTexture("s",i,(floor(texture/128)+i2)%ColorPalettes.length,(i%32)*8,floor(i/32)*8+y,1,1);
      if(i+1==Textures.length){
        y += floor(i/32)*8+8;
      }
    }
  }*/
  for(int i = 0; i < 32 * 34; i++){
    if(i < 64 || i >= 64 * 15){
      DrawTexture(0,0,i,0,0);
    }else{
      if(TextureData.length > floor((i - 64) / ColorPalettes.length)){
        if(i-64<loaded.length){
          if(loaded[i-64]==0){
            DrawTexture(27,0,i,0,0);
          }else if(loaded[i-64]==1||loaded[i-64]==2){
            DrawTexture(loaded[i-64]*4+17,4,i,0,0);
          }else{
            DrawTexture(loaded[i-64]+177,mapPal,i,0,0);
          }
        }else{
          DrawTexture(floor((i - 64) / ColorPalettes.length) % TextureData.length,i % ColorPalettes.length,i,0,0);
        }
      }else{
        DrawTexture(0,0,i,0,0);
      }
    }
  }
}
void drawTextures(){
  for(int i = 0; i < draws.length; i++){
  }
}

color[][] ColorPalettes=
/*{
  {#00000000,#FFB53120,#FF6B6D00,#FFE69C21},//00
  {#00000000,#FFE69C21,#FF9C4A00,#FF000000},//01
  {#00000000,#FF9C4A00,#FF9C4A00,#FF000000},//02
  {#00000000,#FF9C4A00,#FF9C4A00,#FF000000},//03
  {#00000000,#FF522100,#FF9C4A00,#FF000000}}//04
;*/
{
  {  #000000,  #DE0000,  #DEDEDE,  #2121FF},//00
  {  #000000,  #CA0000,  #CACACA,  #000079},//01
  {  #000000,  #FF8D8D,  #FF0000,  #7A0000},//02
  {  #000000,  #FFFFFF,  #808080,  #000000},//03
  {  #000000,  #FFB897,  #FFB897,  #FBB897},//04
  {#00000000,  #FFFF00,#00000000,#00000000},//05
  {#00000000,  #FFFF00,  #FFFF00,#00000000},//06
  {#00000000,  #FFFF00,  #FFFF00,  #FFFF00},//07
  {#00000000,  #FFFF00,  #FFFF00,#00000000},//08
  {#00000000,  #FFFF00,#00000000,  #FFFF00},//09
  {#00000000,  #0000FF,#00000000,#00000000},//10
  {#00000000,  #0000FF,  #0000FF,#00000000},//11
  {#00000000,  #0000FF,  #0000FF,  #0000FF},//12
  {#00000000,  #0000FF,  #0000FF,#00000000},//13
  {#00000000,  #0000FF,#00000000,  #0000FF},//14
  {  #00FF00,  #FFAF00,#00000000,#00000000},//15
  {  #00FF00,  #FFAF00,  #624300,#00000000},//16
  {  #00FF00,  #FFAF00,  #624300,  #000000},//17
  {  #00FF00,  #FFAF00,  #624300,#00000000},//18
  {  #624300,  #000000,#00000000,#00000000},//19
  {  #624300,  #000000,  #00FF00,#00000000},//20
  {  #624300,  #000000,  #00FF00,  #FFAF00},//21
  {  #624300,  #000000,  #00FF00,#00000000},//22
  {#00000000,  #FF0000,  #000079,  #CACACA},//23
  {#00000000,  #FFB8FF,  #000079,  #CACACA},//24
  {#00000000,  #00FFFF,  #000079,  #CACACA},//25
  {#00000000,  #FFB852,  #000079,  #CACACA}}//26
;

PImage[][] Textures = new PImage[TextureData.length][ColorPalettes.length];

void DrawText(int X, int Y, String text, int length){
  String thing = (rtos(text, length));
  for(int i = 0; i < thing.length(); i++){
    //DrawTexture("s",0,GetLetter(thing.charAt(i)),(int) (X-8)*16,(int) Y*16,0,0);
  }
};

//int GetLetter(String input){
//  for(int i=0;

String rtos(String val1, int val2){
  String val3 = "";
  for(int i = 0; i < val2; i++){
    if(val1.length() > i){
      //print(((val2-1)-i));
      val3 = val1.charAt((val1.length() - 1) - i) + val3;
    }else{
      val3 = "0" + val3;
    }
  }
  return(val3);
}


void LoadTextures(){
    
/*
  for(int i1=0;i1<TextureData.length;i1++){
    for(int i4=0;i4<3;i4++){
      for(int i3=0;i3<4;i3++){
        Textures[i1][i4]=createImage(16,16,ARGB);
        color[] newImg = new color[256];
        for(int i2=0;i2<TextureData[i1][0].length;i2++){
          newImg[i2] = ColorPalettes[TextureData[i1][1][0]][i4][TextureData[i1][0][i2]];
        }
        Textures[i1][i4].pixels = newImg;
      }
    }
  }*/
  for(int i1 = 0; i1 < TextureData.length; i1++){
    for(int i5 = 0; i5 < ColorPalettes.length; i5++){
      //for(int i4 = 0; i4 < 3; i4++){
        //for(int i3 = 0; i3 < 4; i3++){
          //Textures[i1][i5][i4] = createImage(8, 8, ARGB);
      Textures[i1][i5] = createImage(8, 8, ARGB);
      color[] newImg = new color[256];
      for(int i2 = 0; i2 < TextureData[i1][0].length; i2++){
        //newImg[i2] = ColorPalettes[i5][i4][TextureData[i1][0][i2]];
        newImg[i2] = ColorPalettes[i5][TextureData[i1][0][i2]];
      }
      //Textures[i1][i5][i4].pixels = newImg;
      Textures[i1][i5].pixels = newImg;
        //}
      //}
    }
  }
}

/*void DrawTexture(int nTexture,int nX,int nY){
  if(AnimTexTimer<32){
    image(Textures[nTexture][(int) 00+floor((AnimTexTimer)/8)],nX,nY,32,32);
  }else{
    image(Textures[nTexture][(int) 07-floor((AnimTexTimer)/8)],nX,nY,32,32);
  }
}*/
void DrawTexture(int nTexture, int Palette, int pos, int SwapX, int SwapY){
  int X = (32 * 8) - (drawsPos[pos][0] * 8), Y = (drawsPos[pos][1] * 8);
  Y -= 8;
  X -= 8;
  //println(X / 8);
  //println(Y / 8);
  /*PImage drawTex;
  if(AnimTexTimer < AnimTexSpeed * AnimTexAmont / 2){
    //drawTex = flipImage(Textures[nTexture][Palette][(int) (00000000000000)+floor((AnimTexTimer)/AnimTexSpeed)],SwapX,SwapY);
    drawTex = Textures[nTexture][Palette][(int) (00000000000000) + floor((AnimTexTimer) / AnimTexSpeed)];
  }else{
    //drawTex = flipImage(Textures[nTexture][Palette][(int) (AnimTexAmont-1)-floor((AnimTexTimer)/AnimTexSpeed)],SwapX,SwapY);
    drawTex = Textures[nTexture][Palette][(int) (AnimTexAmont-1) - floor((AnimTexTimer) / AnimTexSpeed)];
  }*/
  //drawTex.resize(drawTex.width*SwapX,drawTex.height*SwapY);
  image(Textures[nTexture][Palette], X * (screenSize), Y * (screenSize), (8 * screenSize), (8 * screenSize));
}
void DrawTex(int nTexture, int Palette, int X, int Y){
  Y = Y + 16;
  X = (32 * 8) - (X + 8);
  //println(X / 8);
  //println(Y / 8);
  /*PImage drawTex;
  if(AnimTexTimer < AnimTexSpeed * AnimTexAmont / 2){
    //drawTex = flipImage(Textures[nTexture][Palette][(int) (00000000000000)+floor((AnimTexTimer)/AnimTexSpeed)],SwapX,SwapY);
    drawTex = Textures[nTexture][Palette][(int) (00000000000000) + floor((AnimTexTimer) / AnimTexSpeed)];
  }else{
    //drawTex = flipImage(Textures[nTexture][Palette][(int) (AnimTexAmont-1)-floor((AnimTexTimer)/AnimTexSpeed)],SwapX,SwapY);
    drawTex = Textures[nTexture][Palette][(int) (AnimTexAmont-1) - floor((AnimTexTimer) / AnimTexSpeed)];
  }*/
  //drawTex.resize(drawTex.width*SwapX,drawTex.height*SwapY);
  image(Textures[nTexture][Palette], X * (screenSize), Y * (screenSize), (8 * screenSize), (8 * screenSize));
}
