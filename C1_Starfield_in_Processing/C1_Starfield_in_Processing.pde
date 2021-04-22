Star[] stars = new Star[700];
float speed;

void setup() {
  size(500, 500); 
  for (int i= 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  speed = map(mouseX, 0, width, -1, 5);
  background(0);
  
  //// PERSPEKTİF DENEMESİ
  //int sqsize = 150;
  //int offset = 50;
  
  //// Kareden kenarlara çizgi çekeceksen
  ////stroke(255);
  ////line(0, offset, (width-sqsize)/2, (height-sqsize)/2);
  ////line(0, height - offset, (width-sqsize)/2, (height+sqsize)/2);
  ////line(width, offset, (width+sqsize)/2, (height-sqsize)/2);
  ////line(width, height - offset, (width+sqsize)/2, (height+sqsize)/2);
  
  ////Kenarlarda kalan alanların boyanması
  //noStroke();
  //fill(255, 0, 0, 127);
  //quad(0, offset, 0, height-offset, (width-sqsize)/2, (height+sqsize)/2, (width-sqsize)/2, (height-sqsize)/2);
  
  //fill(0, 255, 0, 127);
  //quad(width, offset, width, height - offset, (width+sqsize)/2, (height+sqsize)/2, (width+sqsize)/2, (height-sqsize)/2); 
  
  //fill(0, 0, 255, 127);
  //quad(0, offset, width, offset, (width+sqsize)/2, (height-sqsize)/2, (width-sqsize)/2, (height-sqsize)/2);
  
  //fill(255, 0, 255, 127);
  //quad(0, height-offset, width, height-offset, (width+sqsize)/2, (height+sqsize)/2, (width-sqsize)/2, (height+sqsize)/2);
  
  //// Ortadaki kare
  //rectMode(CENTER);
  //fill(105, 200);
  //rect(width/2, height/2, sqsize, sqsize);
  
  // ASIL OLAY
  pushMatrix();
  translate(width/2, height/2);
  for (int i= 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }
  popMatrix();
  
  
  
  
}
