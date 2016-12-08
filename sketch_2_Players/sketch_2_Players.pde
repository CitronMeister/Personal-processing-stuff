float Player1X = 0;
float Player1Y = 0;
float Player2X = 700;
float Player2Y = 700;
boolean keyz[] = new boolean [8];

void setup(){
  size(1280,720);  
}

void draw(){
  background(71);
  rect(Player1X, Player1Y, 50,50);
  rect(Player2X, Player2Y, 50,50);
  
  //Player 1 Controls
  if(keyz[0]){
    Player1Y = Player1Y - 10;
  }
  if(keyz[1]){
    Player1Y = Player1Y + 10;
  }
  if(keyz[2]){
    Player1X = Player1X - 10;
  }
  if(keyz[3]){
    Player1X = Player1X + 10;
  }
  //Player 2 Controls
  if(keyz[4]){
   Player2Y = Player2Y - 10;
  }
  if(keyz[5]){
   Player2Y = Player2Y + 10;
  }
  if(keyz[6]){
   Player2X = Player2X - 10;
  }
  if(keyz[7]){
   Player2X = Player2X + 10;
  }
}


void keyPressed() {
  if (key == 'w')        keyz[0] = true;
  if (key == 's')        keyz[1] = true;
  if (key == 'a')        keyz[2] = true;
  if (key == 'd')        keyz[3] = true;
  if (keyCode == UP)     keyz[4] = true;
  if (keyCode == DOWN)   keyz[5] = true;
  if (keyCode == LEFT)   keyz[6] = true;
  if (keyCode == RIGHT)  keyz[7] = true;
}
 
void keyReleased() {
  if (key == 'w')        keyz[0] = false;
  if (key == 's')        keyz[1] = false;
  if (key == 'a')        keyz[2] = false;
  if (key == 'd')        keyz[3] = false;
  if (keyCode == UP)     keyz[4] = false;
  if (keyCode == DOWN)   keyz[5] = false;
  if (keyCode == LEFT)   keyz[6] = false;
  if (keyCode == RIGHT)  keyz[7] = false;
}