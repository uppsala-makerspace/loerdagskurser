

  int bjorn_xstart = 500;
  int bjorn_ystart = 500;
  int bjorn_mossbredd = 50;
  int bjorn_moss_hojd = 75;
  int bjorn_moss_position_y = 25;
  int bjorn_ogon_bredd = 25;
  int bjorn_ogon_position_y = 15;
  int bjorn_pupill_position_max_y = 25;
  int bjorn_pupill_position_min_y = 5;
  int bjorn_pupill_position_y = 15;
  int bjorn_pupill_position_max_x = 25;
  int bjorn_pupill_position_min_x = 5;
  int bjorn_pupill_position_x = 15;
  int bjorn_pupill_addering = -1;


void setup() {
  size(1000, 1000);
  windowResizable(false);
  loop();
}

void draw() {


  color c = color(255, 100, 100);
  fill(c);  // Use color variable 'c' as fill color
  noStroke();
  rect( bjorn_xstart, bjorn_ystart, 250, 250);
  c = color(255, 255, 255);
  fill(c);  // Use color variable 'c' as fill color
  stroke(1);
  ellipse(bjorn_xstart+125, bjorn_ystart+125, 100, 120);


  c = color(10, 100, 10); //Mössa
  fill(c);
  stroke(1);
  triangle(bjorn_xstart+125-bjorn_mossbredd, bjorn_ystart+125-bjorn_moss_position_y, bjorn_xstart+125, bjorn_ystart+50-bjorn_moss_position_y, bjorn_xstart+125+bjorn_mossbredd, bjorn_ystart+125-bjorn_moss_position_y);

  c = color(255, 100, 100); //Näsa
  fill(c);
  ellipse(bjorn_xstart+125, bjorn_ystart+135, 15, 20);


  c = color(255, 255, 255); //pupiller
  fill(c);  
  if (bjorn_pupill_position_y>=bjorn_pupill_position_max_y)
    bjorn_pupill_addering = -1;
  if (bjorn_pupill_position_y<=bjorn_pupill_position_min_y)
    bjorn_pupill_addering = 1;
  bjorn_pupill_position_y+=bjorn_pupill_addering;

  textSize(128);
//  text(bjorn_pupill_position_y, 40, 120);


  ellipse(bjorn_xstart+125+bjorn_ogon_bredd, bjorn_ystart+125-bjorn_ogon_position_y, 15, 20);//ögon
  ellipse(bjorn_xstart+125-bjorn_ogon_bredd, bjorn_ystart+125-bjorn_ogon_position_y, 15, 20);//ögon
  c = color(0, 0, 0);
  fill(c);  // Use color variable 'c' as fill color
  stroke(1);
  ellipse(bjorn_xstart+125+bjorn_ogon_bredd, bjorn_ystart+125-bjorn_pupill_position_y, 5, 5);//Pupill
  ellipse(bjorn_xstart+125-bjorn_ogon_bredd, bjorn_ystart+125-bjorn_pupill_position_y, 5, 5);//Pupill
  
  
  c = color(255, 255, 255);
  fill(c);  // Use color variable 'c' as fill color
  stroke(1);
  arc(bjorn_xstart+125, bjorn_ystart+125+30, 50, 50, 0+bjorn_pupill_position_y/40.0, PI-bjorn_pupill_position_y/40.0);
noFill();
}
