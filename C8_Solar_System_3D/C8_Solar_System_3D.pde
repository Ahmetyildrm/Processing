import peasy.*;

Planet sun;
PeasyCam cam; 

PImage sunTexture;
PImage [] textures = new PImage[5];
void setup() {
  size(1500, 900, P3D);
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("mercury.jpg");
  textures[1] = loadImage("venus.jpg");
  textures[2] = loadImage("earth.jpg");
  textures[3] = loadImage("mars.jpg");
  textures[4] = loadImage("jupiter.jpg");
  cam = new PeasyCam(this, 500);
  sun = new Planet(100, 0, #FFFF00, 0, sunTexture);
  sun.spawnMoons(3, 1);
}


void draw() {
  background(0);

  pointLight(255, 255, 255, sun.radius, sun.radius, sun.radius);
  pointLight(255, 255, 255, -sun.radius, -sun.radius, -sun.radius);
  pointLight(255, 255, 255, +sun.radius, -sun.radius, -sun.radius);
  pointLight(255, 255, 255, -sun.radius, +sun.radius, -sun.radius);
  pointLight(255, 255, 255, -sun.radius, -sun.radius, +sun.radius);
  pointLight(255, 255, 255, -sun.radius, +sun.radius, +sun.radius);
  pointLight(255, 255, 255, +sun.radius, -sun.radius, +sun.radius);
  pointLight(255, 255, 255, +sun.radius, +sun.radius, -sun.radius);
  sun.show();
}
