

void mousePressed() {
  if (mousePressed) {
    creature.add(new creature(mouseX, mouseY));
  }
}
void grow(int growSpeed) {
  for (int i = 0; i < growSpeed; i++) {
    vegetation.add(new vegetation(random(width), random(height)));
  }
}