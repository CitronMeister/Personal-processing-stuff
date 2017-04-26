hare h;
import processing.sound.*;
vegetation v = new vegetation(1, 1);
// PVector for testing
PVector mouse;
ArrayList <hare> hare;
ArrayList <vegetation> vegetation;
ArrayList <fox> fox;
// gamemode decider
int gamemode;

//soundfiles
SoundFile music;
void setup() {
  music = new SoundFile(this, "music.mp3");
  music.loop();
  hare = new ArrayList<hare>();
  vegetation = new ArrayList<vegetation>();
  fox = new ArrayList<fox>();
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
    newHare();
    killFox();
    
    for (hare h : hare) {
      h.display();
      // update location and velocity
      h.update();
      //tell the creature which target it should go for.
      h.applyBehaviors(hare);
      //h.evolve();
      
    }
    for (fox f: fox){
      f.display();
      f.update();
      f.applyBehaviors(fox);
      f.hunger();
    }
    // functions that has to run for vegetation.
    for (vegetation v : vegetation) {
      v.display();
    }
  }
}