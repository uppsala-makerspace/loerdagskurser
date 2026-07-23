

int lrfx = 400;
PImage lrMask;
PImage heMask;
PGraphics lrVid;
PGraphics heVid;

void setup(){
  size(800,800);
  heMask = createImage(800,800,ALPHA);
  lrMask = createImage(800,800,ALPHA);
  lrMask.loadPixels();
  for (int i = 0; i < lrMask.pixels.length; i++) {
    lrMask.pixels[i] = color(0); 
    if(i%800 >= lrfx && i%800 < lrfx + 200)
      if((floor(i/800) >= 000 && floor(i/800) < 200) || (floor(i/800) >= 400 && floor(i/800) < 600))
        lrMask.pixels[i] = color(0, 90, 102);
    
  }
  lrMask.updatePixels();
  lrVid = createGraphics(800,800);
  heVid = createGraphics(800,800);
  background(0,255,0);
}

void draw(){
  
colorMode(HSB, 100);
stroke(frameCount%100, 100, 100);
for(int i = 0; i < 400; i++) { stroke((frameCount+i/10f)%100, 100, 100); line(200, 400+i, 400, 400+i); }
stroke(0);
colorMode(RGB, 255);


  heVid.beginDraw();
  heVid.noStroke();
  heVid.fill(0,25);
  heVid.rect(0,0,800,800);
  heVid.rectMode(CENTER);
  heVid.stroke(255);
  heVid.strokeWeight(8);
  heVid.noFill();
  heVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), sin(frameCount/32f) * 300f + 400f);
  heVid.rotate(frameCount/32f);
  heVid.rect(0,0,90,90);
  heVid.rotate(-frameCount/32f);
  heVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( sin(frameCount/32f) * 300f + 400f));
  heVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), -sin(frameCount/32f) * 300f + 400f);
  heVid.rotate(frameCount/32f);
  heVid.triangle(-30f * 1.5f, -23f * 1.5f, 0, 29f * 1.5f, 30f * 1.5f, -23f * 1.5f);
  heVid.rotate(-frameCount/32f);
  heVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( -sin(frameCount/32f) * 300f + 400f));
  lrVid.fill(0);
  lrVid.noStroke();
  heVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), sin(frameCount/32f) * 300f + 400f);
  heVid.rotate(frameCount/32f);
  heVid.rect(0,0,90,90);
  heVid.rotate(-frameCount/32f);
  heVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( sin(frameCount/32f) * 300f + 400f));
  heVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), -sin(frameCount/32f) * 300f + 400f);
  heVid.rotate(frameCount/32f);
  heVid.triangle(-30f * 1.5f, -23f * 1.5f, 0, 29f * 1.5f, 30f * 1.5f, -23f * 1.5f);
  heVid.rotate(-frameCount/32f);
  heVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( -sin(frameCount/32f) * 300f + 400f));
  heVid.fill(0);
  heVid.stroke(0);
  heVid.noStroke();
  heVid.rectMode(CORNER);
  heVid.rect(000,000,800,400);
  heVid.rect(000,400,200,400);
  heVid.rect(400,400,400,400);
  heVid.endDraw();
  heMask = heVid.copy();

  heVid.beginDraw();
  heVid.noStroke();
  heVid.fill(204,25);
  heVid.background(0);
  heVid.rectMode(CENTER);
  heVid.stroke(255);
  heVid.strokeWeight(8);
  heVid.fill(255);
  heVid.colorMode(HSB, 100);
  heVid.stroke((frameCount + 50)%100, 100, 100);
  for(int i = 0; i < 400; i++) { heVid.stroke((frameCount+i/10f+50)%100, 100, 100); heVid.line(200, 400+i, 400, 400+i); }
  heVid.stroke(0);
  heVid.colorMode(RGB, 255);
  heVid.fill(255);
  heVid.stroke(0);
  heVid.rectMode(CORNER);
  heVid.endDraw();
  heVid.mask(heMask);
  image(heVid,0,0); heVid.beginDraw();


  lrVid.beginDraw();
  lrVid.noStroke();
  lrVid.fill(204,25);
  lrVid.rect(0,0,800,800);
  lrVid.rectMode(CENTER);
  lrVid.stroke(255);
  lrVid.strokeWeight(8);
  lrVid.noFill();
  lrVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), sin(frameCount/32f) * 300f + 400f);
  lrVid.rotate(frameCount/32f);
  lrVid.rect(0,0,90,90);
  lrVid.rotate(-frameCount/32f);
  lrVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( sin(frameCount/32f) * 300f + 400f));
  lrVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), -sin(frameCount/32f) * 300f + 400f);
  lrVid.rotate(frameCount/32f);
  lrVid.triangle(-30f * 1.5f, -23f * 1.5f, 0, 29f * 1.5f, 30f * 1.5f, -23f * 1.5f);
  lrVid.rotate(-frameCount/32f);
  lrVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( -sin(frameCount/32f) * 300f + 400f));
  lrVid.fill(0);
  lrVid.noStroke();
  lrVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), sin(frameCount/32f) * 300f + 400f);
  lrVid.rotate(frameCount/32f);
  lrVid.rect(0,0,90,90);
  lrVid.rotate(-frameCount/32f);
  lrVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( sin(frameCount/32f) * 300f + 400f));
  lrVid.translate(lrfx + 100 + (sin(frameCount/32f) * 100f), -sin(frameCount/32f) * 300f + 400f);
  lrVid.rotate(frameCount/32f);
  lrVid.triangle(-30f * 1.5f, -23f * 1.5f, 0, 29f * 1.5f, 30f * 1.5f, -23f * 1.5f);
  lrVid.rotate(-frameCount/32f);
  lrVid.translate(-lrfx - 100 - (sin(frameCount/32f) * 100f),-( -sin(frameCount/32f) * 300f + 400f));
  lrVid.fill(255);
  lrVid.stroke(0);
  lrVid.rectMode(CORNER);
  lrVid.endDraw();
  lrVid.mask(lrMask);
  image(lrVid,0,0);
  //image(lrMask,0,0);
  
}
