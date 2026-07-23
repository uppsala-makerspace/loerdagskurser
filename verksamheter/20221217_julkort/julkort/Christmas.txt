int Gunnar_numFrames = 12;  // The number of frames in the animation
int Gunnar_currentFrame = 0;
PImage[] images = new PImage[Gunnar_numFrames];

void setup()
{
  size(1000,1000);
  frameRate(2);
  
  images[0]  = loadImage("ett.png");
  images[1]  = loadImage("tva.png"); 
  images[2]  = loadImage("tre.png");
  images[3]  = loadImage("fyra.png"); 
  images[4]  = loadImage("fem.png");
  images[5]  = loadImage("sex.png");
  images[6]  = loadImage("sju.png");
  images[7]  = loadImage("atta.png"); 
  images[8]  = loadImage("nio.png");
  images[9]  = loadImage("tio.png"); 
  images[10]  = loadImage("elva.png");
  images[11]  = loadImage("tolv.png");
}
void draw()
{
  background(256,256,256);
  rect(500,0,250,250);
  Gunnar_currentFrame = (Gunnar_currentFrame+1) % Gunnar_numFrames;  // Use % to cycle through frames
  int offset = 0;
  for (int x = 0; x < 6; x += images[0].width/200) { 
    image(images[(Gunnar_currentFrame+offset) % Gunnar_numFrames], 500, 0);
    offset+=2;
  }
}
