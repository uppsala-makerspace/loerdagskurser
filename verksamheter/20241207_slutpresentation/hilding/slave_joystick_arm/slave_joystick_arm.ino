#include <Wire.h>
#include <Servo.h>
#define SLAVE_ADDR 0x23
volatile byte myData[4];
volatile bool flag = false;
Servo snurr;
Servo arm;
Servo vinkel;
Servo klo;
float snurrout;
int snurrmellan;
float armout;
int armmellan;
float vinkelout;
int vinkelmellan;
float kloout;
int klomellan;
unsigned long prevmillis;
bool time;
void setup()
{
  Serial.begin(9600);
  Wire.begin(SLAVE_ADDR);
  Wire.onReceive(receiveEvent);
  snurr.attach(11);
  arm.attach(10);
  vinkel.attach(9);
  klo.attach(6);
  snurr.write(0);
  arm.write(0);
  vinkel.write(0);
  klo.write(0);
  pinMode(13, OUTPUT);
}

void loop()
{
 if(millis() - prevmillis >= 1500) {
  time = true;
  digitalWrite(13, HIGH);
 }
 else {
  time = false;
  digitalWrite(13, LOW);
 }
  if (flag == true)
  {
    Serial.println(myData[0], DEC);
    Serial.println(myData[1], DEC);
    Serial.println(myData[2], DEC);
    Serial.println(myData[3], DEC);
    Serial.println(time);   
    Serial.println(snurrmellan);
    Serial.println(snurrout);
    Serial.println(armmellan);
    Serial.println(armout);
    Serial.println(vinkelmellan);
    Serial.println(vinkelout);
    Serial.println(klomellan);
    Serial.println(kloout);
    Serial.println();
    flag = false;
  }
  snurrmellan = map(myData[1], 0, 255, -128, 128);
  armmellan = map(myData[0], 0, 255, -128, 128);
  vinkelmellan = map(myData[2], 0, 255, -128, 128);
  klomellan = map(myData[3], 0, 255, -128, 128);
  if(snurrmellan < -20 && time == true) {
  snurrout = snurrout - 0.05;
  }
  if(snurrmellan > 20 && time == true) {
  snurrout = snurrout + 0.05;
  }
if (snurrout <= 90) {snurrout = 90;
}
if (snurrout >= 160) {snurrout = 160;
}
if(armmellan < -20 && time == true) {
  armout = armout - 0.05;
  }
  if(armmellan > 20 && time == true) {
  armout = armout + 0.05;
  }
if (armout <= 0){armout = 0;
}
if (armout >= 179){armout = 179 ;
}
if(vinkelmellan < -20 && time == true) {
  vinkelout = vinkelout - 0.05;
  }
  if(vinkelmellan > 20 && time == true) {
  vinkelout = vinkelout + 0.05;
  }
if (vinkelout <= 0){vinkelout = 0;
}
if (vinkelout >= 179){vinkelout = 179;
}
if(klomellan < -20 && time == true) {
  kloout = kloout - 0.05;
  }
  if(klomellan > 20 && time == true) {
  kloout = kloout + 0.05;
  }
if (kloout <= 40){kloout = 40;
}
if (kloout >= 179){kloout = 179 ;
}
  //int armout = map(armmellan, -128, 128, 0, 179);
  //int vinkelout = map(vinkelmellan, -128, 128, 0, 179);
  //int kloout = map(klomellan, -128, 128, 40, 179);
  snurr.write(snurrout);
  arm.write(armout);
  vinkel.write(vinkelout);
  klo.write(kloout);
}

void receiveEvent() //howMany = data bytes received from master = 4 here
{
  int howMany = 4;
  for (int i = 0; i < howMany; i++)
  {
    myData[i] = Wire.read();
    delay(500);
  }
  flag = true;
}