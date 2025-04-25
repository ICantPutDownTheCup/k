color grey = #717171;
PImage soccer;
boolean soccerOn;

void setup(){
size(800, 800);
background(255);
soccer = loadImage("soccer (2).png");
soccerOn = false;
}

void draw(){
fill(255);

//toolbar
stroke(0);
strokeWeight(1); 
fill(grey);
rect(0, 0, 800, 125);

//soccer button
tactile(0, 0, 100, 100);
soccerOnOff();
fill(255);
rect(690, 10, 100, 100);
image(soccer, 690, 10, 100, 100);
}

void mouseDragged(){
if (soccerOn == false){
//squiggly lines
strokeWeight(5);
stroke(0);
 line(pmouseX, pmouseY, mouseX, mouseY);
}
else{
image(soccer, mouseX, mouseY, 100, 100);
}
}
void mouseReleased() {
  //soccer button
  if (mouseX > 690 && mouseX < 790 && mouseY > 10 && mouseY < 110){
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
