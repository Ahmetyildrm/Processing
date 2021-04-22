float wind = 0;
class Drop {
  float x = random(-200, width + 200);
  float y = random(-200, -50);
  float z = random(0, 15);
  float len = map(z, 0, 20, 10, 20);
  float dropSpeed = map(z, 0, 20, 5, 10);
  float force = 0;

  void fall() {
    y += dropSpeed;
    this.force += wind;
    this.x += this.force;
    if (y > height) {
      this.y = random(-200, -50);
      this.z = random(0, 15);
      this.dropSpeed = map(z, 0, 20, 5, 10);
      this.force = 0;
      this.x = random(-200, width + 200);
    }
  }

  void show() {
    float thick = map(z, 0, 20, 1, 3);
    strokeWeight(thick);
    stroke(191, 244, 247);
    line(this.x - this.force, this.y, this.x, this.y + this.len);
    
    // -ARKADA KALAN SİLİK İZ HİSSİ-
    //stroke(221, 189, 252);
    //line(this.x - this.force, this.y-15, this.x, this.y);
    
    //stroke(223, 213, 232);
    //line(this.x - this.force, this.y-20, this.x, this.y-15);
    
    // DAMLANIN UCUNDAKİ OVALLİK
    fill(140, 223, 232);
    noStroke();
    ellipse(this.x, this.y + this.len, 3, 3);
  }
}
