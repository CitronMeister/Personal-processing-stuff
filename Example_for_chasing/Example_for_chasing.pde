// extended and modified from dan shiffman's natureofcode examples

// A list of creatures
ArrayList<Creature> creatures;


boolean creatingWall = false;
boolean wallBuildingMode = false;
int gridSnap = 32;
PFont myFont;

int PREDATOR = 1;
int PREY = 2;

float predator_radius = 16;
float prey_radius = 5;

float LARGENUM = 1000000000000000.0;

void setup() {
  size(800, 600);

  myFont = createFont("Courier New", 12);
  textFont(myFont);


  // We are now making random creatures and storing them in an ArrayList
  creatures = new ArrayList<Creature>();


  // big creature
  for (int i = 0; i < 16; i++) {
    creatures.add(new Creature(random(gridSnap, width - gridSnap), random(gridSnap, height-gridSnap), PREDATOR, predator_radius) );
  }

  // prey creature
  for (int i = 0; i < 16; i++) {
    addRandomPrey();
  }
}

void draw() {
  background(255);
  Creature c;
  for (int i = 0; i < creatures.size (); i++) {
    c = creatures.get(i);
    // Path following and separation are worked on in this function
    c.applyBehaviors(creatures);
    // Call the generic run method (update, borders, display, etc.)
    c.update();
    c.display();
    // if creature falls outside then kill it
    /*   PVector theLoc = c.getLoc();
     if ( (theLoc.x < gridSnap) || (theLoc.x > (width-gridSnap)) || (theLoc.y < gridSnap) || (theLoc.y > (height-gridSnap)) ) {
     creatures.remove(i);
     }*/
  }



  if (mousePressed) {
    if (wallBuildingMode == false) {
      addTarget(mouseX, mouseY);
    } 
  }
}

// extended and modified from dan shiffman's natureofcode examples

void addRandomPrey() {
  creatures.add(new Creature(random(gridSnap, width - gridSnap), random(gridSnap, height-gridSnap), PREY, prey_radius) );
}

void addTarget(float x, float y) {
  if ( detectTarget(x, y) == false ) { // dont put target on top of another target
    creatures.add(new Creature(x, y, PREY, prey_radius) );
  }
}


boolean detectTarget(float x, float y) {
  float desiredseparation, xd, yd;
  PVector theTarget;
  // For every boid in the system, check if it's too close
  for (int i = 0; i < creatures.size (); i++) {
    theTarget = creatures.get(i).getLoc();
    desiredseparation = prey_radius*prey_radius;
    xd = (x - theTarget.x);
    yd = (y - theTarget.y);
    if ((xd*xd+yd*yd) <= desiredseparation) { // target has been eaten
      return true;
    }
  }
  return false;
}