void setup() {
  size(800, 800);
  clear();
  
}

float boltX;
float boltY;
float boltR;
int rotWise = 1;
boolean lightening = false;
void draw() {
  fill(0, 0, 0, 10);
  rect(-10, -10, width+10, height+10);

  if (lightening) {


    float newBoltX = width/2 + (float)(Math.random()-0.5)*cos(degrees(boltR))*width/5;
    float newBoltY = height/2 + (float)(Math.random()-0.5)*sin(degrees(boltR))*height/5; 


    boltR += (float)(Math.random())*rotWise;




    line(boltX, boltY, newBoltX, newBoltY);

    boltX = newBoltX;
    boltY = newBoltY;
  }

  if (boltX > width || boltX < 0 || boltY > height || boltY < 0) {
    lightening = false;
  }
}

void mousePressed() {
  stroke(0, 255, 0);
  boltX = mouseX;
  boltY = mouseY;
  boltR = 0;
  clear();
  lightening = true;
}
