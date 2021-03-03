String[] names = {"click a key", "Move around", "circlezoom", "cone", "Eyeball?"};

int positionNames = 0;

void setup() {
  size(1000, 1000);
  fill(255, 100, 0);

  textSize(36);
  textAlign(CENTER, CENTER);
}
void draw() {
  background (0);
  text(names[positionNames], width/2, height/2);


  //eyeball
  if (positionNames >= 4) {
    for (int i = 500; i>= 1; i -=5 ) {
      if (mousePressed) {
        i+= 1;
      }
      stroke(i);
      fill(i, 255);

      ellipse(300, height/2, i, i);//can use boolean draw
    }
  }
  //cone
  if (positionNames == 3) {

    for (int i = 500; i>= 1; i -=2 ) {
      stroke(0);
      float r = random(0, 255);
      fill(24, i, 233);
      ellipse(i, 500, 204, i);
    }
  }


  //special circle
  if (positionNames == 2) {

    for (int i = 500; i>= 1; i -=1 ) {
      stroke(0);
      float r = random(0, 255);
      fill(r, 54, 255);
      ellipse(500, height/2, i, i);
    }
  }

  //line border
  if (positionNames == 1) {
    for (int i= 0; i<width; i+=15) {
      stroke(255);
      line(mouseY, i, i, mouseX);
    }
  }

  if (positionNames == 0) {
    for (int i = 0; i<width; i+=2) {
      rect(200, i, 92, 2009);
      fill(i,100, 244);
    }
  }
}


void keyPressed() {

  //positionNames = int(random(0, names.length));
  positionNames++;
  if (positionNames == 5) {
    positionNames = 0;
  }
}
