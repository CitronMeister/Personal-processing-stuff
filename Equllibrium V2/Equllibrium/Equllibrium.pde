vegetation v = new vegetation(1,1);
creature c;
PVector mouse;
ArrayList <creature> creature;
ArrayList <vegetation> vegetation;

void setup(){
  creature = new ArrayList<creature>();
  vegetation = new ArrayList<vegetation>();

  fullScreen();
  frameRate(100);  
}

void draw(){
  background(71);
  mouse = new PVector(mouseX, mouseY);
  if(vegetation.size() < 100) {
    grow(1);
  }
  for(creature c: creature){
    c.display();
    c.update();
    c.applyBehaviors(creature);

  }
  for(vegetation v: vegetation) {
    v.display();
  }

}