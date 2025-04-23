PImage soccer;
boolean soccerOn; //true or false
color skyBlue = #29ABFF;

void setup() {
  size(600, 600);
  background(255);
  soccer = loadImage("soccer (2).png");
  soccerOn = false;
}

void draw() {
  fill(255);
  
  //toolbar
  stroke(0);
  strokeWeight(1);
  fill(skyBlue);
  rect(0, 0, 600, 125);

  //soccer button
  tactile(0, 0, 100, 100);
  soccerOnOff();
  rect(0, 0, 100, 100);
  image(soccer, 0, 0, 100, 100);
}

void mouseDragged() {
  if (soccerOn == false) {
    //squiggly line
    strokeWeight(5);
    stroke(0);
    line(pmouseX, pmouseY, mouseX, mouseY);
  } else {
    //soccer drawing
    image(soccer, mouseX, mouseY, 100, 100);
  }
}

void mouseReleased() {
  //soccer button
  if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100){
  soccerOn = !soccerOn;
  }
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
}

void soccerOnOff() {
  if(soccerOn == true){
  stroke(0, 255, 0);
  strokeWeight(5);
  }else{
   stroke(0);
  strokeWeight(1);
  }
}
