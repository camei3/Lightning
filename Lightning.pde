void setup() {
  size(800, 800);
  strokeWeight(2);
}

float boltX, boltY, newBoltX, newBoltY;
float boltR, boltAmp, rad;
color boltColor;
boolean lightening = false;

void draw() {
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);

  if (lightening) {

    for (int i = 0; i < 3; i += Math.random()*5 + 1) {
      boltAmp = (float)Math.random()-0.5;    
      newBoltX = mouseX + cos(degrees(boltR))*(rad+sin(boltR)*5) + cos(boltAmp*2*PI)*10 + (float)(Math.random()-0.5);

      boltAmp = (float)Math.random()-0.5;    
      newBoltY = mouseY + sin(degrees(boltR))*(rad+cos(boltR)*5) + sin(boltAmp*2*PI)*10 + (float)(Math.random()-0.5); 

      line(boltX, boltY, newBoltX, newBoltY);
    }

    boltX = newBoltX;
    boltY = newBoltY;
    boltR += (float)(Math.random()/400);
  }

  if (boltX > width || boltX < 0 || boltY > height || boltY < 0) {
    if (lightening) {
      fill(boltColor, 120);
      rect(0, 0, width, height);

      //could generate a bolt and rotate respective to R
      //line(boltX, boltY, width-boltX, height-boltY);
      float rootX = boltX;
      float rootY = boltY;
      do {
        strokeWeight(3);
        for (int i = 0; i < 3; i += Math.random()*10 + 1) {
          newBoltX = boltX + (width-2*rootX)/(100+((float)Math.random()-0.5)*10) + (float)(Math.random()-0.5)*20;
          newBoltY = boltY + (height-2*rootY)/(100+((float)Math.random()-0.5)*10) + (float)(Math.random()-0.5)*20;
          line(boltX, boltY, newBoltX, newBoltY);
        }

        boltX = newBoltX;
        boltY = newBoltY;
      } while (!(boltX > width+100 || boltX < 0-100 || boltY > height+100 || boltY < 0-100));
    }
    lightening = false;
  }

}

void mousePressed() {
  boltColor = color((int)(Math.random()*206)+50, (int)(Math.random()*206)+50, (int)(Math.random()*206)+50);
  stroke(boltColor);
  strokeWeight(2);
  boltX = mouseX;
  boltY = mouseY;
  boltR = (float)Math.random();
  rad = (float)Math.random()*width/8 + width/8;
  lightening = true;
}
