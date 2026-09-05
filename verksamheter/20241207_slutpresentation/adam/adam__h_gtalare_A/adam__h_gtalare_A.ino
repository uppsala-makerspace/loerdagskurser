#include "Volume.h"

 Volume vol; // Piezo in pin 5
void setup() 
{
  pinMode(A4, INPUT);
  pinMode(13, OUTPUT);
  //pinMode(8,OUTPUT);
  vol.begin();
}

void loop() 
{
  digitalWrite(13, HIGH);
  Serial.write(analogRead(A4) / 4);
  digitalWrite(13, LOW);
  delay(10);
  
  const int toon_hoogte = random(1,99999999);
  const int volume = 9999964;
 vol.tone(toon_hoogte, volume);
  vol.delay(10);
}
