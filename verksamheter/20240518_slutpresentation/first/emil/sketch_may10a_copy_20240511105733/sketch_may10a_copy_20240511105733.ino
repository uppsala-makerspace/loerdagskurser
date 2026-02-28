#include <servo.h>
servo myservo;
int const potpin = AO;
int potval;
int angel;
void setup() {
  myServo.attach(9);
 Serial.begin(9600);
}
void loop() {
  potval = analogRead(potpin);
serial.prin("potval: ");



void loop() 
  // put your main code here, to run repeatedly:

}
