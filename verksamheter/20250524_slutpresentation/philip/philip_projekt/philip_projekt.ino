void setup()
{
 pinMode (12, OUTPUT);
  pinMode (13, OUTPUT);
  pinMode (7, INPUT);
}

bool on = true;
bool button;

void loop()
{
  bool read = digitalRead(7);
  if(read != button) {
    button = read;
    if(button)
      on = !on;
    delay(10);
  }
  if(!on) return;
 digitalWrite(12, HIGH);
  digitalWrite(13,HIGH);
  delay(100);
  digitalWrite(11, LOW);
  digitalWrite(12, LOW);
  digitalWrite(13, LOW);
  delay(100);
}
