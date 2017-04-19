vegetation v;
creature c;
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
  for(creature c: creature){
    c.display();
  }
  for(vegetation v: vegetation) {
    v.display();
  }

}