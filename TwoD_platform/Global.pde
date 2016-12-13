// vars
boolean keyz[] = new boolean [3];





// images
PImage warrior;



// func
void pictureManager(){
  warrior = loadImage("Warrior_1.png");
  warrior = loadImage("Warrior_2.png");
  warrior = loadImage("Warrior_3.png");
  warrior = loadImage("Warrior_4.png");
}

void soundManager(){
  
}


// controller
void keyPressed() {
  if (key == 'a')        keyz[0] = true;
  if (key == 'd')        keyz[1] = true;
  if (key == ' ')        keyz[2] = true;
}
 
void keyReleased() {
  if (key == 'a')        keyz[0] = false;
  if (key == 'd')        keyz[1] = false;
  if (key == ' ')        keyz[2] = false;
}