void setup() {
  pinMode(A0, INPUT);
  pinMode(13, OUTPUT);

}

void loop() {
  if (analogRead(A0) < 890){
      digitalWrite(13, HIGH);
  }
  if (analogRead(A0) > 889){
    digitalWrite(13, LOW);
  }
}
