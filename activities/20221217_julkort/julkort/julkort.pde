int ramis_current_red = 0;
int ramis_current_green = 0;
int ramis_current_blue = 0;
int ramis_red_change = 1;
int ramis_green_change = 2;
int ramis_blue_change = 3;
int ramis_current_size_x = 50;
int ramis_current_size_y = 50;

int ramis_min_x = 250;
int ramis_max_x = 499;
int ramis_min_y = 500;
int ramis_max_y = 749;

lift Lift = new lift(500,750);

void setup()
{
  size(1000, 1000);  
  background(0);
}

void draw()
{
  // Vidar

  // Herman
  
  // Gunnar

  // Kevin

  // Richel
  fill(255, 128, 0);
  rect(250, 250, 250, 250); 

  // Christoffer
  drawRamis();

  // Bjoern

  // Leonid
  Lift.drawLift();

  // Ludvig
}

void drawRamis() {
  stroke(0, 0, 0);
  fill(0, 0, 0);
  square(ramis_min_x, ramis_min_y, 249);
  
  ramis_current_red += ramis_red_change;
  ramis_current_green += ramis_green_change;
  ramis_current_blue += ramis_blue_change;
  
  if (ramis_current_red > 255) {
    ramis_current_red = 255;
    ramis_red_change = -ramis_red_change;
  } else if (ramis_current_red < 0) {
    ramis_current_red = 0;
    ramis_red_change = -ramis_red_change;
  }
  
  if (ramis_current_green > 255) {
    ramis_current_green = 255;
    ramis_green_change = -ramis_green_change;
  } else if (ramis_current_green < 0) {
    ramis_current_green = 0;
    ramis_green_change = -ramis_green_change;
  }
  
  if (ramis_current_blue > 255) {
    ramis_current_blue = 255;
    ramis_blue_change = -ramis_blue_change;
  } else if (ramis_current_blue < 0) {
    ramis_current_blue = 0;
    ramis_blue_change = -ramis_blue_change;
  }
  
  // Body
  int center_x = (ramis_min_x+ramis_max_x)/2;
  int center_y = (ramis_min_y+ramis_max_y)/2;
  stroke(ramis_current_red, ramis_current_green, ramis_current_blue);
  fill(ramis_current_red, ramis_current_green, ramis_current_blue);
  ellipse(center_x,
    center_y, 
    249, 
    249);
  
  // Body parts
  stroke(ramis_current_green, ramis_current_blue, ramis_current_red);
  fill(ramis_current_green, ramis_current_blue, ramis_current_red);
  ellipse(center_x-50,
    center_y-50, 
    20, 
    20);
  ellipse(center_x+50,
    center_y-50, 
    20, 
    20);
  ellipse(center_x,
    center_y, 
    20, 
    20);
    
  ellipse(center_x-70,
    center_y+40, 
    20, 
    20);
  ellipse(center_x+70,
    center_y+40, 
    20, 
    20);
  ellipse(center_x-45,
    center_y+50, 
    20, 
    20);
  ellipse(center_x+45,
    center_y+50, 
    20, 
    20);
  ellipse(center_x-18,
    center_y+55, 
    20, 
    20);
  ellipse(center_x+18,
    center_y+55, 
    20, 
    20);
}
