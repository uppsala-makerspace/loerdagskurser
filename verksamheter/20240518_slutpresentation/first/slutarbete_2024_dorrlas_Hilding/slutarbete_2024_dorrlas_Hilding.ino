#include <Keypad.h>
#include <Servo.h>
#include "SR04.h"
#include "pitches.h"
#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

const int olasttid = 10000; //ms
const String password = "1234"; // lösenord

//servo
Servo myservo;
const int servopin = 10;

//knappar och lösenord
const int ROW_NUM = 1; //one row
const int COLUMN_NUM = 6; //six columns

char keys[ROW_NUM][COLUMN_NUM] = {
  {'*','1','2','3','4','#'},
};

byte pin_rows[ROW_NUM] = {9}; //connect to the row pinouts of the keypad
byte pin_column[COLUMN_NUM] = {3, 4, 5, 6, 7, 8,}; //connect to the column pinouts of the keypad

Keypad keypad = Keypad( makeKeymap(keys), pin_rows, pin_column, ROW_NUM, COLUMN_NUM );

String input_password;

//avståndssensor
#define TRIG_PIN 12
#define ECHO_PIN 11

SR04 sr04 = SR04(ECHO_PIN,TRIG_PIN);
long a;

//buzzer
const int buzzer = A3;

//knapp
const int knapp = 2;
const int lcdknapp = 3;

//display
LiquidCrystal_I2C lcd(0x27,20,4);

void setup(){
  pinMode(LED_BUILTIN, OUTPUT); //led
  Serial.begin(9600);
  input_password.reserve(32); // maximum input characters is 33, change if needed
  myservo.attach(servopin);
  myservo.write(90);
  lcd.init();      
  digitalWrite(LED_BUILTIN, LOW);
  pinMode(knapp, INPUT_PULLUP); 
  pinMode(lcdknapp, INPUT_PULLUP);
  delay(1000);
  Serial.println("on");
  lcd.setCursor(0,0);
  
}

void loop(){
  char key = keypad.getKey();

  if (key){
    Serial.println(key);

    if(key == '*') {
      input_password = ""; // clear input password
    } 
    else if(key == '#') {
      if(password == input_password) {
        Serial.println("password is correct");
        las_upp(); // kör funktion
      } 
      else {
        Serial.println("password is incorrect, try again");
          tone(buzzer, NOTE_D5, 200);
          delay(200);
          tone(buzzer, NOTE_C5, 200);
          delay(200);
          lcd.clear();
          lcd.print("Fel kod");
          lcd.setCursor(0,1);
          lcd.print("Forsok igen");
          lcd.setCursor(0,0);
          delay(5000);
      }

      input_password = ""; // clear input password
    } 
    else {
      input_password += key; // append new character to input password string
    }
  }
  a=sr04.Distance();
  if (a <= 10 || digitalRead(lcdknapp) == LOW){ //om avstånd < 10cm
    digitalWrite(LED_BUILTIN, HIGH);
    lcd.backlight();
    lcd.clear();
    lcd.print("valkomen");
  }
  else {
    delay(1000);
    digitalWrite(LED_BUILTIN, LOW);
    lcd.clear();
    lcd.noBacklight();
  }
  if(digitalRead(knapp) == LOW){
    las_upp();
    Serial.println("knapp tryckt");
  }


}
void las_upp() {
  Serial.println("öppnat");
  lcd.clear();
  lcd.print("Ratt kod");
  lcd.setCursor(0,1);
  lcd.print("Valkomen");
  lcd.setCursor(0,0);
  tone(buzzer, NOTE_C5, 200);
  delay(200);
  tone(buzzer, NOTE_D5, 200);
  delay(300);
  myservo.write(120); //lås upp
  delay(olasttid); //vänta
  myservo.write(90); //lås
  lcd.noBacklight();
}


