class Bullet {
  float x;
  float y;

  
  Bullet(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void show() {
    fill(50, 150, 255);
    circle(x, y, 7);
    this.y-=5;
  }
  
  
}
