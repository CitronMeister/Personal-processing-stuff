slider s = new slider();

// box 1 stuff
float box1_x = 325;
float box1_y = 100;
float box1_height = 25;
float box1_length = 150;

// box 2 stuff
float box2_x = 330;
float box2_y = 75;
float box2_height = 75;
float box2_length = 25;
int checker = 255;
boolean sliderActive = false;

void setup() {
  size(800, 800);
  noStroke();
}


void draw() {
  background(71);
  s.display();
}



class slider {



  void display() {
    // box 1 aka the slider :P
    pushStyle();
    fill(200);
    rect(box1_x, box1_y, box1_length, box1_height);
    popStyle();


    pushStyle();
    fill(checker, 0, 0, 50);
    rect(box2_x, box2_y, box2_length, box2_height);
    popStyle();
    
    while(sliderActive){
      
      
    
    }
    text(int(sliderActive), width/2 , height/2);
}
  
}
void mousePressed() {
  if (mouseX > box2_x && mouseX < box2_x + box2_length && mouseY > box2_y && mouseY < box2_height + box2_y && mouseX < box1_length + box1_x && mouseX > box1_x) {
    box2_x = mouseX - box2_length/2;
    checker = 0;
    
    
  }
}/*
void mouseReleased(){
  sliderActive = false;
}*/