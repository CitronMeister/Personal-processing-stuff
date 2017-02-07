Vehicle v;
PVector target;

void setup(){
  v = new Vehicle(100, 100);
  size(500, 500);
}
void draw(){
  background(71);
  target = new PVector(mouseX, mouseY);
  v.update();
  v.display();
  
  v.seek(target);
}