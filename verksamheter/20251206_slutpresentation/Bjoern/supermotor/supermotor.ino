int n = 0;

void setup()
{
  pinMode(12, OUTPUT);  
  pinMode(13, INPUT);  
}

void loop()
{
  if (digitalRead(13))
  {
    n = 100;
    digitalWrite(12, HIGH);
  }
  n = n - 1;
  if (n == 0)
  {
    digitalWrite(12, LOW);    
  }
  delay(1);  
}
