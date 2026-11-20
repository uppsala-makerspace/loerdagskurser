

void Frame() {


  if ((!mousePressed)&&(mouseType==0)) {
    MouseX=(int) pointerB.getX()-(p.x+8);
    MouseY=(int) pointerB.getY()-(p.y+31);
  }
  if ((!mousePressed)&&(mouseType==1)) {
    AimX=(int) pointerB.getX()-(p.x+8);
    AimY=(int) pointerB.getY()-(p.y+31);
  }
  /*if((!mousePressed)&&(mouseType==0)){MouseX=mouseX;MouseY=mouseY;}
   if((!mousePressed)&&(mouseType==1)){AimX=mouseX;AimY=mouseY;}*/
  if (keyed[32]==2) {
    mouseType++;
    mouseType%=2;
  }
  if (keyed[32]==2) {
    if (mouseType==0) Handler.mouseMove(MouseX+p.x+8, MouseY+p.y+31);
    if (mouseType==1) Handler.mouseMove(AimX+p.x+8, AimY+p.y+31);
    /*if(mouseType==0) Handler.mouseMove(MouseX,MouseY);
     if(mouseType==1) Handler.mouseMove(AimX,AimY);*/
  }
  MainGraphic.beginDraw();

  MainGraphic.background(images[5]);

  for (int i = 0; i < 10; i++) {
    MainGraphic.image(images[6], (0 - entities.camX / 2) + i * images[6].width, -0 - entities.camY / 2);
  }
  
  for(int i = -1; i < 3; i++) {
    image(images[7], i * width, 0);
  }

  if (DebugMode) {
    DebugDraw.beginDraw();
    DebugDraw.clear();
  }
  entities.run(); //<>//
 //<>// //<>// //<>// //<>// //<>// //<>//
  //if(entities.entities[player.playerData].Y>1000){entities.entities[player.playerData].Y=CML[CML[0][5]][2];entities.entities[player.playerData].YV=0;entities.entities[player.playerData].X=CML[CML[0][5]][1];entities.entities[player.playerData].XV=0;}
  //entities.entities[mouseObject].XV=AimX-entities.entities[mouseObject].X;entities.entities[mouseObject].YV=AimY-entities.entities[mouseObject].Y;
  entities.entities[mouseObject].X=AimX;
  entities.entities[mouseObject].Y=AimY;
  entities.camX=entities.entities[player.playerData].X-(MainGraphic.width/2-(entities.entities[player.playerData].Width/2*0));
  entities.camY=entities.entities[player.playerData].Y-(MainGraphic.height/3*2-(entities.entities[player.playerData].Height/2*0));

  for (int[] i : CML)if (i[0]==1)MainGraphic.image(images[i[5]], i[1]-entities.camX-(i[3]/2), i[2]-entities.camY-(i[4]/2), i[3], i[4]);
  entities.render();

 //<>// //<>// //<>//
  //MainGraphic.image(images[3],MainGraphic.width/2-(PlayerImage.width/2),MainGraphic.height/3*2-(PlayerImage.height/2)); //<>// //<>// //<>// //<>// //<>//
player.run();
for(int i = 0; i < bullets.length; i++) { if(bullets[i].running) { bullets[i].display(); } } //<>//
  MainGraphic.endDraw(); //<>// //<>//
  image(MainGraphic, 0, 0); //<>// //<>//

  if (DebugMode) {
    DebugDraw.endDraw();
    image(DebugDraw, 0, 0); //<>//
  } //<>//

 //<>//
//MainGraphic.endDraw(); //<>//
image(MainGraphic, 0, 0); //<>// //<>//

if(DebugMode){DebugDraw.endDraw();image(DebugDraw, 0, 0);}
 
player.HP = int(averageFPS);

  entities.entities[player.playerData].XV+=int(keyed[39]>1)-int(keyed[37]>1); //<>//
  if (keyed[38]>1)entities.entities[player.playerData].YV=-5; //<>//
  entities.entities[player2.playerData].XV+=int(keyed[68]>1)-int(keyed[65]>1);

 //<>//
  if (MousePressed==2&&abs(MouseX-162)<114&&abs(MouseY-486)<22) { //<>//
    PointsSelected++; //<>// //<>//

    PointsSelected%=2;
  }


  if (nFrame%1==0) image(images[0], 0, 448, 1080, 192, 0, 112, 270, 160);


  if (MousePressed>1&&abs(MouseX-162)<114&&abs(MouseY-486)<22)
    image(images[0], 48, 464, 228, 44, 0, 75, 57, 86);
  else
    image(images[0], 48, 464, 228, 44, 0, 87, 57, 98);




  if (nFrame%1==0) {
    if (PointsSelected==0) {
      write(72, 1, 1, 16, 512, 4, 4);
      write(80, 1, 2, 48, 512, 4, 4);
      String healthString = str(player.HP);//import the value

      while (healthString.length() < 7) healthString = " " + healthString;//add spaces to fill out

      char[] healthChar = healthString.toCharArray();//make an array of characters from the string

      for (int i = 0; i < healthChar.length; i++) {
        writeChar(healthChar[i], 88 + i * 32, 512, i + 10);//write the characters
      }
    } else if (PointsSelected==1) {
      write(65, 1, 1, 16, 512, 4, 4);
      write(77, 1, 2, 48, 512, 4, 4);
      
      String healthString;
        healthString = str(player.Magazine) + "/" + str(player.Ammo);/*"OG  US"*/;//import the value
      if(healthString.length() < 8){
        while (healthString.length() < 7) healthString = " " + healthString;//add spaces to fill out


        char[] healthChar = healthString.toCharArray();//make an array of characters from the string
  
        for (int i = 0; i < healthChar.length; i++) {
          writeChar(healthChar[i], 88 + i * 32, 512, i + 10);//write the characters
        }
      }else{
        healthString = str(player.Magazine) + "/";
        while (healthString.length() < 6) healthString = " " + healthString;


        char[] healthChar = healthString.toCharArray();//make an array of characters from the string
  
        for (int i = 0; i < healthChar.length; i++) {
          writeChar(healthChar[i], 88 + i * 32, 512, i + 10);//write the characters
        }
        write(23, 2, 17, int(88 + 6 * 32), int(512), 4, 4);
      }
    }
  }

//708 472
textSize(12);
fill(255);
textAlign(LEFT,TOP);
text(frameRate,708,472+(12*0));
if(DebugMode){
text(entities.camX,708,472+(12*1));
text(entities.camY,708,472+(12*2));
text(entities.entities[player.playerData].X,708,472+(12*3));
text(entities.entities[player.playerData].Y,708,472+(12*4));
}

 /*if(mouseType!=0) image(MousePointer,MouseX-16-(p.x+8),MouseY-16-(p.y+31),32,32);
 if(mouseType!=1) image(AimPointer,AimX-16-(p.x+8),AimY-16-(p.y+31),32,32);*/
 if(mouseType!=0) image(images[1],MouseX-16,MouseY-16,32,32);
 if(mouseType!=1) image(images[2],AimX-16,AimY-16,32,32);

//println(frame.getLocationOnScreen());

if(keyed[27] == 1) paused = 1;

if(firstOpen == true) { 
  fill(255); 
  FOC++;
  if(FOC < 300) {
    text("Use arrow keys to move", 200, 50);
  }else if(FOC < 600) {
    text("Use space to switch mouse", 200, 50);
  }
}
}
