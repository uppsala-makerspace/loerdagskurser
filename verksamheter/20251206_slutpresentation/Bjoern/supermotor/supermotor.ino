int fart= 2;
int motorpin= 3;
int fadeAmount= 2;

// the setup routine runs once when you press reset:
void setup() {
  pinMode(motorpin, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
  // set the brightness of pin 9:
  analogWrite(motorpin, fart);
  // change the brightness for next time through the loop:
  fart = fart+ fadeAmount;
  // reverse the direction of the fading at the ends of the fade:
  if (fart <= 0 || fart >= 255) {
    fadeAmount = -fadeAmount;
  }
  // wait for 30 milliseconds to see the dimming effect
  delay(30);
}
