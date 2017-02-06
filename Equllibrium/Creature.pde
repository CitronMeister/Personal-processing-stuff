class creature {
  PVector location;

  creature(float cx, float cy) {
    location = new PVector(cx, cy);
  }

  void movement() {
  }
  void display() {
    pushStyle();
    fill(255, 0, 0);
    ellipse(location.x, location.y, 50, 50);
    fill(255, 255, 255);
    // eyes
    ellipse(location.x-10, location.y-22, 15, 15);
    ellipse(location.x+10, location.y-22, 15, 15);
    // pupils
    fill(0, 0, 0);
    ellipse(location.x-10, location.y-27, 8, 8);
    ellipse(location.x+10, location.y-27, 8, 8);
    popStyle();
  }
  
}