const int stift_bla = 9;
const int stift_gron = 10;
const int stift_rod = 11;
const int vantetid1 = 1000;
const int vantetid = 5;

void setup() 
{
  pinMode(stift_rod , OUTPUT);
  pinMode(stift_gron, OUTPUT);
  pinMode(stift_bla, OUTPUT);
}

void loop()
{
 for (int i=0; i<256; ++i)
 {
   analogWrite(stift_rod, i);
   analogWrite(stift_gron, 0);
   analogWrite(stift_bla, 0);
   delay(vantetid);
 }
   delay(vantetid1);

 for (int i=0; i<256; ++i)
 {
   analogWrite(stift_gron, i);
  delay(vantetid);
 }
 for (int i=0; i<256; ++i)
 {
  analogWrite(stift_rod, 256 - i);
  delay(vantetid);
 }
 for (int i=0; i<256; ++i)
 {
  analogWrite(stift_bla, i);
   delay(vantetid);
 }
for (int i=0; i<256; ++i)
 {
  analogWrite(stift_gron, 256 - i);
   delay(vantetid);
 }
 for (int i=0; i<256; ++i)
 {
  analogWrite(stift_rod, 255);
   delay(vantetid);
 }
}
 