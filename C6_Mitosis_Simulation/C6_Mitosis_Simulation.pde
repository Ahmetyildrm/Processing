ArrayList<Cell> cells;
Cell c;
void setup() {
  size(1900, 900);  
  cells = new ArrayList<Cell>();
  for (int i=0; i<70; i++) {
    cells.add(new Cell(new PVector(random(width), random(height)), 50, color(random(255), random(255), random(255), 100), i+1));
  }
}

void mousePressed() {
  for (Cell c : cells) {
    if (dist(mouseX, mouseY, c.pos.x, c.pos.y) <= c.r/2) {
      cells.add(c.mitosis());
      cells.add(c.mitosis());
      cells.remove(c);
      break;
    }
  }
}

void draw() {
  background(51);
  println(cells.size());
  boolean br = false;
  float largest = -1;
  float largestNo = -1;
  
  for (Cell c1 : cells) {
    for (Cell c2 : cells) {
      if (c1.r != c2.r) {
        if (c1.isTouching(c2) & c1.familyNo != c2.familyNo) {
          if (c1.r > c2.r) {            
            c1.r += c2.r/2;
            c1.xSpeed += c2.xSpeed * c2.r/c1.r;
            c1.ySpeed += c2.ySpeed * c2.r/c1.r;
            cells.remove(c2);
            br = true;
            cells.remove(c2);
            break;
          } else if (c2.r > c1.r) {            
            c2.r += c1.r/2;
            c2.xSpeed += c1.xSpeed * c1.r/c2.r;
            c2.ySpeed += c1.ySpeed * c1.r/c2.r;
            cells.remove(c1);
            br = true;
            break;
          }
        }
      }
    }
    if(br){
      break;
    }
  }

  for (Cell c : cells) {    
    c.move();
    c.show();
    float txtsize = map(c.r, 50, height, 15, 25);
    textSize(txtsize);
    textAlign(CENTER);
    fill(255);
    text(c.familyNo, c.pos.x, c.pos.y);
    if(c.r > largest){
      largest = c.r;
      largestNo = c.familyNo;
    }
  }
  
  textSize(40);
  textAlign(LEFT);
  fill(0, 255, 0);
  text("Largest: " + int(largestNo), 15, 50);
  
  for (Cell c : cells) {
    if (c.r >= height) {
      cells.add(c.mitosis());
      cells.add(c.mitosis());
      cells.remove(c);
      break;
    }
  }
}
