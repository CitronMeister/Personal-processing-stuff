menu m;
vegetation v = new vegetation(100, 100);
ArrayList<creature> creature;
ArrayList<vegetation> vegetation;

// PVector i created to make sure the creatures has something to chase.
PVector target;

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
    // target i created for the creatures to chase until i make them chase the vegetation and eachother.
    target = new PVector(mouseX, mouseY);
    background(71);
    // all the stuff needed to be updated on creature
    for (creature c : creature) {
      c.display();
      c.update();
      c.target(target);
      //c.distance();
    }
    // Update vegetation
    if (vegetation.size() < 100) {
      grow(1);
    }
    for (vegetation v : vegetation) {
      v.display();
    }
    // check if you are spawning vegetation or a creature
    foodToCreature();
    text("foodToCreature" + foodToCreature, width/2, height/2);
  }
}