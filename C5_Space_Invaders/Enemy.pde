class Enemy {
  float x = random(width);
  float y = random(height/3);  
  float acc = 0;

  void show() {
    fill(135, 171, 8);
    stroke(0, 255, 0);
    circle(this.x, this.y, 15);
  }

  boolean dead(Bullet b) {
    return dist(this.x, this.y, b.x, b.y) < 15;
  }

  void moveDownwards(float value) {
    acc+=value;
    this.y += acc;
  }
}
