// vars 
boolean foodToCreature = false;

// func
void mousePressed() {
  //Adding more creatures!
  if (foodToCreature == false) {
    pushStyle();
    fill(0, 255, 0);
    creature.add(new creature(mouseX, mouseY));
    popStyle();
  }
  //Adding more food
  if (foodToCreature == true) {
    //bare en test pt
    pushStyle();
    fill(0, 0, 255);
    creature.add(new creature(mouseX, mouseY));
    popStyle();
  }
}
void foodToCreature() {
  if (keyPressed) {
    if (key == 'c') {
      foodToCreature = false;
    } else if (key == 'f') {
      foodToCreature = true;
    }
  }
}