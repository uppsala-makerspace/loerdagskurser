void drawScreen()
{
  fill(l);
  textSize(200);
  text("SUPER PONG", width/2-400, height/ 2);
  textSize(20);
  text("v:4,4,5", 1800, 1000);
  text("Caps lock is on idiot!",caps,lock);
  textSize(50);
  text("SCORE:", 100, 100); 
  text(score, 255, 100);
  text("HISCORE:", 100, 150);
  text(hiscore, 300, 150);
  rect(width -50, y, BALL, ball); 
  rect(- 50, y, BALL, ball);
  rect(x, height - 50, BALL, ball);
  rect(x, - 50, BALL, ball);
  ellipse(x1, y1, 50, 50);
}
