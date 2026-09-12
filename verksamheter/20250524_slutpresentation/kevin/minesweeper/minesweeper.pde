int[][] grid;
int[][] gridd;
int gridsizex = 8;
int gridsizey = 8;
int mines = 10;
int x = 0;
int y = 0;
int clicks = 0;
int clickx = 0;
int clicky = 0;
//PImage empty;
PImage[] gimages;

void setup() {
  size(256, 320);
  grid = new int[gridsizex][gridsizey]; //þ
  gridd = new int[gridsizex][gridsizey];
  gimages = new PImage[11];
  gimages[0] = requestImage("empty.png");
  for(int i = 0;i<mines;i++)
  {
    x = int(random(0,gridsizex));
    y = int(random(0,gridsizey));
    if(gridd[x][y] == 0) 
    {
      gridd[x][y] = 9;
    } else {i--;}
  }
}

void draw()
{
  background(#CCCCCC);
  rect(0,0,width,64);
  for(int i = 0;i<gridsizex;i++)
  {
    for(int j = 0;j<gridsizey;j++)
    {
      image(gimages[grid[i][j]],i * 32,j * 32 + 64);
    }
  }
  if (clicktest() == true) println("i: " + clickx + " j: " + clicky);
}

void refresh(int px,int py,int m)
{
  for(int i = 0;i<px;i++)
  {
    for (int j = 0;j<py;j++)
    {
      grid[i][j] = 0;
      gridd[i][j] = 0;
    }
  }
  mines = m;
  for(int i = 0;i<mines;i++)
  {
    x = int(random(0,1)) * 9;
    y = int(random(0,1)) * 9;
    if(gridd[x][y] == 0) 
    {
      gridd[x][y] = 9;
    } else {i--;}
  }
  windowResizable(true);
  windowResize(px,py);
  clicks = 0;
  windowResizable(false);
}

boolean clicktest()
{
  boolean a = false;
  int tries = 0;
  if (mousePressed == true){
    for(int i = 0;i<gridsizex;i++)
    {
      for(int j = 0;j<gridsizey;j++)
      {
        if (mouseX >= i * 32 && mouseX <= i + 1 * 32 && mouseY >= j * 32 + 64 && mouseY <= j + 1 * 32 + 64)
      {
        clickx = i;
        clicky = j;
        //j = gridsizey;
        //i = gridsizex;
        a = true;
        return a;
      } else {
        if (tries == gridsizex * gridsizey -1) {
        return a;} //<>//
        else tries++;
      }
      }
    }
  }
  return a;
}
