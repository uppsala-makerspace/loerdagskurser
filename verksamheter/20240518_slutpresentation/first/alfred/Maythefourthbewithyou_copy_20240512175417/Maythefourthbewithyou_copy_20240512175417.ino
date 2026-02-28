int musPin = 2;

void setup() {
  pinMode(musPin, OUTPUT);
}

void loop() {
  digitalWrite(musPin, HIGH);
  delay(100);
  digitalWrite(musPin, LOW);
  delay(10);
}