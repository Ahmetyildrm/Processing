Triangle t;
ArrayList<Triangle> sponge;
int timer = 0;
int genCounter = 1;
float zoom = 1.00;

void setup(){
 size(900, 900);
 sponge = new ArrayList<Triangle>();
 t = new Triangle(0, 0, 900);
 sponge.add(t);
}

void mouseWheel(MouseEvent event) {
 float e = event.getCount();
 zoom -= e;
}


void mousePressed() {
  if (genCounter < 10){
   NextGen();
   timer = 0;
 }
}

void NextGen(){
  genCounter += 1;
  ArrayList<Triangle> next = new ArrayList<Triangle>();
  for ( Triangle t : sponge) {
    ArrayList<Triangle> newTriangles = t.generate();
    next.addAll(newTriangles);
    sponge = next;
  }
}

void draw(){
 background(50); 
 
 // WRITE INFO
 textSize(32);
 text("Generation: " + genCounter, 40, 40);
 text("Total Triangle: " + sponge.size(), 40, 75);
 
 //// NEXT GENERATION TIMER
 //timer += 1;
 //if (timer %150 == 0 && genCounter < 10){
 //  NextGen();
 //}
 
 // DISPLAY TRIANGLES
 translate(width/2, height/2);
 scale(zoom);
 for( Triangle t : sponge){
   t.show();
 }
}
