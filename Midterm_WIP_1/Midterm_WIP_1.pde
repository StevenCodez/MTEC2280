int timer= 1; //setting up timer variable for 2000 millisecond trigger
int currentTime=0;
int savedTime=0; 

PImage Cupcake;

int loading = 0;

int Phase = 1;
int restart = 1;

int rectX=0; //variable for x value of ellipse


//for Phase 2
float r = random(0, 255);
float g = random(0, 255);
float b = random(0, 255);


//loading

float r2 = 230;
float g2 = 33;
float b2 = 77;

void setup() {
  size(1280, 720);
  Cupcake = loadImage("cupcake.png");
  rectMode(CENTER);

  ellipseMode(CENTER);


  //phase 2
}

void draw() {


  if ( restart == 0) {
    background(255);
    textAlign(CENTER);
    fill(0);
    textSize(30);
    text("Press R", width/2, height/2);
  }

  // Startup screen
  if (Phase == 1) {
    background(255);
    textAlign(CENTER);
    fill(0);
    textSize(30);
    text("Press W", width/2, height/2);

    for (int i = 500; i>= 1; i -=2) {
      if (mousePressed) {
        i+= 1;
      }
      stroke(i);
      fill(i, 255);

      ellipse(300, height/2, i, i);//can use boolean draw
    }
  }
  //after W
  if (Phase == 2) {
    background(255);
    textAlign(CENTER);
    fill(0);
    textSize(30);

    background(r, g, b);
    text("Press A", width/2, height/2);

    if (mousePressed) {
      if (mouseX>400) {
        fill(r, 0, b);
        ellipse(width/2, 400, 100, 100);
      } else if (mouseY >500) {
        //draw rectangle
        fill(0);
        rect(100, 600, 100, 100);
      } else {
        fill(random(0, 255));
        rect(600, 100, 100, 100);
      }
    }
  }





  //when A clicked, this begins

  if (loading >= 1) {

    currentTime=millis();  //update currentTime in draw so that it is continuously updating
    background(255);

    noStroke();
    triangle(-10, 220, 500, 50, 900, 800);


    fill(r2, g2, b2);

    quad(20, 100, 30, 30, 600, 600, 100, 600);

    stroke(0);
    fill(g2, g2, b2);

    strokeWeight(3);

    rect(5, height/2, 2600, 100);

    
    fill(g2, g2, g2);

    for (int i = 222; i <255; i += 10) {
      println(i);
      fill(i, random(i), 20 );     //color of bar
    }
    rect(5, height/2, rectX, 100);     // loading bar

    if (rectX < 2580) {
      if (currentTime-savedTime > timer) { 
        rectX+=10;
        textAlign(CENTER);
        fill(0);
        textSize(30);
        text("Loading...", width/2, height/2);


        savedTime=currentTime;    //assign value of currentTime to savedTime
      }
    } else {
      background(255);
      image(Cupcake, width/2, height/2);

      text("Press R to restart", width/2, height/2);
    }
  }
  //println(rectX);
  //println("loading" + loading);
  //println("phased" + Phase);
}


void keyPressed() {

  if (keyPressed) {
    if (loading <1) {
      if (key == 'a' || key == 'A') {
        background(255);
        loading++;
        rectX = 0;
      }
    }
  }
  if (rectX >= 2580) {
    if (key == 'r' || key == 'R') {
      background(255);  
      Phase = 1;
      loading = 0;
    }
  }
  if (Phase <2) {
    if (key == 'w' || key == 'W') {
      background(255);
      Phase++;
    }
  }
}
//Phase 2
void mousePressed() {
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
}
