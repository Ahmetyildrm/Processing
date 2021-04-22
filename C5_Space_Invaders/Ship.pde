class Ship {
  float x = width/2;
  float speed = 0;

  void show() {
    this.x+=this.speed;
    if (this.x > width) {
      this.x = -20;
    }
    if (this.x < -20) {
      this.x = width;
    }
    fill(0, 0, 255);
    rect(this.x, height - 25, 20, 20);  
    fill(255, 0, 0);
    triangle(this.x, height-25, this.x+20, height-25, this.x+10, height-40);
  }

  void right() {
    this.speed = 1;
  }

  void left() {
    this.speed = -1;
  }

  Bullet fireBullet() {
    Bullet bullet = new Bullet(this.x+10, height - 40.0);
    return bullet;
  }
}
