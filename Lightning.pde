void setup() {
  size(800, 800);
  clear();
  frameRate(120);
}

float boltX;
float boltY;
float boltR;
float boltAmp;
float rad;
boolean lightening = false;
void draw() {
  fill(0, 0, 0, 10);
  rect(-10, -10, width+10, height+10);

  if (lightening) {


    float newBoltX = width/2 + cos(degrees(boltR))*(rad + boltAmp) + (float)(Math.random()-0.5);
    float newBoltY = height/2 + sin(degrees(boltR))*(rad + boltAmp) + (float)(Math.random()-0.5); 


    boltR += (float)(Math.random()/1000);
    boltAmp = sin((float)Math.random())*10;


    line(boltX, boltY, newBoltX, newBoltY);

    boltX = newBoltX;
    boltY = newBoltY;
  }

  if (boltX > width || boltX < 0 || boltY > height || boltY < 0) {
    if (lightening) {
      fill(0, 255, 0,120);
      rect(-10, -10, width+10, height+10);
    }
    lightening = false;
  }
}

void mousePressed() {
  stroke(0, 255, 0);
  boltX = mouseX;
  boltY = mouseY;
  boltR = 0;
  rad = dist(mouseX, mouseY, width/2, height/2);
  clear();
  lightening = true;
}
