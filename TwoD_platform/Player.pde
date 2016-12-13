class player {

  //vars
  int playerSide = 1;
  float playerX;
  float playerY;
  player() {
    playerY = height/2;
    playerX = 50;
  }
  void controller() {
    movement();
    attack();
    display();
    debug();
  }

  void movement() {
    if (keyz[0]) {
      playerX = playerX - 10;
      warrior = loadImage("Warrior_2.png");
      playerSide = 2;
    }
    if (keyz[1]) {
      playerX = playerX + 10;
      warrior = loadImage("Warrior_1.png");
      playerSide = 1;
    }
  }

  void attack() {
    if (keyz[2]) {
      if (playerSide == 2) {
        warrior = loadImage("Warrior_4.png");
      }
      if (playerSide == 1){
        warrior = loadImage("Warrior_3.png");
      }
    }
  }

  void display() {
    image(warrior, playerX, playerY);
  }

  void debug() {
    text(playerSide, width/2, height/2);
  }
}