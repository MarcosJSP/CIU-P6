import processing.video.*;

PImage img;
Capture cam;
brightnessTiles brightnessTilesFX;
paintingSquares paintingSquaresFX;
dithering ditheringFX;
int selectedMode;
PFont font;

void setup() {
  size(640, 480, P3D);
  cam = new Capture(this,width,height);
  cam.start();
  img = cam.copy();
  brightnessTilesFX = new brightnessTiles(50);
  paintingSquaresFX = new paintingSquares(2);
  ditheringFX = new dithering();
  selectedMode = 1;
  font = createFont("Arial", 18);
}

void draw() {   
  if (cam.available()) {
    cam.read();
    img = cam.copy();
  }
  
  if (selectedMode == 0) paintingSquaresFX.draw(img);
  else if (selectedMode == 1) brightnessTilesFX.draw(img);
  else if (selectedMode == 2) ditheringFX.draw(img);
  paintHelp();
}

void paintHelp(){
  pushStyle();
  fill(200,50,50);
  hint(DISABLE_DEPTH_TEST);
  textFont(font);
  textAlign(LEFT);
  textSize(18);
  text("Press 1,2,3 to change camera filters",10,25);
  hint(ENABLE_DEPTH_TEST);
  popStyle();
}

void keyPressed(){
  if (key == '1') selectedMode = 0;
  else if (key == '2') selectedMode = 1;
  else if (key == '3') selectedMode = 2;
}
