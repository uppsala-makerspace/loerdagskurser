




import java.awt.*;
import processing.awt.PSurfaceAWT;
import processing.sound.*;
import java.io.File;
import ddf.minim.*;


PSurfaceAWT.SmoothCanvas smoothCanvas;
PGraphics MainGraphic;
PImage MenuBasePlate,MousePointer,AimPointer;
int MousePressed = 0;
int MouseX,MouseY,AimX,AimY;
int PointsSelected = 0;
byte[][] chars;
int[][] charsFrame;
int[][][] LevelMaps;
int[][] CML; //Current Map Loaded
int CMT; //Current Map Target
int nFrame = 0;
int mouseType=0;
PImage PlayerImage;
PImage[] images;
Minim minim;
AudioPlayer[] sounds;
Robot Handler;
  PointerInfo pointerA = MouseInfo.getPointerInfo();
  Point pointerB = pointerA.getLocation();
//Frame frame = ( (PSurfaceAWT.SmoothCanvas) ((PSurfaceAWT)surface).getNative()).getFrame();
EntityClass entities;
Player player;
Player player2;
String[] MapLocs;
  int[] thisMap = new int[131072];
  int mapData[][] = new int[512][256];
PGraphics DebugDraw;

boolean DebugMode=false;

int mouseObject;
int paused = 2;
int pan;
int MBF = 2; //Menu BeFore

float musicVolume;

final String[] DFS = {"1", "true"}; //DeaFult Settings

boolean firstOpen;
int FOC = 0;
int bulletIndex;
int[] ammoBoxes;

File maps;

Button[] mainMenu;
Button[] pauseMenu;
Button[] settingsMenu;
Button[] mapsMenu;
Button[] controlsMenu;

Bullet[] bullets;

float[] FPSH;
int cf;

float averageFPS;

void setup(){
  noSmooth();
  size(1080,640);
  surface.setResizable(true);
  minim = new Minim(this);
  loadSounds();
  ammoBoxes = new int[0];
  MainGraphic = createGraphics(1080, 448);
  String[] img_reg = loadStrings("data/img_reg.txt");
  images = new PImage[img_reg.length]; // Initialize the images array with the length of img_reg
  entities = new EntityClass();try{
    images = new PImage[img_reg.length]; // Initialize the images array with the length of img_reg
    printArray(img_reg);
    for (int i = 0; i < img_reg.length; i++) { // Change > to <
      images[i] = loadImage(img_reg[i] + ".png");
    }
    images[5].resize(MainGraphic.width, MainGraphic.height);
    images[6].resize(MainGraphic.width, MainGraphic.height);
    images[9].resize(20, 12); //<>// //<>//
    images[10].resize(20, 14);
  }catch(NullPointerException e){
    try{
      updateImages();
    }catch(Exception er){ //<>//
      println("No internet, unable to update or self repair");
    }
    
    printArray(img_reg);
    for (int i = 0; i < img_reg.length; i++) {
      images[i] = loadImage(img_reg[i] + ".png");
    } //<>//
    printArray(img_reg); //<>// //<>//
    images[5].resize(MainGraphic.width, MainGraphic.height);
    images[6].resize(MainGraphic.width, MainGraphic.height);
    images[9].resize(20, 12);
    images[10].resize(20, 14);
  } //<>//
  bullets = new Bullet[1024];
  for(int i = 0; i < bullets.length; i++) bullets[i] = new Bullet(0, 0, 0, 0, false);
  FPSH = new float[60];
  maps = new File(dataPath("maps"));
  MapLocs = new String[maps.list().length];
  try{
    String[] settings = loadStrings("data/settings.txt");
    musicVolume = float(settings[0]);
    firstOpen = boolean(settings[1]);
    sounds[0].setGain(map(musicVolume, 0, 1, -30, 0));
  }catch(Exception e){
    saveStrings("data/settings.txt", DFS);
    String[] settings = DFS;
    musicVolume = float(settings[0]);
    firstOpen = boolean(settings[1]);
    sounds[0].setGain(map(musicVolume, 0, 1, -30, 0));
  } //<>//
  String[] settings = loadStrings("data/settings.txt");
  settings[1] = "false";
  saveStrings("data/settings.txt", settings);
  
  //make maploc list //<>//
  for(int i = 0; i < maps.list().length; i++) {
    MapLocs[i] = "data/maps/" + maps.list()[i]; //<>//
  }
   //<>//
  printArray(MapLocs);
  initButtons();
  LevelMaps = (int[][][]) new int[1][512][256];
  loadMaps(); //<>//
  changeMaps(); //<>//
  DebugDraw = createGraphics(1080, 448);
  PlayerImage = createImage(15,40,RGB); //<>//
  PlayerImage.loadPixels(); //<>//
  for (int i = 0; i < PlayerImage.pixels.length; i++) { //<>//
    PlayerImage.pixels[i] = #765700; 
  }
  PlayerImage.updatePixels(); //<>//
  
  chars = (byte[][]) new byte[128][128]; //<>// //<>//
  charsFrame = (int[][]) new int[128][128];
  player = new Player();
  player2 = new Player(); //<>//
  try{
    Handler = new Robot(); //<>//
  }
  catch (AWTException e)
  { //<>// //<>//
    println("Robot class not supported by your system!");
    exit();
  }
  sounds[0].play();
  PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
  smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative(); //<>//
  
  
    int playerData = entities.newEntity();
    entities.entities[playerData].X = float(CML[CML[0][5]][1]);
    entities.entities[playerData].Y = CML[CML[0][5]][2]-50;
    entities.entities[playerData].Width = CML[CML[0][5]][4];
    entities.entities[playerData].Height = CML[CML[0][5]][5];
    entities.entities[playerData].paramplayer = true;
    entities.entities[playerData].paramfriendly = true;
    entities.entities[playerData].paramliving = true;
    entities.entities[playerData].image = true;
    entities.entities[playerData].imageFace = 3;
    entities.entities[playerData].Grav=0.1;
    entities.entities[playerData].Weight=10;
    entities.entities[playerData].Friction=1.1;
    entities.entities[playerData].XV = 0;
    entities.entities[playerData].YV = 0;
    playerData = entities.newEntity();
    entities.entities[playerData].X = 0;
    entities.entities[playerData].Y = 0;
    entities.entities[playerData].Width = 50;
    entities.entities[playerData].Height = 50;
    entities.entities[playerData].paramplayer = true;
    entities.entities[playerData].paramfriendly = true;
    entities.entities[playerData].paramliving = true;
    entities.entities[playerData].image = true;
    entities.entities[playerData].imageFace = 2;
    entities.entities[playerData].Grav=0;
    entities.entities[playerData].Weight=0;
    entities.entities[playerData].Friction=1.1;
    entities.entities[playerData].XV = 0;
    entities.entities[playerData].YV = 0;
    mouseObject=playerData;
  
}

java.awt.Point p = new java.awt.Point();



void draw() {
  println(sounds[0].length(), sounds[0].position());
  if(sounds[0].position() == sounds[0].length()) {
    sounds[0].rewind();
    sounds[0].play();
  }
  pointerA = MouseInfo.getPointerInfo();
  pointerB = pointerA.getLocation();
  smoothCanvas.getFrame().getLocation(p);
  nFrame++;
  keys();
  if(paused == 0) {
    Frame();
  }else if(paused == 1) {
    drawPM();
    if(pauseMenu[0].isPressed()) paused = 0;
    if(pauseMenu[1].isPressed()) { paused = 3; MBF = 1; }
    if(pauseMenu[2].state == 3) paused = 2;
  }else if(paused == 2) {
    drawMain();
    if(mainMenu[0].state == 3) paused = 4;
    if(mainMenu[1].isPressed()) { String[] img_reg = loadStrings("data/img_reg.txt"); try{ updateImages(); } catch(Exception er) { println("No internet, unable to update"); saveStrings("data/img_reg.txt", img_reg); } }
    if(mainMenu[2].isPressed()) { paused = 3; MBF = 2; }
    if(mainMenu[3].isPressed()) exit();
    if(mainMenu[4].isPressed()) paused = 5;
  }else if(paused == 3) {
    drawSettings();
    
  }else if(paused == 4) {
    if(mapsMenu[0].state == 1) updateMaps();
    for(int i = 1; i < mapsMenu.length; i++) {
      if(mapsMenu[i].isPressed()) { 
        CMT = i - 1;
        LevelMaps = (int[][][]) new int[1][512][256];
        loadMaps();
        changeMaps();
        println("Loading mapfile: " + MapLocs[CMT]);
        entities = new EntityClass();
        player = new Player();
        player2 = new Player();
        try{
          Handler = new Robot();
        }
        catch (AWTException e)
        {
          println("Robot class not supported by your system!");
          exit();
        }
          int playerData = entities.newEntity();
          entities.entities[playerData].X = float(CML[CML[0][5]][1]);
          entities.entities[playerData].Y = CML[CML[0][5]][2]-50;
          entities.entities[playerData].Width = CML[CML[0][5]][4];
          entities.entities[playerData].Height = CML[CML[0][5]][5];
          entities.entities[playerData].paramplayer = true;
          entities.entities[playerData].paramfriendly = true;
          entities.entities[playerData].paramliving = true;
          entities.entities[playerData].image = true;
          entities.entities[playerData].imageFace = 3;
          entities.entities[playerData].Grav=0.1;
          entities.entities[playerData].Weight=10;
          entities.entities[playerData].Friction=1.1;
          entities.entities[playerData].XV = 0;
          entities.entities[playerData].YV = 0;
          playerData = entities.newEntity();
          entities.entities[playerData].X = 0;
          entities.entities[playerData].Y = 0;
          entities.entities[playerData].Width = 50;
          entities.entities[playerData].Height = 50;
          entities.entities[playerData].paramplayer = true;
          entities.entities[playerData].paramfriendly = true;
          entities.entities[playerData].paramliving = true;
          entities.entities[playerData].image = true;
          entities.entities[playerData].imageFace = 2;
          entities.entities[playerData].Grav=0;
          entities.entities[playerData].Weight=0;
          entities.entities[playerData].Friction=1.1;
          entities.entities[playerData].XV = 0;
          entities.entities[playerData].YV = 0;
          mouseObject=playerData;
        paused = 0; 
        setup();
      }
    }
    drawMaps();
  }else if(paused == 5) {
    image(images[8], 0, 0);
    drawControls();
    if(controlsMenu[0].isPressed()) paused = 2;
  }
  
}

void mousePressed() {
  mousePressed= true;
}

void mouseReleased(){
  mousePressed=false;
}

void keys(){
  for(int i=0; (i<keys.length || i<keyed.length) ;i++) {
    keyed[i]=(floor(keyed[i]/2))+(int(keys[i])*2);
  }
    MousePressed=(floor(MousePressed/2))+(int(mousePressed)*2);
}
  
void keyPressed(){
  if(key == ESC) key = '+';
  print(keyCode);
  print(" - ");
  println(key);
  keys[keyCode]=true;
  
}
void keyReleased(){
  keys[keyCode]=false;
}

boolean[] keys = (boolean[]) new boolean[1024];
int[] keyed = (int[]) new int[keys.length];
