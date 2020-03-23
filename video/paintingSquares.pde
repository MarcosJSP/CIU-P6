class paintingSquares {
  int squareSize = 2;
  
  paintingSquares(int squareSize){
    this.squareSize = squareSize;
  }
  
  void draw(PImage img){
    img.loadPixels();
    noStroke();
    
    for (int i=0; i < 10000; i++) {
      int x = int(random(img.width));
      int y = int(random(img.height));
      int index = x + y*img.width;

      float r = red(img.pixels[index]);
      float g = green(img.pixels[index]);
      float b = blue(img.pixels[index]);
      
      fill(r, g, b, 100);
      rect(x, y, squareSize, squareSize);
    }
  }
  
}
