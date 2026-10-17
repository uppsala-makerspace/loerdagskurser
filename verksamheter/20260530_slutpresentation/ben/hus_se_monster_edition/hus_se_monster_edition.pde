import java.awt.Robot;
import java.awt.AWTException;

float x = 960, y = 1000, speed = 5;
boolean isW, isA, isS, isD;
int state = 1; 

int deathTime = 0;
int deathDelay = 2000; 

Robot robot;

void setup() {
  fullScreen();
  try {
    robot = new Robot();
  } catch (AWTException e) {
    println("Robot could not be initialized");
  }
}

void draw() {
  if (state == 1) {
    drawOutside();
  } else if (state == 2) {
    drawInside();
  } else if (state == 3) {
    drawDead();
  }
}

void drawOutside() {
  background(0, 0, 255);

  fill(0, 255, 0);
  rect(width/2-1030, height/2+100, 2020, 1000);
  fill(255, 255, 255);
  rect(width/2-200, height/2-200, 400, 500);
  
  if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY > height/2+100 && mouseY < height/2+300) {
    fill(200, 0, 0); 
  } else {
    fill(255, 0, 0); 
  }
  rect(width/2-50, height/2+100, 100, 200);
  fill(255, 255, 255);
  ellipse(width/2+340, 180, 200, 100);
  ellipse(width/2+380, 200, 200, 100);
  ellipse(width/2+300, 200, 200, 100);
  
  ellipse(width/2, 130, 200, 100);
  ellipse(width/2-40, 150, 200, 100);
  ellipse(width/2+40, 150, 200, 100);
  
  ellipse(width/2-540, 180, 200, 100);
  ellipse(width/2-580, 200, 200, 100);
  ellipse(width/2-500, 200, 200, 100);
  fill(255, 0, 0);

  

 
  fill(139, 69, 19);
  rect(width/2-370, height/2+195, 10, 60);
  rect(width/2-340, height/2+195, 10, 60);
  rect(width/2-310, height/2+195, 10, 60);
  rect(width/2-400, height/2+195, 10, 300); 
  rect(width/2-280, height/2+195, 10, 60);
  rect(width/2-250, height/2+195, 10, 60);
  rect(width/2-220, height/2+195, 10, 60);
  rect(width/2+360, height/2+195, 10, 60);
  rect(width/2+330, height/2+195, 10, 60);
  rect(width/2+300, height/2+195, 10, 60);
  rect(width/2+390, height/2+195, 10, 300); 
  rect(width/2+270, height/2+195, 10, 60);
  rect(width/2+240, height/2+195, 10, 60);
  rect(width/2+210, height/2+195, 10, 60);
  rect(width/2-370, height/2+435, 10, 60);
  rect(width/2-340, height/2+435, 10, 60);
  rect(width/2-310, height/2+435, 10, 60);
  rect(width/2-400, height/2+435, 10, 60); 
  rect(width/2-280, height/2+435, 10, 60);
  rect(width/2-250, height/2+435, 10, 60);
  rect(width/2-220, height/2+435, 10, 60);
  rect(width/2-190, height/2+435, 10, 60);
  rect(width/2-160, height/2+435, 10, 60);
  rect(width/2-130, height/2+435, 10, 60);
  rect(width/2-100, height/2+435, 10, 60); 
  rect(width/2-70,  height/2+435, 10, 60);
  rect(width/2+180, height/2+435, 10, 60);
  rect(width/2+150, height/2+435, 10, 60);
  rect(width/2+120, height/2+435, 10, 60);
  rect(width/2+90,  height/2+435, 10, 60); 
  rect(width/2+60,  height/2+435, 10, 60);
  rect(width/2+360, height/2+435, 10, 60);
  rect(width/2+330, height/2+435, 10, 60);
  rect(width/2+300, height/2+435, 10, 60);
  rect(width/2+390, height/2+435, 10, 60); 
  rect(width/2+270, height/2+435, 10, 60);
  rect(width/2+240, height/2+435, 10, 60);
  rect(width/2+210, height/2+435, 10, 60);
  rect(width/2-400, height/2+200, 200, 10);
  rect(width/2-400, height/2+220, 200, 10);
  rect(width/2-400, height/2+240, 200, 10);
  rect(width/2-400, height/2+440, 350, 10);
  rect(width/2-400, height/2+460, 350, 10);
  rect(width/2-400, height/2+480, 350, 10);
  rect(width/2+50,  height/2+440, 350, 10);
  rect(width/2+50,  height/2+460, 350, 10);
  rect(width/2+50,  height/2+480, 350, 10);
  rect(width/2+200, height/2+200, 200, 10);
  rect(width/2+200, height/2+220, 200, 10);
  rect(width/2+200, height/2+240, 200, 10);
  fill(255, 255, 255);
  ellipse(width/2-250, height/2+350, 30, 30);
  fill(0, 0, 0);
  ellipse(width/2-250, height/2+350, 5, 5);
  ellipse(width/2-258, height/2+358, 5, 5);
  ellipse(width/2-242, height/2+342, 5, 5);
  ellipse(width/2-242, height/2+358, 5, 5);
  ellipse(width/2-258, height/2+342, 5, 5);
  
  fill(255, 0, 0);
  triangle(width/2, height/2-300, width/2-300, height/2-200, width/2+300, height/2-200);
  fill(250, 255, 230);
  rect(width/2+50, height/2-100, 100, 100);
  rect(width/2-150, height/2-100, 100, 100);
  rect(width/2+50, height/2-100, 50, 50);
  rect(width/2+100, height/2-50, 50, 50);
  rect(width/2-100, height/2-100, 50, 50);
  rect(width/2-150, height/2-50, 50, 50);
  ellipse(width/2+50, height/2+200, 25, 25);
  

  fill(139, 69, 19);
  rect(width/2-505, height/2, 15, 100);
  fill(0,255,0);

  ellipse(width/2-480, height/2+20, 100, 100);
  ellipse(width/2-520, height/2+20, 100, 100);
  ellipse(width/2-500, height/2, 100, 100);
  
  fill(139, 69, 19);
  rect(width/2+495, height/2, 15, 100);
  fill(0,255,0);
  ellipse(width/2+480, height/2+20, 100, 100);
  ellipse(width/2+520, height/2+20, 100, 100);
  ellipse(width/2+500, height/2, 100, 100);
  fill(139, 69, 19);
  rect(width/2+795, height/2, 15, 100);
  fill(0,255,0);
  ellipse(width/2+780, height/2+20, 100, 100);
  ellipse(width/2+820, height/2+20, 100, 100);
  ellipse(width/2+800, height/2, 100, 100);
  fill(139, 69, 19);
  rect(width/2-605, height/2, 15, 100);
  fill(0,255,0);
  ellipse(width/2-580, height/2+20, 100, 100);
  ellipse(width/2-620, height/2+20, 100, 100);
  ellipse(width/2-600, height/2, 100, 100);
  fill(139, 69, 19);
  rect(width/2-805, height/2, 15, 100);
  fill(0,255,0);
  ellipse(width/2-780, height/2+20, 100, 100);
  ellipse(width/2-820, height/2+20, 100, 100);
  ellipse(width/2-800, height/2, 100, 100);
  
  moveCharacter();
}

void drawInside() {
  background(61, 43, 31); 
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("monstret under trappan", width-200, height/2+500);
  text("Detta är en hus", width/2, height/2-300);
  text("tryck B för att gå ut", width/2, height/2 + 300);
  text("Prrrrrr", width/2+10, height/2-100);
  text("fridge", 200, height/2+100);

  float mHeadX = width-200;
  float mHeadY = height/2+250;
  float mBodyX = width-200;
  float mBodyY = height/2+350;

  if (dist(x, y, mHeadX, mHeadY) < 50 || dist(x, y, mBodyX, mBodyY) < 80) {
    state = 3;          
    deathTime = millis(); 
    robot.mouseMove(0, 0); 
  }
  fill (211, 211, 211);
  rect(300, height/2+30, 200, 400);
  fill(60, 60, 60);
  rect(440, height/2+200, 50, 10);
  fill(255, 165, 0);
  ellipse(width/2-50, height/2-70, 100, 15);
  ellipse(width/2+25, height/2-80, 200, 50);
  fill(255, 165, 0);
  triangle(width/2-80, height/2-100, width/2-50, height/2-150, width/2-50, height/2-135);
  triangle(width/2-60, height/2-120, width/2-80, height/2-110, width/2-70, height/2-150);
  ellipse(width/2-60, height/2-110, 50, 50);
  ellipse(width/2+65, height/2-70, 120, 15);
  fill(255, 0, 0);
  ellipse(width/2, height/2-50, 400, 25);
  fill(255,255,255);
  ellipse(100, height/2+225, 100, 10);
  ellipse(250, height/2+225, 100, 10);
  fill(139, 69, 19);
  rect(10, height/2+230, 10, 200);
  rect(310, height/2+230, 10, 200);
  rect(0, height/2+230, 330, 20);
  rect(410, height/2+300, 10, 130);
  rect(610, height/2+100, 10, 330);
  rect(390, height/2+280, 250, 20);
  
  fill(0, 100,0);
  ellipse(mHeadX, mHeadY, 50, 50);
  ellipse(mBodyX, mBodyY, 100, 150);
  
  fill(139, 69, 19);
  rect(0, 500, 1500, 15);
  rect(0, 960, 2000, 20); 
  rect(1800, height/2, 200, 30);
  rect(1750, height/2+30, 200, 30);
  rect(1700, height/2+60, 200, 30);
  rect(1650, height/2+90, 200, 30);
  rect(1600, height/2+120, 200, 30);
  rect(1550, height/2+150, 200, 30);
  rect(1500, height/2+180, 200, 30);
  rect(1450, height/2+210, 200, 30);
  rect(1400, height/2+240, 200, 30);
  rect(1350, height/2+270, 200, 30);
  rect(1300, height/2+300, 200, 30);
  rect(1250, height/2+330, 200, 30);
  rect(1200, height/2+360, 200, 30);
  rect(1150, height/2+390, 200, 30);
  rect(250, 385, 25, 116);
  rect(575, 400, 25, 101);
  fill(60,60,255);
  rect(1300, 50, 300, 300);
  rect(1300, 50, 150, 150);
  fill(60,60,255);
  rect(300, 50, 150, 150);
  rect(450, 50, 150, 150);
  rect(1450, 50, 150, 150);
  fill(0,200,0);
  rect(450, 200, 150, 150);
  rect(1450, 200, 150, 150); 
  rect(300, 200, 150, 150);
  rect(1300, 200, 150, 150);
  
  fill(139, 69, 19);
  rect(width/3-101, height/3-200, 5, 60);
  fill(0,170,0);
  ellipse(width/3-95, height/3-195, 50, 50);
  ellipse(width/3-105, height/3-195, 50, 50);
  ellipse(width/3-100, height/3-200, 50, 50);
  fill(139, 69, 19);
  rect(width/2-601, height/2-270, 5, 60);
  fill(0,170,0);
  ellipse(width/2-595, height/2-265, 50, 50);
  ellipse(width/2-605, height/2-265, 50, 50);
  ellipse(width/2-600, height/2-270, 50, 50);
  fill(139, 69, 19);
  rect(width/3+701, height/3-200, 5, 60);
  fill(0,170,0);
  ellipse(width/3+695, height/3-195, 50, 50);
  ellipse(width/3+705, height/3-195, 50, 50);
  ellipse(width/3+700, height/3-200, 50, 50);
  fill(139, 69, 19);
  rect(width/2+601, height/2-270, 5, 60);
  fill(0,170,0);
  ellipse(width/2+595, height/2-265, 50, 50);
  ellipse(width/2+605, height/2-265, 50, 50);
  ellipse(width/2+600, height/2-270, 50, 50);
  fill(255,0,0);
  rect(300, 400, 300, 50);
  fill(255,255,255);
  rect(250, 385, 50, 65);
  fill(100, 50, 20);
  rect(610, 600, 30, 360);
  
  moveCharacter();
}
  
void drawDead() {
  background(150, 0, 0); 
  fill(255);
  textSize(100);
  textAlign(CENTER, CENTER);
  text("YOU DIED", width/2, height/2);
  
  textSize(30);
  text("Respawning outside...", width/2, height/2 + 100);

  if (millis() - deathTime > deathDelay) {
    state = 1;     
    x = 960;       
    y = 1000;
  }
}

void moveCharacter() {
  fill(255, 229, 180);
  if (isW) y -= speed;
  if (isS) y += speed;
  if (isA) x -= speed;
  if (isD) x += speed;
  ellipse(x, y, 50, 50);
}

void mousePressed() {
  if (state == 1) {
    if (mouseX > width/2-50 && mouseX < width/2+50 && mouseY > height/2+100 && mouseY < height/2+300) {
      state = 2;
      x = width/2; 
      y = 935;     
    }
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') isW = true;
  if (key == 's' || key == 'S') isS = true;
  if (key == 'a' || key == 'A') isA = true;
  if (key == 'd' || key == 'D') isD = true;
  
  if (state == 2 && (key == 'b' || key == 'B')) {
    state = 1;
    x = width/2;
    y = height/2 + 350; 
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') isW = false;
  if (key == 's' || key == 'S') isS = false;
  if (key == 'a' || key == 'A') isA = false;
  if (key == 'd' || key == 'D') isD = false;
}
