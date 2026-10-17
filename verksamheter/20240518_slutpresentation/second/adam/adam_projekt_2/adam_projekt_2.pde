float x= 100;
float zig= 1;
float r = 109;
float g = 0;
float b = 200;
float y = 0;
void setup ()
{size(500,500);
background(3,3,3);
}
void draw()
 {
y=y+1;
  stroke(r,g,b);
  fill(random(200,170));
fill(0,95,255); 
quad(y,x,x,200,200,x,x,y);
  x=x+ +zig;
  
  if (x > zig + 450)
  {
    x=-50; 
    r = random(255);
g= random(255);
b=random(255); }
}
