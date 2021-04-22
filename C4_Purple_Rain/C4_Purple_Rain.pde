Drop[] drops = new Drop[500];
PImage window;
PImage stars;
PFont Font1;
int cnt = 0;

void setup() {
  size(746, 720);
  window = loadImage("window.png");
  stars = loadImage("stars.jpg");
  for (int i=0; i<drops.length; i++) {
    drops[i] = new Drop();
  }  
  Font1 = createFont("Arial Bold", 18);
}
void draw() {

  background(51);

  image(stars, 0, 0);
  for (Drop d : drops) {
    wind = map(mouseX, 0, width, -0.1, 0.1);
    d.fall();
    d.show();
  }
  image(window, 0, 0);

  textFont(Font1);
  fill(255, 165, 0);
  textAlign(CENTER);
  text("Ahmet Yıldırım", width/2, 48);
}
