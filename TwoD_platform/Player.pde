class player {

  //vars
  int playerSide = 1;
  float playerX;
  float playerY;
  float playerHeight;
  float playerWidth;
  player() {
    playerHeight = 52;
    playerWidth = 48;
    playerY = 460;
    playerX = 640;
    
  }
  void controller() {
    movement();
    attack();
    display();
    debug();
  }
  
  boolean keyz[] = new boolean [3];

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
  

  void movement() {
    if (keyz[0]) {
      playerX = playerX - 10;
      warrior = loadImage("Warrior_2.png");
      playerSide = 2;
      playerHeight = 52;
    }
    if (keyz[1]) {
      playerX = playerX + 10;
      warrior = loadImage("Warrior_1.png");
      playerSide = 1;
      playerHeight = 52;
    }
  }

  void attack() {
    if (keyz[2]) {
      if (playerSide == 2) {
        warrior = loadImage("Warrior_4.png");
        playerHeight = 48; 
      }
      if (playerSide == 1){
        warrior = loadImage("Warrior_3.png");
      }
    }
  }

  void display() {
    image(warrior, playerX, playerY - playerHeight);
  }

  void debug() {
    text(playerX, width/2, height/2);
  }
}