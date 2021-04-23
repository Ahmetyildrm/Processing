class Planet {
  float radius;
  float angle;
  float distance;
  float orbitspeed;
  color c; 
  Planet[] planets;

  Planet(float r, float d, color c, float orbitspeed) {
    this.radius = r;
    this.distance = d;
    this.angle = random(TWO_PI);
    this.orbitspeed = orbitspeed; 
    this.c = c;
  }

  Planet(float r, float d) {
    this.radius = r;
    this.distance = d;
    this.angle = random(TWO_PI);
    this.c = color(random(255), random(255), random(255));
    this.orbitspeed = random(0.01, 0.03);
  }

  void orbit() {
    angle += orbitspeed; 
    //if (this.planets != null) {
    //   for (int i = 0; i<this.planets.length; i++) {        
    //     this.planets[i].orbit();
    //   }
    // }
  }

  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i<planets.length; i++) {
      float newR = random(this.radius*0.4, this.radius*0.5);
      float newD = random(this.radius + newR, this.radius + 6*newR); 
      planets[i] = new Planet(newR, newD/level);
      if (level < 2) {
        int num = int(random(0, 3));
        planets[i].spawnMoons(num, level + 1);
      }
    }
  }

  void show() {   
    pushMatrix();    
    rotate(this.angle);
    this.orbit();
    translate(distance, 0);
    fill(this.c, 200);
    noStroke();
    ellipse(0, 0, radius*2, radius*2);    
    if (this.planets != null) {
      for (int i = 0; i<this.planets.length; i++) {  
        strokeWeight(2);
        stroke(planets[i].c, 100);
        float planetD = planets[i].distance;
        float planetX = planetD * cos(planets[i].angle);
        float planetY = planetD * sin(planets[i].angle);
        line(0, 0, planetX, planetY);
        this.planets[i].show();
      }
    }
    popMatrix();
  }
  
}
