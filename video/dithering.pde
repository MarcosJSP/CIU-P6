class dithering {
  private int factor;

  dithering() {
    this.factor = 2;
  }

  int index(int x, int y) {
    return x + y * width;
  }

  private class myColor {

    float r, g, b;

    myColor(float r, float g, float b) {
      this.r = r;
      this.g = g;
      this.b = b;
    }

    myColor(color c) {
      this.r = red(c);
      this.g = green(c);
      this.b = blue(c);
    }

    myColor clone() {
      return new myColor(r, g, b);
    }

    myColor cTimes(float n) {
      return new myColor(r * n, g * n, b * n);
    }

    myColor cRound() {
      return new myColor(round(r), round(g), round(b));
    }

    myColor cAdd(myColor c2) {
      return new myColor(r + c2.r, g + c2.g, b + c2.b);
    }

    myColor cMinus(myColor c2) {
      return new myColor(r - c2.r, g - c2.g, b - c2.b);
    }

    color toColor() {
      return color(r, g, b);
    }
  }
  void draw(PImage img) {
    img.filter(GRAY);
    img.loadPixels();
    for (int y=0; y < img.height-1; y++) {
      for (int x=1; x < img.width-1; x++) {
        color p = img.pixels[index(x, y)];

        myColor c = new myColor(red(p), green(p), blue(p));
        myColor newC = c.cTimes(factor/255f).cRound().cTimes(255/factor);
        myColor quant_error = c.cMinus(newC);

        img.pixels[index(x, y)] = newC.toColor();            
        img.pixels[index(x+1, y  )] = (new myColor (img.pixels[index(x+1, y  )])).cAdd(quant_error.cTimes(7/16f)).toColor();
        img.pixels[index(x-1, y+1)] = (new myColor (img.pixels[index(x-1, y+1)])).cAdd(quant_error.cTimes(3/16f)).toColor();
        img.pixels[index(x, y+1)] = (new myColor (img.pixels[index(x, y+1)])).cAdd(quant_error.cTimes(5/16f)).toColor();
        img.pixels[index(x+1, y+1)] = (new myColor (img.pixels[index(x+1, y+1)])).cAdd(quant_error.cTimes(1/16f)).toColor();
      }
    }
    img.updatePixels();  
    image(img, 0, 0);
  }
}
