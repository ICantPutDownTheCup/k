color grey = #717171;
color blue = #0038FC;
color green = #00902C;
color red = #E50505;
color yellow = #E5D305;
color orange = #E56A05;
color black = #000000;
color white = #FFFFFF;

color selectedColor;

PImage soccer;
boolean soccerOn;

float sliderX;
float thickness;

void setup() {
  size(800, 800);
  background(255);
  soccer = loadImage("soccer (2).png");
  soccerOn = false;
  sliderX = 310;
}

void draw() {

  println(mouseX, mouseY);

  //toolbar
  stroke(0);
  strokeWeight(1);
  fill(grey);
  rect(0, 0, 800, 125);

  //color selector
  fill(red);
  rect(10, 10, 50, 50);
  fill(blue);
  rect(10, 70, 50, 50);
  fill(green);
  rect(70, 10, 50, 50);
  fill(yellow);
  rect(70, 70, 50, 50);
  fill(orange);
  rect(130, 10, 50, 50);
  fill(black);
  rect(130, 70, 50, 50);
  //soccer button
  tactile(0, 0, 100, 100);
  soccerOnOff();
  fill(255);
  rect(690, 10, 100, 100);
  image(soccer, 690, 10, 100, 100);
  //slider
  line(220, 70, 400, 70);
  circle(sliderX, 70, 40);
  //erase
  rect(630, 10, 50, 50);
  fill(black);
  text("erase", 640, 35);
}

void mouseDragged() {
  if  (mouseY > 125) {
    if (soccerOn == false) {
      //squiggly lines
      strokeWeight(thickness);
      stroke(selectedColor);
      line(pmouseX, pmouseY, mouseX, mouseY);
    } else {
      image(soccer, mouseX, mouseY, 100, 100);
    }
  }
  controlSlider();
}
void mouseReleased() {
  //soccer button
  if (mouseX > 690 && mouseX < 790 && mouseY > 10 && mouseY < 110) {
    soccerOn = !soccerOn;
  }

  //colors
  if (mouseX > 10 && mouseX < 60 && mouseY > 10 && mouseY < 60) {
    selectedColor = red;
  }
  if (mouseX > 10 && mouseX < 60 && mouseY > 70 && mouseY < 120) {
    selectedColor = blue;
  }
  if (mouseX > 70 && mouseX < 120 && mouseY > 10 && mouseY < 60) {
    selectedColor = green;
  }
  if (mouseX > 70 && mouseX < 120 && mouseY > 70 && mouseY < 120) {
    selectedColor = yellow;
  }
  if (mouseX > 130 && mouseX < 180 && mouseY > 10 && mouseY < 60) {
    selectedColor = orange;
  }
  if (mouseX > 130 && mouseX < 180 && mouseY > 70 && mouseY < 120) {
    selectedColor = black;
  }
  //eraser
    if (mouseX > 630 && mouseX < 680 && mouseY > 10 && mouseY < 60) {
    selectedColor = white;
  }
  controlSlider();
}

void tactile(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    fill(255, 255, 0);
  } else {
    fill(255);
  }
}

void soccerOnOff() {
  if (soccerOn == true) {
    stroke(0, 255, 0);
    strokeWeight(5);
  } else {
    stroke(0);
    strokeWeight(1);
  }
}

void controlSlider() {
  if (mouseX > 220 && mouseX < 400 && mouseY < 95) {
    sliderX = mouseX;
  }
  thickness = map(sliderX, 50, 2000, 0, 200);
}
