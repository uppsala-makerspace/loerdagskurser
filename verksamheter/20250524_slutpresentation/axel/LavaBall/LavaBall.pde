boolean showAll= true;
boolean showRectangle= true;
float skibidi = 250;
float tungtungtungsahur= 1;
float cubey = 50;
float cubex =500;
float bad_x = width/2;
float bad_y = height/2;
float ballradius = 20;
float speed_x = 0;
float speed_y = 0;
boolean isBouncingOffCursor = false;  
float timer = 0;
float HighScore = 0;
void setup()
{
  //fullScreen();
  size(1024, 600);
}

void draw()
{
  delay(100);
  background(50, 50, 50);
  
 
  bad_x += speed_x;
  bad_y += speed_y;
  
 
  float distToCursor = dist(bad_x, bad_y, mouseX, mouseY);
  if (distToCursor < ballradius) {
    if (!isBouncingOffCursor) {
      
      float angle = atan2(bad_y - mouseY, bad_x - mouseX);
      
      float magnitude = sqrt(speed_x * speed_x + speed_y * speed_y);  // Calculate current speed magnitude
      speed_x = cos(angle) * magnitude;
      speed_y = sin(angle) * magnitude;
      
      // Optionally add randomness to make it more unpredictable
      bad_x += random(-1, 1);
      bad_y += random(-1, 1);
      
      // Mark that the ball is bouncing off the cursor
      isBouncingOffCursor = true;
    }
  } else {
    // If the cursor is not in contact, keep bouncing off edges and maintain speed
    isBouncingOffCursor = false;
  }
  
 
  if (bad_x > width - ballradius || bad_x < ballradius) {
    speed_x = -speed_x;
  }
  if (bad_y > height - ballradius || bad_y < ballradius) {
    speed_y = -speed_y;
  }
 
  if (mouseX>width/4 && mouseX<width/4+500 && mouseY > height/4 && mouseY < height/4 + 50
){ 
    tungtungtungsahur= height/4-10;
    skibidi=240;
    cubex=520;
    cubey=70;}else{
      skibidi=250;
      cubex=500;
      cubey=50;
      tungtungtungsahur= height/4;}
  if (bad_y > 400){
    showAll = false;
    }
  textSize(10);
  text ( "Score", 10, 10);
  text ( timer, 40, 10);
  text ( "HighScore", 100, 10);
  text ( HighScore, 150, 10);
  if (showAll) {
  fill( 255, 255, 255);
  ellipse( mouseX, mouseY, ballradius*2, ballradius*2);
  ellipse(bad_x, bad_y, ballradius * 2, ballradius * 2);
  fill( 255, 0, 0);
  rect(0, 400, 1100, 200);
}else{
   textSize(50); 
   text ("You lost, you idiot.", width/2-250, 100);
   timer = timer+0;
   timer = 0;
   showRectangle = true;
  } 
 if (showRectangle) {
   fill( 255, 255, 255);
   rect(skibidi, tungtungtungsahur, cubex, cubey);
    if (mouseY>height/4 && mouseY<height/4+cubey && mouseX>skibidi && mouseX<skibidi+cubex){
    if (mousePressed == true){
    speed_x = 5 ;
    speed_y = 5;
    showRectangle = false;
    showAll = true;
    bad_x =15;
    bad_y =15;
  }}
  } else{timer = timer + 0.01;}
  // highscore and stuff
  if(timer > HighScore){
    HighScore = timer;}
  
}
