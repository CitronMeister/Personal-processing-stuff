// Global variable
int alpha1 = 50;
int randomnumber = 1;
//Global function
void mousePressed() {
  if (gamemode == 1) {
    if (mouseX > width/2 - width/8 + width/16 && mouseX < width/2 + width/8 - width/16 && mouseY > height/2 - height/12 + height/24 && mouseY < height/2 + height/12 - height/24) {
      gamemode = 2;
    }
  } else if (gamemode == 2) {
    if (mousePressed) {
      randomnumber++;
      if (mousePressed && randomnumber < 5) {
        creature.add(new hare(mouse));
      } else if(mousePressed && randomnumber > 5){
        creature.add(new fox(mouse));
      }
    }
  }
} 


void grow(int growSpeed) {
  for (int i = 0; i < growSpeed; i++) {
    vegetation.add(new vegetation(random(width), random(height)));
  }
}
void hover() {
  if (mouseX > width/2 - width/8 + width/16 && mouseX < width/2 + width/8 - width/16 && mouseY > height/2 - height/12 + height/24 && mouseY < height/2 + height/12 - height/24) {
    alpha1 = 200;
  } else {
    alpha1 = 50;
  }
} 
void menu() {
  background(80);
  pushStyle();
  noStroke();
  fill(#00BC20, alpha1);
  rect(width/2 - width/8 + width/16, height/2 - height/12 + height/24, width/8, height/12);
  popStyle();

  pushStyle();
  textSize(30);
  textAlign(CENTER);
  text("START", width/2, height/2 + height/90);
  popStyle();
}