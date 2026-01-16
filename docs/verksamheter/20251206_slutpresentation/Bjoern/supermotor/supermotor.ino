void setup()
{
  pinMode(13, OUTPUT);  
}

void loop()
{
  digitalWrite(13, HIGH); // 150 nanosec
  delay(0);  
  digitalWrite(13, LOW);
  delay(0);
  // 14 microsec  
}
