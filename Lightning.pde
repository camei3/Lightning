void setup() {
  size(800, 800);
  frameRate(240);
}

float boltX;
float boltY;
float boltR;
float boltAmp;
float rad;
color boltColor;
boolean lightening = false;
void draw() {
  fill(0, 0, 0, 10);
  rect(-10, -10, width+10, height+10);

  if (lightening) {

    float newBoltX = mouseX + cos(degrees(boltR))*(rad + boltAmp) + (float)(Math.random()-0.5);
    float newBoltY = mouseY + sin(degrees(boltR))*(rad + boltAmp) + (float)(Math.random()-0.5); 
    




    line(boltX, boltY, newBoltX, newBoltY);

    boltX = newBoltX;
    boltY = newBoltY;
    boltR += (float)(Math.random()/1000);
    boltAmp = sin((float)Math.random())*10;    
  }

  if (boltX > width || boltX < 0 || boltY > height || boltY < 0) {
    if (lightening) {
      fill(boltColor,120);
      rect(-10, -10, width+10, height+10);
    }
    lightening = false;
  }
}

void mousePressed() {
  boltColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  stroke(boltColor);
  boltX = mouseX;
  boltY = mouseY;
  boltR = (float)Math.random();
  rad = dist(mouseX, mouseY, width/2, height/2);
  lightening = true;
}

