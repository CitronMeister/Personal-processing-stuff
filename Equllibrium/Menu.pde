class menu {
  // Alpha
  int alpha = 100;
  // setttings for The hover on Start
  int SthoverAlpha = 150;
  float StButtonSizeX = width/4;
  float StButtonSizeY = height/10;
  float StButtonSizeXHover = width/4 + width/32;
  float StButtonSizeYHover = height/10 + height/80;

  // setttings for The hover on exit
  int ExhoverAlpha = 150;
  float ExButtonSizeX = width/4;
  float ExButtonSizeY = height/10;
  float ExButtonSizeXHover = width/4 + width/32;
  float ExButtonSizeYHover = height/10 + height/80;

  void display() {
    background(255);

    // Start Button
    // Hover checker for Start button
    if (mouseX >= width/2 - width/8 && mouseX <= width/2 - width/8 + width/4 && // mouseX
      mouseY >= height/2-height/20 && mouseY <= height/2-height/20 + height/10) { // mouseY 
      SthoverAlpha = 150;
      StButtonSizeX = StButtonSizeXHover;
      StButtonSizeY = StButtonSizeYHover;
    } else {
      SthoverAlpha = 100;
      StButtonSizeX = width/4;
      StButtonSizeY = height/10;
    }

    // Drawing the Start Button
    push();
    fill(0, 150, 0, SthoverAlpha);
    rect(width/2 - StButtonSizeX/2, height/2 - StButtonSizeY/2, StButtonSizeX, StButtonSizeY);
    pop();
    push();
    fill(255);
    textSize(50);
    textAlign(CENTER, BOTTOM);
    text("Start Simulation", width/2, height/2 + 25);
    pop();

    //Starting sim
    if (mousePressed) {
      if (mouseX >= width/2 - width/8 && mouseX <= width/2 - width/8 + width/4 && mouseY >= height/2-height/20 && mouseY <= height/2-height/20 + height/10) {
        live = true;
      }
    }
  }
}