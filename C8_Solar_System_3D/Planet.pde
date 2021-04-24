
class Planet {
  float radius;
  float angle;
  float distance;
  float orbitspeed;
  color c; 
  Planet[] planets;
  PVector v;
  PShape globe;

  Planet(float r, float d, color c, float orbitspeed, PImage img) {
    this.v = PVector.random3D();
    this.radius = r;
    this.distance = d;
    v.mult(distance);
    this.angle = random(TWO_PI);
    this.orbitspeed = orbitspeed; 
    this.c = c;
    noStroke();
    noFill();
    this.globe = createShape(SPHERE, this.radius);
    globe.setTexture(img);
  }

  Planet(float r, float d, PImage img) {
    this.v = PVector.random3D();
    this.radius = r;
    this.distance = d;
    v.mult(distance);
    this.angle = random(TWO_PI);
    this.c = color(random(255), random(255), random(255));
    this.orbitspeed = random(0.0005, 0.01);
    noStroke();
    noFill();
    this.globe = createShape(SPHERE, this.radius);
    globe.setTexture(img);
  }

  void orbit() {
    angle += orbitspeed; 
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }

  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i<planets.length; i++) {
      float newR = random(this.radius*0.2, this.radius*0.5);
      float newD = random(1.1*(this.radius + newR), 2*(this.radius + newR)); 
      int textureNo = int(random(0, 4));
      planets[i] = new Planet(newR, newD, textures[textureNo]);
      if (level < 2) {
        int num = int(random(1, 2));
        planets[i].spawnMoons(num, level + 1);
      }
    }
  }

  void show() {   
    pushMatrix(); 
    PVector v2 = new PVector(1, 0, 0);
    PVector p = v.cross(v2);    
    
    rotate(this.angle, p.x, p.y, p.z);
    line(0, 0, 0, this.v.x, this.v.y, this.v.z); 
    
  
    translate(v.x, v.y, v.z);
    fill(this.c);
    noStroke();
    shape(this.globe);
    
    if (this.planets != null) {
      for (int i = 0; i<this.planets.length; i++) {          
        strokeWeight(2);
        stroke(planets[i].c, 100);
        this.planets[i].show();      
      }
    }
    popMatrix();
    this.orbit();
  }
  
}
