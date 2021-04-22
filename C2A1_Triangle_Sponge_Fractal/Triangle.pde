class Triangle{
  PVector pos;
  float r;
  float rotation = 0;
  color c;
  Triangle(float x, float y, float r_){
   this.pos = new PVector(x, y);
   this.r = r_;
  }
  
   ArrayList<Triangle> generate(){
     ArrayList<Triangle> triangles = new ArrayList<Triangle>();     
        float newR = this.r/2;
        Triangle t1 = new Triangle(pos.x - newR/2, pos.y + sqrt(3)*newR/4, newR);
        t1.c = color(255, 0, 0);
        Triangle t2 = new Triangle(pos.x + newR/2, pos.y + sqrt(3)*newR/4, newR);
        t2.c = color(0, 255, 0);
        Triangle t3 = new Triangle(pos.x, pos.y - sqrt(3)*newR/4, newR);
        t3.c = color(0, 0, 255);
        //Triangle t4 = new Triangle(pos.x, pos.y + sqrt(3)*newR/4, newR);
        //t4.rotation = PI;
        //t4.c = color(0, 255, 0);
        triangles.add(t1);
        triangles.add(t2);
        triangles.add(t3);
        //triangles.add(t4);
       return triangles;
   }
  
  
  void show(){
   pushMatrix();
   translate(pos.x, pos.y);
   rotate(this.rotation);
   //noStroke();
   noFill();
   stroke(255);
   triangle(-r/2, r*sqrt(3)/4, r/2, r*sqrt(3)/4, 0, -r*sqrt(3)/4);
   popMatrix();
  }
  
  
  
}
