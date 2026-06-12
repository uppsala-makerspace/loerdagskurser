float logoY = 40;
float logoYV = 0;

void DrawMainMenu()
{
  imgMainMenu.resize(200,200);
  //image(imgHow,100,50);
  image(imgMainMenu,0,0);
  image(imgEnter, 130,90);
  image(imgLogo,21,logoY);
  logoY += logoYV;
  logoYV = logoYV + .01;
    if(logoY > 40)
  {
    logoYV = -0.5;
  }
}
