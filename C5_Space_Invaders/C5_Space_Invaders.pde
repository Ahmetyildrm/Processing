Ship ship;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
float time = 0;
int charger = 13;
int score = 0;

void setup() {
  size(600, 400);
  ship = new Ship();
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  for (int i=0; i<10; i++) {
    Enemy e = new Enemy();
    enemies.add(e);
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    ship.right();
  } else if (keyCode == LEFT) {
    ship.left();
  } else if (keyCode == UP && charger >0) {
    Bullet b;
    b = ship.fireBullet();
    bullets.add(b);
    charger--;
  }
  else if(key == 'c'){
    charger += 5;
  }
}

void draw() {
  background(51);
  time += 1;

  if (time %200 < 1) {
    Enemy eNew = new Enemy();
    enemies.add(eNew);
    charger++;
  }
  
  ship.show();
  
  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.show();
    if (b.y < 0) {
      bullets.remove(i);
    }
  }
  
  for (int j = 0; j < enemies.size(); j++) {
    Enemy e = enemies.get(j);
    e.moveDownwards(0.0005);
    if(e.y >= height){
      noLoop();
      textSize(50);
      textAlign(CENTER);
      fill(0, 255, 130);
      text("Your Score: " + score, width/2, height/2);
    }
    e.show();
  }
  
  for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    for (int j = 0; j < enemies.size(); j++) {
      Enemy e = enemies.get(j);
      if (e.dead(b)) {
        score++;
        enemies.remove(j);
        bullets.remove(i);
      }
    }
  }
  
  textSize(25);
  textAlign(LEFT);
  fill(255);
  text("Bullets: " + charger, 0, 20);
  textAlign(RIGHT);
  text("Enemies: " + enemies.size(), width, 20);
  textAlign(CENTER);
  fill(0, 255, 0);
  text("Score: " + score, width/2, 20);
}
