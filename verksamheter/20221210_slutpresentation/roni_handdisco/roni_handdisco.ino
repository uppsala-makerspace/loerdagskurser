const int led_stift_rod = 13;
const int led_stift_gron = 12;
const int led_stift_blo = 13;
const int knapp_stift = 3;
int vilken_led_pa = 1;
const int vantetid = 200;

void setup()
{
  Serial.begin(9600);
pinMode(led_stift_rod, OUTPUT);
pinMode(led_stift_gron, OUTPUT);
pinMode(led_stift_blo, OUTPUT);
pinMode(knapp_stift, INPUT);

 

}
void loop()
{

 if (digitalRead(knapp_stift)==HIGH)
 
{

 Serial.println("Knapp hög");
 digitalWrite(led_stift_rod,HIGH);
 digitalWrite(led_stift_gron,LOW);
 digitalWrite(led_stift_blo,HIGH);
 
}
 if (digitalRead(knapp_stift)==LOW)
 

{
 Serial.println("Knapp låg");
 digitalWrite(led_stift_rod,LOW);
 digitalWrite(led_stift_gron,HIGH);
 digitalWrite(led_stift_blo,LOW);
 
}

 Serial.println("Knapp hög");
 digitalWrite(led_stift_rod,HIGH);
 digitalWrite(led_stift_gron,LOW);
 digitalWrite(led_stift_blo,HIGH);

 delay(vantetid); 
}
 
