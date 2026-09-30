void DrawBoll()
{
 
    bollZV = bollZV + gravity;
  bollZ = bollZ + bollZV;
  bollX = bollX + bollXV;
  bollY = bollY + bollYV;
  canShoot = abs(playerX - bollX) < 1 && abs(playerY - bollY) < 1;
 float previous = 0;
  if(round((bollZV + bollXV + bollYV) * 10) == round(previous * 10) )
{
    bollStill = true;
    
    
}
  
else
{
  bollStill = false;
  
  float i = 0;
  if (i > 5000) {
    previous = bollZV + bollXV + bollYV;
    i++;
  }
  
}
  
  if(bollY < -16)
{
  bollY = 200 + 16;
}
 if(bollY > 200 + 16)
{
  bollY = -16;
}

  if(bollX < -16)
{
  bollX = 200 + 16;
}
 if(bollX > 200 + 16)
{
  bollX = -16;
}
  
  
  tint(0,0,0);
image(imgBall,bollX + -8, bollY + -8);

tint(255);
image(imgBall, bollX+ -8,bollY + -8  + bollZ);
if(bollZ > 0)
{
  bollZ = 0;
  bollZV =  -abs(bollZV);
  bollXV = bollXV/1.1;
  bollYV = bollYV/1.1;
  
  if (bollZV < 0)
  {
    bollZV = bollZV/1.25;
  }

}
  //Change values

 
}

void DrawPlayer()
{
    tint(255,255,0);
  if (bollStill && !canShoot)
  {
    PVector playerMove;
    playerMove = new PVector(playerX - bollX, playerY - bollY);
    playerMove.normalize();
    playerX = playerX + playerMove.x * -1;
    playerY = playerY + playerMove.y * -1;
  }
  
  image(imgPlayer, playerX, playerY);
}
