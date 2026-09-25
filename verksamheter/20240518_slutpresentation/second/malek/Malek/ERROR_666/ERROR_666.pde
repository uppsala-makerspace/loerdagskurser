float [] xs; //<>//
float [] ys;
float [] rs;
String [] ord;
PImage bild;

boolean grej_klickat = false;
int sekund_naer_klickat = 1000000;
boolean is_game_running = false;

void setup()
{
  information();
  draw_menu();
  
  background(0);
  size(600, 320);
  xs = new float[256];
  ys = new float[256];
  rs = new float[256];
  ord = new String[100];
  ord[0] = "PLAY";
  ord[1] = "version_1.0.0";
  ord[2] = "?";
  for (int i=0; i<256; ++i)
  {
    xs[i] = 160;
    ys[i] = 100;
    rs[i] = 160;
  }
  saveStrings("words.txt", ord);
  ord = loadStrings("words.txt");
}

void draw()
{
  textSize(11);
  text("version_1.0.0", 5, 315);
  
  if (is_game_running == true) {
  information();
  textSize(40);
  text(ord[1], 270, 265);
  
  } else {
  draw_menu();
  text(ord[1], 270, 265); //<>//
  }
}



  
