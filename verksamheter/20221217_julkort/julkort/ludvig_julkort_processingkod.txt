int ludvigCount = 0;
int ludvigTextX = 760;
float ludvigSnowX = 0;
float ludvigSnowY = 0;
void setup(){
  size(1000, 1000);
}

void draw(){
  stroke(0);
  fill(0);
  rect(750, 750, 1000, 1000);
  fill(255, 255, 255);
  ellipse(875, 955, 150, 150);
  fill(255, 0, 0);
  triangle(775, 950, 875, 780, 975, 950);
  fill(255, 125, 150);
  ellipse(875, 955, 100, 50);
  
  
  
  fill(255);
  ellipse(875,780, 30, 30);
  fill(155, 155, 255);
  textSize(50);
  text("Ha En Hoo", ludvigTextX, 800);
  textSize(40);
  text("Tastisk Jul", ludvigTextX + 30, 850);
  ludvigCount = ludvigCount + 1;
  if( ludvigCount >= 60 && ludvigCount <= 200){
    ludvigTextX = ludvigTextX + 2;
  }
  if(ludvigCount > 200){
    noStroke();
    fill(255);
    ellipse(random(756, 1000), random(756, 1000), 6, 6);
  }
}
