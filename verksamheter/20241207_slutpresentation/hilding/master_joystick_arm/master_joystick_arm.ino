#include <Wire.h>
#define SLAVE_ADDR 0x23
const int del = 100;
const int joy1xpin = A0;
const int joy1ypin = A1;
const int joy2xpin = A2;
const int joy2ypin = A3;
int outjoy1x;
int outjoy1y;
int outjoy2x;
int outjoy2y;
void setup()
{
  Serial.begin(9600);
  Wire.begin();
  pinMode(joy1xpin, INPUT);
  pinMode(joy1ypin, INPUT);
  pinMode(joy2xpin, INPUT);
  pinMode(joy1ypin, INPUT);
}

void loop()
{
  int joy1x = analogRead(joy1xpin);
  int joy1y = analogRead(joy1ypin);
  int joy2x = analogRead(joy2xpin);
  int joy2y = analogRead(joy2ypin);
  outjoy1x = map(joy1x, 0, 1023, 0, 255);
  outjoy1y = map(joy1y, 0, 1023, 0, 255);
  outjoy2x = map(joy2x, 0, 1023, 0, 255);
  outjoy2y = map(joy2y, 0, 1023, 0, 255);
  Serial.println(outjoy1x);
  Serial.println(outjoy1y);
  Serial.println(outjoy2x);
  Serial.println(outjoy2y);
  Serial.println();
  Wire.beginTransmission(SLAVE_ADDR);
  Wire.write(outjoy1x);
  Wire.write(outjoy1y);
  Wire.write(outjoy2x);
  Wire.write(outjoy2y);
  Wire.endTransmission();

  delay(del);
}