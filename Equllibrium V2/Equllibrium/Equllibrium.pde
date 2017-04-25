vegetation v = new vegetation(1,1);
creature c;
PVector mouse;
ArrayList <creature> creature;
ArrayList <vegetation> vegetation;

void setup(){
<<<<<<< HEAD
=======
  creature = new ArrayList<creature>();
  vegetation = new ArrayList<vegetation>();
>>>>>>> origin/master
  fullScreen();
  frameRate(100);  
}

void draw(){
<<<<<<< HEAD
  for (creature c: creature){
    c.display();    
  }
  for (vegetation v: vegetation){
    v.display();
    
=======
  background(71);
  mouse = new PVector(mouseX, mouseY);
  if(vegetation.size() < 100) {
    grow(1);
  }
  for(creature c: creature){
    c.display();
    c.update();
    c.target();
    c.searchFood();
  }
  for(vegetation v: vegetation) {
    v.display();
>>>>>>> origin/master
  }

}