#include <Adafruit_NeoPixel.h>

#define NUMPIXELS 72
#define DELAYVAL_5 200

#define LONGBOW_LENGTH (NUMPIXELS / 2)
#define DELAYVAL_LONGBOW 20

Adafruit_NeoPixel pixels(NUMPIXELS);

const uint8_t colors5[5][3] = {
  {0,0,0},
  {0,75,0},
  {75,0,0},
  {0,0,75},
  {75,0,75},
};

uint8_t longbow_colors[LONGBOW_LENGTH][3];

void setup() {
  pixels.begin();

  for(uint8_t i=0; i<LONGBOW_LENGTH; i++) {
    uint8_t* c = longbow_colors[i];
    rainbow_color(c, i, LONGBOW_LENGTH);
  }
}

// Generate the color of the rainbow at position i of length. Store in c.
// Adapted from https://github.com/Inseckto/HSV-to-RGB/blob/master/HSV2RGB.c
void rainbow_color(uint8_t* c, uint8_t index, uint8_t length) {
	float r=0, g=0, b=0;
	
	float h = (((float)index) / (float)length);// HUE / 360;
	float s = 1;// S / 100;
	float v = 1;// V / 100;
	
	int i = floor(h * 6);
	float f = h * 6 - i;
	float p = v * (1 - s);
	float q = v * (1 - f * s);
	float t = v * (1 - (1 - f) * s);
	
	switch (i % 6) {
		case 0: r = v, g = t, b = p; break;
		case 1: r = q, g = v, b = p; break;
		case 2: r = p, g = v, b = t; break;
		case 3: r = p, g = q, b = v; break;
		case 4: r = t, g = p, b = v; break;
		case 5: r = v, g = p, b = q; break;
	}
	
	c[0] = r * 255;
	c[1] = g * 255;
	c[2] = b * 255;
}

// Move 5 colors along the strip.
void loop_colors5() {
  static int offset = 0;
  for(int i=0; i<NUMPIXELS; i++) {
    const uint8_t* c = colors5[(i+offset) % 5];
    pixels.setPixelColor(i, pixels.Color(c[0], c[1], c[2]));
  }
  pixels.show();
  delay(DELAYVAL_5);
  offset += 1;
}

// Move a rainbow along the strip.
void loop_longbow() {
  static int offset = 0;
  for(int i=0; i<NUMPIXELS; i++) {
    const uint8_t* c = longbow_colors[(i+offset) % LONGBOW_LENGTH];
    pixels.setPixelColor(i, pixels.Color(c[0], c[1], c[2]));
  }
  pixels.show();
  delay(DELAYVAL_LONGBOW);
  offset += 1;
}

void loop_identical_colors() {
  static const uint8_t colors[7][3] = {
    {0,0,0},
    {75,0,0},
    {0,75,0},
    {0,0,75},
    {75,0,75},
    {75,75,75},
    {0,0,0},
  };
  for(int index=0; index<7; index++) {
    for(int i=0; i<NUMPIXELS; i++) {
      const uint8_t* c = colors[index];
      pixels.setPixelColor(i, pixels.Color(c[0], c[1], c[2]));
    }
    pixels.show();
    delay(500);
  }
}

void loop_combo() {
  for(int i=0; i<NUMPIXELS*4; i++) {
    loop_longbow();
  }
  loop_identical_colors();
}

void loop() {
  //loop_colors5();
  //loop_longbow();
  loop_combo();
}
