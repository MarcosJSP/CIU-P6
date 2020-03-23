class brightnessTiles {
  int tileGap;
  int tileAmount;

  brightnessTiles(int tileAmount) {
    this.tileAmount = tileAmount;
    this.tileGap = width/tileAmount; 
  }
  
  void draw(PImage img) {
    background(0);
    pushMatrix();
    translate(tileGap/2, tileGap/2, 0);
    noStroke();
    for (int x = 0; x < width; x+=tileGap) {
      for (int y = 0; y < height; y+=tileGap) {
        //int index = x + y * width;
        color pixel = img.get(x, y);
        float r = red(pixel);
        float g = green(pixel);
        float b = blue(pixel);
        float tileSize = map(brightness(pixel), 0, 255, -tileGap, 40);
        fill(r, g, b);
        ellipse(x, y, tileSize, tileSize);
      }
    }
    popMatrix();
  }
}
