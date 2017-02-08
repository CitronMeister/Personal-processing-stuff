// Currently vegetation is only for show. Creatures wont chase it just yet.
class vegetation {
  PVector foodLocation;
  float x;
  float y;
  float foodsize = 10;
  vegetation(float vx, float vy) {
    foodLocation = new PVector(vx, vy);
  }
  void display() {
    pushStyle();
    fill(0, 150, 0);
    ellipse(foodLocation.x, foodLocation.y, foodsize, foodsize);
    fill(255, 255, 255);
    popStyle();
  }
}