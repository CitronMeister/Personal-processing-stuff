player p = new player();



void setup(){
  size(1280,720);
  pictureManager();
}

void draw(){
  background(50, 120, 200);  
  p.controller();
}