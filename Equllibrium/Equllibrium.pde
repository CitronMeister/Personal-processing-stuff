menu m;
ArrayList<creature> creature;
ArrayList<vegetation> vegetation;

// Check if sim is live or not
boolean live = false;

// debug int
int debug;

void setup() {
  m = new menu();
  creature = new ArrayList<creature>();
  vegetation = new ArrayList<vegetation>();
  fullScreen(1);
  //size(500, 500);
  noStroke();
  frameRate(100);
  //creature.add(new creature(width/2, height/2));
}

void draw() {
  if (live == false) {
    m.display();
  } else if (live == true) {
    background(71);
    // all the stuff needed to be updated on creature
    for (creature c : creature) {
      c.display();
    }
    // Update vegetation
    for (vegetation v : vegetation) {
      v.display();
    }

    // check if you are spawning vegetation or a creature
    foodToCreature();
    text("foodToCreature" + foodToCreature, width/2, height/2);
  }
}