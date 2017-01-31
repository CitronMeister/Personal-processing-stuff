creature c;
ArrayList<creature> creature;


int debug;

void setup() {
  creature = new ArrayList<creature>();
  size(500, 500);
  noStroke();
  frameRate(100);
  creature.add(new creature(width/2, height/2));
}

void draw() {
  background(71);
  // Alle de ting der skal updates for creature :P
  for (creature c : creature){
    c.display();
  }
  
  // check om det er food eller creature
  foodToCreature();
  text("foodToCreature" + foodToCreature, width/2, height/2);
  
  
  
}