

class lift{
  int X,Y;
  lift(int newX,int newY){
    X=newX;
    Y=newY;
  }
  /*void scriptLift(){
  }*/
  void drawLift(){
    //translate(X,Y);
    loadPixels();/*
    color[] pixel = pixels;
    for(int i=0;i<250;i++){
      for(int i2=0;i2<250;i2++){
        int x = ((mouseX-125)+(i));
        int y =((mouseY-125)+(floor(i2)));
        if((x<1000&&x>=0)&&(y<1000&&y>=0)){
          set(i+X,i2+Y,pixel[(x+(y*1000))]);
        }
        println("y+"+i2);
        println("x+"+i);
      }
    }*/
    strokeWeight(0);
    fill(204);
    rect(X+1,Y+1,250,250);
    copy(mouseX-125,mouseY-125,250,250,X,Y,250,250);
    strokeWeight(1);
    //translate(-X,-Y);
  }
}
