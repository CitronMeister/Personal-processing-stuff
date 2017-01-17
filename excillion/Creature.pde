class creature {
  // vars

  boolean isAlive = false;
  float hunger = 200;
  float size = random(25, 100);
  float evolve = 50;
  float visibility = 200;




  float x = random(0 + size, 1920 - size);
  float y = random(0 + size, 1080 - size);

  void controller() {
    if (hunger > 0) {
      display();
      visibilityRing();
      displayHunger();
      update();
      hunger();
      if (size < evolve) {
      }
    }
  }

  void display() {
    pushStyle();
    sheepOrWolf();

    ellipse(x, y, size, size);
    popStyle();
  }
  void visibilityRing() {
    pushStyle();
    fill(0, 0, 0, 0);
    ellipse(x, y, size + visibility, size + visibility); // den ydre ring er til at visuelt kunne verificere om den rent faktisk kan se så langt
    popStyle();
  }
  void displayHunger() {
    pushStyle();
    textAlign(CENTER);
    fill(0);
    text(int(hunger), x, y + 3); // + 3 fordi det er en 1/4 af tekst størrelsen.
    popStyle();
  }
  void hunger() {
    float scale = 0;
    scale = scale + size/1500;
    hunger = hunger - scale;
    //text(scale, width/2, height/2);
  }
  void update() {
  }
  void sheepOrWolf() {
    if (size > evolve) {
      fill(#FF0000);
    } else {
      fill(#00FF1F);
      
    }
  }
}