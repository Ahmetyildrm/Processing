class Food{
 float x;
 float y;
 float r = scl;
 
 Food(float x, float y){
   this.x = x;
   this.y = y;
 }
 
 void show(){
   fill(255, 0, 0);
   stroke(255);
   rectMode(CENTER);
   rect(this.x, this.y, r, r); 
 }
 
 void newCoordinate(){
   float cols = floor(width/scl);
   float rows = floor(height/scl);
   this.x = scl*floor(random(cols)) + scl/2;
   this.y = scl*floor(random(rows)) + scl/2; 
 }
 
 boolean isEaten(Snake s){
   return dist(s.x, s.y, this.x, this.y) < scl;
 }
  
}
