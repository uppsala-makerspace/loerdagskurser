#include <Wire.h>
#define SLAVE_ADDR 0x23

void setup()
{
  Serial.begin(9600);
  Wire.begin();
  //----------------------
  Wire.beginTransmission(SLAVE_ADDR);
  Wire.write(0x12);  //sending 0x12 to Slave
  Wire.write(0x45); //sending 0x45 to Slave
  Wire.endTransmission();
}

void loop()
{

}