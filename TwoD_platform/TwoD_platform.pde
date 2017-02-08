player p = new player();
ui ui = new ui();


void setup(){
  size(1280,720);
  pictureManager();
}

void draw(){
  background(50, 120, 200);  
  p.controller();
  ui.controller();
}