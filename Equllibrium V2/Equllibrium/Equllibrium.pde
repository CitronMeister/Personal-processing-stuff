vegetation v;
creature c;
ArrayList <creature> creature;
ArrayList <vegetation> vegetation;
void setup(){
  fullScreen();
  
}

void draw(){
  for (creature c: creature){
    c.display();    
  }
  for (vegetation v: vegetation){
    v.display();
    
  }

}