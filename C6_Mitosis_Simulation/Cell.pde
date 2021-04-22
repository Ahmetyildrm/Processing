class Cell {
  PVector pos;
  float r;
  color c;
  float growRate = random(0.01, 0.05);
  int familyNo;
  float xSpeed = random(-3, 3);
  float ySpeed = random(-3, 3);

  Cell(PVector pos, float r, color c, int f) {
    this.pos = pos.copy();
    this.r = r;
    this.c = c;
    this.familyNo = f;
  }

  Cell() {
    this.pos = new PVector(random(width), random(height)) ;
    this.r = 20;
    this.c = color(random(255), random(150), random(255), 100);
  }

  void show() {
    this.r += growRate;
    noStroke();
    fill(this.c);
    ellipse(this.pos.x, this.pos.y, this.r, this.r);
  }

  void move() { 
    //PVector vel = PVector.random2D();
    //this.pos.add(vel);
    this.pos.x += this.xSpeed;
    this.pos.y += this.ySpeed;    
    if (this.pos.x >= width - this.r/2 | this.pos.x <= this.r/2) {
      xSpeed *= -1;
    }
    if (this.pos.y >= height - this.r/2 | this.pos.y <= this.r/2) {
      ySpeed *= -1;
    }
    this.pos.x = constrain(this.pos.x, this.r/2, width - this.r/2);
    this.pos.y = constrain(this.pos.y, this.r/2, height - this.r/2);
  }

  Cell mitosis() {
    float r = red(this.c);
    float g = green(this.c);
    float b = blue(this.c);
    color newColor = color(random(r-15, r+15), random(g-15, g+15), random(b-15, b+15), 100);
    this.pos.x += random(-this.r/2, this.r/2); 
    this.pos.y += random(-this.r/2, this.r/2); 
    Cell cellA = new Cell(this.pos, this.r/2, newColor, this.familyNo);
    return cellA;
  }

  boolean isTouching(Cell c) {    
    return dist(this.pos.x, this.pos.y, c.pos.x, c.pos.y) <= this.r/2 - (this.r/2-c.r/2)/8;
  }

  //void maketangent(Cell c) {
  //  int limit = 0;
  //  while (this.isTouching(c)) {
  //    if (limit > 1000) {
  //      break;
  //    }
  //    if (this.r < c.r) {
  //      this.pos.x += random(-1, +1);
  //      this.pos.y += random(-1, +1);
  //    } else {
  //      c.pos.x += random(-1, +1);
  //      c.pos.y += random(-1, +1);
  //    }
  //  }
  //}
}
