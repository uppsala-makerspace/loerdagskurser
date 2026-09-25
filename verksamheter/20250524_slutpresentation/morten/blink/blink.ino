void setup()
{
 pinMode(3, OUTPUT);
 pinMode(2, OUTPUT);
}

void loop()
{
  digitalWrite(3, HIGH);
  delay(1021);
  digitalWrite(3, LOW);
  delay(1939);
  digitalWrite(3, HIGH);
  delay(2021);
  digitalWrite(3, LOW);
  delay(1469);
  digitalWrite(2, HIGH);
  delay(3970);
  digitalWrite(2,LOW);
  delay(6024);
  digitalWrite(2, HIGH);
  delay(5032);
  digitalWrite(2, LOW);
  delay(3320);
}