
PImage img;
PImage imgPlayer;
PImage imgEnter;
PImage imgBall;
PImage imgHole;
PImage imgBallShadow;
PImage imgMainMenu;
PImage imgWin;
PImage imgDot;
PImage imgLogo;
PImage imgCursor;
PImage imgHow;
int clubType = 1;
int strokes = 0;
int level;
float x = 0;
float y = 0;
float colour = 255;
float waterX = 0;
float flagX = height/2;
float flagY = width/2;
float bollX = 0;
float bollY = 0;
float bollZ = 0;
float bollXV = 0;
float bollYV = 0;
float bollZV = 0;
float scale = 50;
float playerOffsetX = 7.5 ;
float playerOffsetY = -7.5 ;
float playerX;
float playerY;
float gravity = 0.06;
float power = 1;
float defaultSize = 200.5;
color c;
boolean shooting = false;
boolean bollStill = false;
boolean mainMenu = true;
boolean inGame = false;
boolean won = false;
boolean putt = false;
boolean canShoot = false;
boolean[] dangerZone;
PVector NSDir;

float test = 0;
void setup()
{
  noCursor();
  smooth(0);
  size(200,200);
  fullScreen();
  x = random(-100000,100000);
  y = random(-100000,100000);
  bollX = random(0, 200);
  bollY = random(0, 200);
  
  img = loadImage("Flagga.png");
  imgBall = loadImage("Golfboll.png");
  imgPlayer = loadImage("Player.png");
  imgHole = loadImage("Hole.png");
  imgMainMenu = loadImage("title.png");
  imgEnter = loadImage("thing.png");
  imgWin = loadImage("NextL.png");
  imgDot = loadImage("Dot.png");
  imgLogo = loadImage("Logo.png");
  imgCursor = loadImage("Cursor.png");
  //imgHow = loadImage("HOWTOPLAY.png");
  
  
  flagX = random(25,175);
  flagY = random(25,175);
}

//////////////////////////////////////

void draw()
{
  
  background(0);
  scale(height / defaultSize);
  translate(75,0);
  if(inGame)
{
  
 DrawGame();
}else if (mainMenu){
  DrawMainMenu();
}

 image(imgCursor, mouseX / (height / defaultSize), mouseY / (height / defaultSize));
 tint(255);
}

//////////////////////////////////////

void mousePressed()
{
  if (inGame)
{
 bollX = mouseX / (height / defaultSize);
 bollY = mouseY / (height / defaultSize);
}

}

//////////////////////////////////////

void Noise(int noiseHeight, int noiseWidth, float offsetX, float offsetY, float scale)
{
  boolean[] array = null;
 array = new boolean[noiseWidth * noiseHeight];
 
  for(int x = 0; x < noiseWidth; x++)
  {
    for(int y = 0; y < noiseHeight; y++)
    {
      float sampleX = x / scale + offsetX;
      float sampleY = y / scale + offsetY;
      float value = noise(sampleX, sampleY);
      
      waterX =+ 1;
      /*       if(value < 0.35)
      {
        //array[x*y]= true;
        
          fill(0,0,150);
      }else if(value < 0.4)
      {
        //array[x*y]= false;
        
          fill(50,50,175);
        
     }else */ if (value < 0.5)
      {
        //array[x*y]= false;
        
          fill(220,200,50);
      }else if (value < 1)
      {
        //array[x*y]= false;
        
          fill(19,200,15);
      }
      noStroke();
      square(x,y,1);
      dangerZone = array;
      
      //square(x * (height / 200) + (width - height) / 4,y * (height / 200), (height / 200));  
    }
  }
}

//////////////////////////////////////

void DrawDebug()
{
  //text(power,50,50);
  fill(0);
  text("Level " + level,5,15);
  

  
  //text(bollZV + bollXV + bollYV,5,30);
}

//////////////////////////////////////

void DrawHoleAndFlag()
{
  fill(12);
  circle(flagX, flagY, 5);
  float holeInDistance = 2;
  if (abs(flagX - bollX) < holeInDistance && abs(flagY - bollY) < holeInDistance && bollZ > -1)
{
  won = true;

}
  tint(255);
  image(imgHole,flagX - 7.5, flagY + -7.5);
  
  image(img, flagX - 7.5,flagY - 15);
  
}

////////////////////////////////////// 


void DrawLine()
{
  
  int dots = round(10 * (power * 2));
  stroke(255);
  fill(255);
  for(int i = 0; i < dots; i++)
{
 image(imgDot,((mouseX / (height / defaultSize) - (bollX + -4)) * i) / dots + (bollX+-4), ((mouseY / (height / defaultSize) - (bollY+-4))* i) / dots + (bollY+-4));
}
  
}

////////////////////////////////////// go home and get a job.  -Trump


void DrawGame()
{
//if (dangerZone != null)
//{
//    if(round(bollX * bollY) < 200)
//  {
//      if (dangerZone[round(bollX * bollY) * round(bollX * bollY)])
//    {
//    won = true;
//    }
//  }
//}

 
  
   
 Noise(200 ,200, x, y, 90);


 DrawPlayer();
 DrawHoleAndFlag();
 if (!won)
 {
   DrawBoll();
   if(bollStill && canShoot)
 {
 DrawLine();
 }
   
 } else
 {
 image(imgWin, 100 - 32,100 - 32);
 if(key == ENTER)
 {
   level++;
   won = false;  
   strokes = 0;
   x = random(-100000,100000);
    y = random(-100000,100000);
    flagX = random(25,175);
    flagY = random(25,175);
    won = false;
    bollZV = 0;
    bollXV = 0;
    bollYV = 0;
    bollX = random(0, 200);
    bollY = random(0, 200);
    bollZ = 0;
 }
 }
 
 DrawDebug();
 fill(255);
 textSize(20);
 text("Stroke " + strokes, 5, 200);
}




//////////////////////////////////////


void mouseWheel(MouseEvent event) {
  float e = -event.getCount();
  power += e / 40;
  power = constrain(power ,0,1);
  
}

//////////////////////////////////////

void keyPressed()
{
   if (inGame)
{
  //if(key == 't')
  //{
  //  x = random(-100000,100000);
  //  y = random(-100000,100000);
  //  flagX = random(25,175);
  //  flagY = random(25,175);
  //  won = false;
  //  bollZV = 0;
  //  bollXV = 0;
  //  bollYV = 0;
  //}
  //if(key == 'x')
  //{
  //  x = x + 0.1;
   
  //}
  //if(key == 'y')
  //{
  //  y = y + 0.1;
   
  //}
  
 
  
  if(key == '2')
  {
    putt = true;
  }
  if(key == '1')
  {
    putt = false;
  }
  //debug use only ends here (-;
  if(key == 'e')
  {
    if(bollStill && canShoot)
  {
    strokes = strokes + 1;
    if (!putt)
  {
      bollZV = -4 * power;
  }
  
    NSDir = new PVector(mouseX / (height / defaultSize) - (bollX + -4), mouseY  / (height / defaultSize) - (bollY + -4), 0);
    NSDir.normalize();
    
    bollXV = NSDir.x * (power * 4);
    bollYV = NSDir.y * (power * 4);
  }
    
  }
  } else if(mainMenu)
  {
    if(key == ENTER)
    {
      mainMenu = false;
      inGame = true;
    }
  }
}
