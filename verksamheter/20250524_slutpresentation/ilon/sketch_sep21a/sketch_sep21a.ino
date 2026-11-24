const int pin_joy_x{A0};
const int pin_joy_y{A1}; 
const int pin_joy_sw{A2};     
const int pin_led_r{9};
const int pin_led_g{10};
const int pin_led_b{11}; 

void setup(){
pinMode(pin_joy_x, INPUT);
pinMode(pin_joy_y, INPUT);
pinMode(pin_joy_sw, INPUT);
pinMode(pin_led_r, OUTPUT);
pinMode(pin_led_g, OUTPUT);
pinMode(pin_led_b, OUTPUT);
}

void loop() {
  const int joy_x{analogRead(pin_joy_x)};
  const int joy_y{analogRead(pin_joy_y)};
  const int joy_sw{analogRead(pin_joy_sw)};
  const int ljus_styrka_r{255 - (joy_x / 4)};
  const int ljus_styrka_g{255 - (joy_y / 4)};
  const int ljus_styrka_b{255 - (joy_sw / 4)};
  analogWrite(pin_led_r, ljus_styrka_r);
  analogWrite(pin_led_g, ljus_styrka_g);
  analogWrite(pin_led_b, ljus_styrka_b);
  
}
