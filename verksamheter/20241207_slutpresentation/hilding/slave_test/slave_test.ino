#include <Wire.h>
#define SLAVE_ADDR 0x23
volatile byte myData[2];
volatile bool flag = false;

void setup()
{
  Serial.begin(9600);
  Wire.begin(SLAVE_ADDR);
  Wire.onReceive(receiveEvent);
}

void loop()
{
  if (flag == true)
  {
    Serial.println(myData[0], HEX); //shows: 12
    Serial.println(myData[1], HEX); //shows: 45
    flag = false;
  }
}

void receiveEvent(int howMany) //howMany = data bytes received from Amster = 2 here
{
  for (int i = 0; i < howMany; i++)
  {
    myData[i] = Wire.read();
  }
  flag = true;
}
