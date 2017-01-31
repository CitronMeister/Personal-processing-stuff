class creature {
  float x = 0;
  float y = 0;

  creature(float cx, float cy) {
    x = cx;
    y = cy;
  }
  void movement() {
  }
  void display() {
    ellipse(x, y, 50, 50);
  }
}