class vegetation {
  PVector foodLocation;
  float x;
  float y;
  float foodSize = 10;
  vegetation(float vx, float vy) {
    foodLocation = new PVector(vx, vy);
  }
  void display() {
    pushStyle();
    noStroke();
    fill(0, 150, 0);
    ellipse(foodLocation.x, foodLocation.y, foodSize, foodSize);
    popStyle();
  }
  
  PVector getLoc() {
    return foodLocation;
  }
}