#include <Servo.h>
Servo min_servo; 

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);

min_servo.attach(9);
}

void loop() 
{
  // put your main code here, to run repeatedly:
if (Serial.available())
{
const int vard = Serial.parseInt();
Serial.print("Jag sätter servon på ");
Serial.println(vard);
//const int vard = 110;
min_servo.write(vard);
delay(500);
//min_servo.write(0);
//delay(500);
}

}
