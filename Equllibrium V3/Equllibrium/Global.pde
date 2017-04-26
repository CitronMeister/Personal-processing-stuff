// Global variable
int alpha1 = 50;
boolean fox3 = false;
//Global function
void mousePressed() {
  if (gamemode == 1) {
    if (mouseX > width/2 - width/8 + width/16 && mouseX < width/2 + width/8 - width/16 && mouseY > height/2 - height/12 + height/24 && mouseY < height/2 + height/12 - height/24) {
      gamemode = 2;
    }
  } else if (gamemode == 2) {
    if (mousePressed) {
      if (mousePressed && fox3 == false) {
        hare.add(new hare(mouseX, mouseY));
      } else if(mousePressed && fox3 == true){
        fox.add(new fox(mouseX, mouseY));
      }
    }
  }
}
void grow(int growSpeed) {
  for (int i = 0; i < growSpeed; i++) {
    vegetation.add(new vegetation(random(width), random(height)));
  }
}
void foodToCreature() {
  if (keyPressed) {
    if (key == 'c') {
      fox3 = false;
    } else if (key == 'f') {
      fox3 = true;
    }
  }
}


void hover() {
  if (mouseX > width/2 - width/8 + width/16 && mouseX < width/2 + width/8 - width/16 && mouseY > height/2 - height/12 + height/24 && mouseY < height/2 + height/12 - height/24) {
    alpha1 = 200;
  } else {
    alpha1 = 50;
  }
}
void newHare() {
    int x;
    int y = 0;
    PVector a;
    PVector b = null;
    for(int i = 0; i < hare.size(); i++){
      a = hare.get(i).getLoc();
      b = a;
    }    
    for (int i = 0; i < hare.size(); i++) {
      x = hare.get(i).foodcount;
      if (x >= 10) {
        x = y;
        hare.add(new hare(b.x, b.y));
        hare.add(new hare(b.x + random(-50, 50), b.y + random(-50, 50)));
        hare.remove(i);
      }
    }
  }
void killFox(){
  int x;
  int y = 0;
  PVector a;
  PVector b = null;
  //for(int i = 0; i < fox.size(); i++){
  //  a = fox.get(i).getLoc();
  //  b = a;
  //}
  for (int i = 0; i < fox.size(); i++){
    x = fox.get(i).hunger;
    if(x < 1){
      fox.remove(i);
    }
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