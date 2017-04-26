vegetation v = new vegetation(1, 1);
creature c;
PVector mouse;
ArrayList <creature> creature;
ArrayList <vegetation> vegetation;
// gamemode decider
int gamemode;
void setup() {
  creature = new ArrayList<creature>();
  vegetation = new ArrayList<vegetation>();
  //setting the gamemode to 1 for the menu
  gamemode = 1;
  fullScreen();
  //FrameRate set to 100 for faster updates.
  frameRate(100);
}

void draw() {
  if (gamemode == 1) {
    hover();
    menu();
  } else if (gamemode == 2) {
    background(71);
    //debug target / also used for placing targets.
    mouse = new PVector(mouseX, mouseY);
    // The growth rate of vegetation
    // if vegetation.size() < x) x being the maximum amount allow on the screen
    if (vegetation.size() < 100) {
      // how many vegetatation are grow per frame default being 1
      grow(1);
    }
    // creature functions.
    for (creature c : creature) {
      c.display();
      // update location and velocity
      c.update();
      //tell the creature which target it should go for.
      c.applyBehaviors(creature);
    }
    // functions that has to run for vegetation.
    for (vegetation v : vegetation) {
      v.display();
    }
  }
}