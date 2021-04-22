class Star {
  float x;
  float y;
  float z;
  color c;
  float pz;
  
  Star() {
    x = random(-width, width);
    y = random(-height, height);
    z = random(width);
    c = color(100, 100, 100);
  }

  void update() {
    z-=speed;
    c = color(red(c)+10, green(c)+10, blue(c)+10);
    if (z<1) {
      x = random(-width, width);
      y = random(-height, height);
      z = random(width);
      c = color(100, 100, 100);
    }
  }

  void show() {
    fill(c); 
    noStroke();

    float sx = map(x/z, 0, 1, 0, width); // Oranlama yapıyor, x/z nin 0-1 arasındaki değerini 0-100 arasına oranlıyor
    float sy = map(y/z, 0, 1, 0, height);
    
    float r = map(z, 0, width, 25, 0);
    ellipse(sx, sy, r, r);
  }
}  
