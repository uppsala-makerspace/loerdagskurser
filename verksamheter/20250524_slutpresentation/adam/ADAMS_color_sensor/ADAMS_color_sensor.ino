#include <LiquidCrystal.h>

// LCD-pins: RS, E, D4, D5, D6, D7
LiquidCrystal lcd(7, 8, 9, 10, 11, 12);

// Sensor-pins
#define S0 3
#define S1 4
#define S2 5
#define S3 6
#define OUT 2

void setup() {
  pinMode(S0, OUTPUT); digitalWrite(S0, HIGH);
  pinMode(S1, OUTPUT); digitalWrite(S1, LOW);
  pinMode(S2, OUTPUT);
  pinMode(S3, OUTPUT);
  pinMode(OUT, INPUT);

  lcd.begin(16, 2);
  lcd.print("Sensor start...");
  delay(1000);
  lcd.clear();

  Serial.begin(9600); // Felsökning
}

void loop() {
  int r, g, b;

  // Läs röd
  digitalWrite(S2, LOW); digitalWrite(S3, LOW);
  r = pulseIn(OUT, LOW);

  // Läs grön
  digitalWrite(S2, HIGH); digitalWrite(S3, HIGH);
  g = pulseIn(OUT, LOW);

  // Läs blå
  digitalWrite(S2, LOW); digitalWrite(S3, HIGH);
  b = pulseIn(OUT, LOW);

  // Visa värden i Serial Monitor
  Serial.print("R: "); Serial.print(r);
  Serial.print(" G: "); Serial.print(g);
  Serial.print(" B: "); Serial.println(b);

  // Visa färgnamn
  lcd.clear();
  lcd.setCursor(0, 0);

  if (r < 20 && g < 20 && b < 20) {
    lcd.print("Ingen faerg");
  }
  else if (r < 100 && g < 100 && b < 100) {
    lcd.print("Svart");
  }
  else if (r > 600 && g > 600 && b > 600 && abs(r - g) < 50 && abs(g - b) < 50) {
    lcd.print("Vit");
  }
  else if (r > g + 20 && r > b + 20) {
    lcd.print("Rod");
  }
  else if (g > r + 20 && g > b + 20) {
    lcd.print("Gron");
  }
  else if (b > r + 20 && b > g + 20) {
    lcd.print("Bla");
  }
  else {
    lcd.print("Okand");
  }

  delay(1000);
}
