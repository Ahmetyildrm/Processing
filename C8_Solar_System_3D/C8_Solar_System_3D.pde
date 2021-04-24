Planet sun;

void setup(){
 size(1500, 900);
 sun = new Planet(100, 0, #FFFF00, 0);
 sun.spawnMoons(2, 1);
}


void draw(){
  background(0);
  translate(width/2, height/2);
  sun.show();  
}
