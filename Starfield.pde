Particle[] stars;
OddballParticle planet = new OddballParticle();;

void setup() {
  background(0);
  size(800,800);
  stars = new Particle[2500];
  for(int i = 0; i < stars.length; i++) {
    stars[i] = new Particle();
  }
  for(int i = 0; i < 100; i++) {
    stars[i] = new OddballParticle();
  }
}

void draw() {
  background(0);
  for(int i = 100; i < stars.length; i++) {
    if(mousePressed)
      stars[i].mySpeed *= 1.05;
    stars[i].walk();
    stars[i].show();
  }
  for(int i = 0; i < 100; i++) {
    if(mousePressed)
      stars[i].mySpeed *= 1.05;
    stars[i].walk();
    stars[i].show();
  }
}

class Particle {
  
  double myX, myY, mySize, mySpeed;
  double myAngle;
  int startSize, sizeRate;
  color myColor;
  
  
  Particle() {
    myX = width/2;
    myY = height/2;
    startSize = 1;
    sizeRate = 100;
    myAngle = (Math.random()*7);
    mySpeed = (Math.random()*10)+0.1;
    myColor = color(255,255,255);
  }
  
  
  void walk() {
    myX += Math.cos(myAngle)*mySpeed/50;
    myY += Math.sin(myAngle)*mySpeed/50;
    mySize = startSize + (dist((float)myX,(float)myY, width/2,height/2))/sizeRate;
  }
  
  void show() {
    fill(myColor);
    if(sizeRate == 10) {
      strokeWeight(1);
      stroke(50);
    } else
      noStroke();
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  
}

class OddballParticle extends Particle {
  OddballParticle() {
    myX = 400;
    myY = 400;
    startSize = 5;
    sizeRate = 10;
    myAngle = (Math.random()*7);
    mySpeed = (Math.random()*8)+0.1;
    myColor = color(100,100,100);
  }
}

void keyPressed() {
  for(int i = 100; i < stars.length; i++) {
    stars[i] = new Particle();
  }
  
  for(int i = 0; i < 100; i++) {
    stars[i] = new OddballParticle();
  }
}




