
class Planet {
  float radius;
  float angle;
  float distance;
  float orbitspeed;
  color c; 
  Planet[] planets;
  float X = this.distance * cos(this.angle);
  float Y = this.distance * sin(this.angle);

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
    this.orbitspeed = random(0.005, 0.01);
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
      float newR = random(this.radius*0.3, this.radius*0.5);
      float newD = random(1.1*(this.radius + newR), 2*(this.radius + newR)); 
      planets[i] = new Planet(newR, newD);
      if (level < 2) {
        int num = int(random(1, 3));
        planets[i].spawnMoons(num, level + 1);
      }
    }
  }

  void show() {   
    pushMatrix();    
    rotate(this.angle);
    this.orbit();
    translate(this.distance, 0);
    fill(this.c, 200);
    noStroke();
    ellipse(0, 0, this.radius*2, this.radius*2);
    fill(255);
    ellipse(0, 0, 3, 3);
    if (this.planets != null) {
      for (int i = 0; i<this.planets.length; i++) {          
        strokeWeight(2);
        stroke(planets[i].c, 100);
        //float planetD = planets[i].distance;
        //float planetX = planetD * cos(planets[i].angle);
        //float planetY = planetD * sin(planets[i].angle);
        //line(0, 0, planets[i].X, planets[i].Y);
        this.planets[i].show();
        noFill();
        stroke(255, 100);
        circle(this.X, this.Y, 2*planets[i].distance);        
      }
    }
    popMatrix();
  }
  
}
