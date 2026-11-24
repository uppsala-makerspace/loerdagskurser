const int speaker_pin = 8;
const int pin_1 = 2;
const int pin_2 = 3;
const int pin_3 = 4;
const int pin_4 = 5;
const int pin_5 = 6;
const int pin_6 = 7;
const int pin_7 = 9;
const int pin_8 = 10;
const int pin_9 = 11;
const int pin_10 = 12;
const int pin_11 = A0;
const int pin_12 = A1;
const int pin_13 = A2;
const int pin_14 = A3;
const int pin_15 = A4;
const int pin_16 = A5;

void setup()
{
  pinMode(speaker_pin,  OUTPUT);
  pinMode(pin_1, INPUT);
  pinMode(pin_2, INPUT);
  pinMode(pin_3, INPUT);
  pinMode(pin_4, INPUT);
  pinMode(pin_5, INPUT);
  pinMode(pin_6, INPUT);
  pinMode(pin_7, INPUT);
  pinMode(pin_8, INPUT);
  pinMode(pin_9, INPUT);
  pinMode(pin_10, INPUT);
  pinMode(pin_11, INPUT);
  pinMode(pin_12, INPUT);
  pinMode(pin_13, INPUT);
  pinMode(pin_14, INPUT);
  pinMode(pin_15, INPUT);
  pinMode(pin_16, INPUT);  
}

void loop()
{
  if (digitalRead(pin_1) == HIGH)
  {
    tone(speaker_pin, 131, 250);
    delay(250);
  }
  if (digitalRead(pin_2) == HIGH)
 { 
  tone(speaker_pin, 147, 250);
  delay(250);
 }
 if(digitalRead(pin_3) == HIGH)
 {
   tone(speaker_pin, 165, 250);
   delay(250);
 }
 if(digitalRead(pin_4) == HIGH)
 {
   tone(speaker_pin, 175, 250);
   delay(250);
 }
 if(digitalRead(pin_5) == HIGH)
 {
   tone(speaker_pin, 196, 250);
   delay(250);
 }
 if(digitalRead(pin_6) == HIGH)
 {
   tone(speaker_pin, 220, 250);
   delay(250);
 }
 if(digitalRead(pin_7) == HIGH)
 {
   tone(speaker_pin, 247, 250);
   delay(250);
 }
 if(digitalRead(pin_8) == HIGH)
 {
   tone(speaker_pin, 262, 250);
   delay(250);
 }
 if(digitalRead(pin_9) == HIGH)
 {
   tone(speaker_pin, 294, 250);
   delay(250);
 }
 if(digitalRead(pin_10) == HIGH)
 {
   tone(speaker_pin, 330, 250);
   delay(250);
 }
 if(digitalRead(pin_11) == HIGH)
 {
   tone(speaker_pin, 175*2, 250);
   delay(250);
 }
 if(digitalRead(pin_12) == HIGH)
 {
   tone(speaker_pin, 196*2, 250);
   delay(250);
 }
if(digitalRead(pin_13) == HIGH)
 {
   tone(speaker_pin, 220*2, 250); 
   delay(250);
 }
 if(digitalRead(pin_14) == HIGH)
 {
   tone(speaker_pin, 247*2, 250);
   delay(250);
 }
 if(digitalRead(pin_15) == HIGH)
 {
   tone(speaker_pin, 262*2, 250);
   delay(250);
 }
 if(digitalRead(pin_16) == HIGH)
 {
   tone(speaker_pin, 294*2, 250);
   delay(250);         
  }
}

