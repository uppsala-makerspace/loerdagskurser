


char[] characters = {' ', '!', '"', '#', '$', '%', '&', '\'', '(', ')', '*', '+', ',', '-', '.', '/', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ':', ';', '<', '=', '>', '?', '@', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '[', '\\', ']', '^', '_', '`', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '{', '|', '}', '~', '␡'};

void write(int character, int index1, int index2, int X, int Y,int W, int H){
  if(character>127||character<0) character=0;
  if(abs((int(chars[index1][index2])-character+64)%128-64)>nFrame-charsFrame[index1][index2]){
    if((int(chars[index1][index2])-character+64)%128-64<0){
      chars[index1][index2]=byte(int(chars[index1][index2])+(nFrame-charsFrame[index1][index2])%128);
    }
    if((int(chars[index1][index2])-character+64)%128-64>0){
      chars[index1][index2]=byte(int(chars[index1][index2])-(nFrame-charsFrame[index1][index2])%128);
    }
  }else chars[index1][index2]=byte(character%128);
  charsFrame[index1][index2]=nFrame;
  image(images[0],X,Y,8*W,12*H,(chars[index1][index2]*8)%256,floor(chars[index1][index2]/32f)*12,(chars[index1][index2]*8)%256+8,floor(chars[index1][index2]/32f)*12+12);
}

public static int findIndexOfChar(char[] charArray, char targetChar) {
  for (int i = 0; i < charArray.length; i++) {
    if (charArray[i] == targetChar && Character.isUpperCase(charArray[i]) == Character.isUpperCase(targetChar)) {
      return i; // Return the index if the character is found
    }
  }
  return 0; // Return 0 if the character is not found in the array
}


void writeChar(char character, float x, float y, int index) {
  write(findIndexOfChar(characters, character) + 32, 2, index, int(x), int(y), 4, 4);
}

void updateImages() {
  String[] img_reg = loadStrings("https://codeberg.org/hha2011/Dependent/raw/branch/herman/Dependent/data/img_reg.txt");
  saveStrings("data/img_reg.txt", img_reg);
  for (int i = 0; i < img_reg.length; i++) {
    loadImage("https://codeberg.org/hha2011/Dependent/raw/branch/herman/Dependent/data/" + img_reg[i] + ".png").save("data/" + img_reg[i] + ".png");
  }
}

void updateMaps() {
  String[] mapsList = loadStrings("https://codeberg.org/hha2011/Dependent/raw/branch/herman/Dependent/data/maps.txt");
  saveStrings("data/maps.txt", mapsList);
  for(int i = 0; i < mapsList.length; i++) {
    saveStrings("data/maps/" + mapsList[i] + ".txt", loadStrings("https://codeberg.org/hha2011/Dependent/raw/branch/herman/Dependent/data/maps/" + mapsList[i] + ".txt"));
  }
}

void loadSounds() {
  String[] sound_reg = loadStrings("sound_reg.txt");
  sounds = new AudioPlayer[sound_reg.length];
  
  for(int i = 0; i < sound_reg.length; i++) {
    sounds[i] = minim.loadFile(sound_reg[i]);
  }
}

void initButtons() {
  mainMenu = new Button[5];
  pauseMenu = new Button[3];
  settingsMenu = new Button[2];
  mapsMenu = new Button[1];
  controlsMenu = new Button[1];
  
  mainMenu[0] = new Button(0, 40, 160, 40, "Start");
  mainMenu[1] = new Button(0, 80, 160, 40, "Update");
  mainMenu[2] = new Button(0, 120, 160, 40, "Settings");
  mainMenu[4] = new Button(0, 160, 160, 40, "Controls");
  mainMenu[3] = new Button(0, 200, 160, 40, "Quit");
  
  pauseMenu[0] = new Button(0, 40, 160, 40, "Resume");
  pauseMenu[1] = new Button(0, 80, 160, 40, "Settings");
  pauseMenu[2] = new Button(0, 120, 160, 40, "Quit");
  
  settingsMenu[0] = new Button(0, height - 40, 170, 40, "Exit");
  settingsMenu[1] = new Button(0, 40, 170, 40, "Music: 100%");
  settingsMenu[1].label = "Music: " + str(int(musicVolume * 100)) + "%";
  
  controlsMenu[0] = new Button(0, 0, 60, 40, "Exit");
  
  mapsMenu[0] = new Button(0, height - 40, width, 40, "Find and download map updates");
  for(int i = 0; i < maps.list().length; i++) {
    Button newButton = new Button((i*40)%width, floor(i/(width / 40)) * 40 + 40, 40, 40, maps.list()[i].substring(3, 5));
    mapsMenu = (Button[]) append(mapsMenu, newButton);
  }
}

void drawMain() {
  pan--;
  
  image(images[5], 0, 0);
  image(images[5], 0, images[5].height);
  if(pan <= -width * 2) pan = 0;
  
  text("Dependent", 0, 0);
  for(int i = 0; i < mainMenu.length; i++) {
    mainMenu[i].display();
  }
}

void drawSettings() {
  background(200);
  
  text("Settings", 0, 0);
  
  for(int i = 0; i < settingsMenu.length; i++) {
    settingsMenu[i].display();
  }
  
  if(settingsMenu[1].state == 1) {
    musicVolume += 0.25;
    musicVolume %= 1.25;
    settingsMenu[1].label = "Music: " + str(int(musicVolume * 100)) + "%";
  }
  
  if(settingsMenu[0].isPressed()) paused = MBF; saveSettings();
}

void drawMaps() {
  background(200);  
  fill(0);
  text("Select map", 0, 0);
  
  for(int i = 0; i < mapsMenu.length; i++) {
    mapsMenu[i].display();
  }
}

void drawControls() {
  for(int i = 0; i < controlsMenu.length; i++) {
    controlsMenu[i].display();
  }
}

void drawPM() {
  for(int i = 0; i < pauseMenu.length; i++) {
    pauseMenu[i].display();
  }
}

void saveSettings() {
  String[] newSettings = {str(musicVolume)};
  saveStrings("data/settings.txt", newSettings);
  sounds[0].setGain(map(musicVolume, 0, 1, -30, 0));
}
