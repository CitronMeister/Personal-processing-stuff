creature c = new creature();
vegitation v = new vegitation();


void setup(){
  fullScreen(2);
}

void draw(){
  background(71); 
  c.controller();
  spawn();
  

}