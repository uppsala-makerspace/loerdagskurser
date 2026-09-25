#include <Servo.h>
int n_signals = 0;

Servo min_servo;

void setup() {
  pinMode(13, OUTPUT);
  pinMode(A0, INPUT);
  digitalWrite(13, HIGH);
  delay(1000);
  digitalWrite(13, LOW);
  min_servo.attach(6);  
}

void show_n_signals(const int n_signals)
{
  const bool show_red = n_signals % 2;
  const bool show_green = (n_signals / 2) % 2;
  const bool show_blue = (n_signals / 4) % 2;
  digitalWrite(9, show_red);
  digitalWrite(10, show_green);
  digitalWrite(11, show_blue);

  min_servo.write(n_signals % 90);
}


void loop() {
  delay(100);
  if (rand() % 10 == 0) {
    delay(1000);
    digitalWrite(13, HIGH);
    delay(1000);
    digitalWrite(13, LOW);
  }
  if (digitalRead(A0)) {
    ++n_signals;
    show_n_signals(n_signals);
    delay(1000);
    digitalWrite(13, HIGH);
    delay(1000);
    digitalWrite(13, LOW);
  }
}
