Snake s;
float scl = 20;
Food f;

void setup() {
  size(600, 600);
  s = new Snake();
  f = new Food(110, 130);
  frameRate(10);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      s.dir(0, -1);
    } else if (keyCode == DOWN) {
      s.dir(0, 1);
    } else if (keyCode == RIGHT) {
      s.dir(1, 0);
    } else if (keyCode == LEFT) {
      s.dir(-1, 0);
    }
  }
}
void draw() {
  background(51); 
  
  //for (int i=0; i < width+scl; i+=scl){
  //  stroke(150);
  //  line(i, 0, i, height); 
  //}
  //for (int i=0; i < height+scl; i+=scl){
  //  stroke(150);
  //  line(0, i, width, i); 
  //}
  
  strokeWeight(3);
  if (f.isEaten(s)){
    s.total++;
    f.newCoordinate();
  }
  
  stroke(0, 255, 0);
  s.death();
  s.update();
  s.show();
  f.show();
  
  
  textSize(32);
  fill(0, 255, 0);
  text("Score: " + s.total, 30, 35);
}
