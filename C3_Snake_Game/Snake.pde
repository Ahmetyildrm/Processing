class Snake{
 float x = 0;
 float y = 0;
 float xspeed = 1;
 float yspeed = 0;
 int total = 0;
 ArrayList<PVector> tail = new ArrayList<PVector>();
 
 
 void death() {
    for (int i = 0; i < tail.size(); i++) {
      PVector pos = tail.get(i);
      float d = dist(x, y, pos.x, pos.y);
      if (d < 1) {
        println("starting over");
        total = 0;
        tail.clear();
      }
    }
  }
 
 void update(){   
   if (total > 0) {
      if (total == tail.size() && !tail.isEmpty()) {
        tail.remove(0);
      }
      tail.add(new PVector(x, y));
    }
   this.x += this.xspeed*scl;
   this.y += this.yspeed*scl;
   
   this.x = constrain(this.x, scl/2, width - scl/2);
   this.y = constrain(this.y, scl/2, height - scl/2);
 }
 
 void show(){
   fill(255, 255, 0);
   rectMode(CENTER);
   for (PVector v : tail) {
      rect(v.x, v.y, scl, scl);
    }
   rect(this.x, this.y, scl, scl);  
 }
 
 void dir(float x, float y){
  this.xspeed = x;
  this.yspeed = y;
 }
 
}
