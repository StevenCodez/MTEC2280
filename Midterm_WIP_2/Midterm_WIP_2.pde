//Main focus is playin with phases, interacting with them, combinign multiple projects into one fully functional peice.
//Some codes refrence to the old projects I have created

// referenece: https://processing.org/examples/tickle.html

int secret = 0;





// startup
String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text



int timer= 1; //setting up timer variable for 2000 millisecond trigger
int currentTime=0;
int savedTime=0; 

//images used
PImage Cupcake;
PImage Egg;

int loading = 0;

int Phase = 1;
int restart = 1;

int rectX=0; //variable for x value of ellipse

//Phase 1 (S= start)
float opacity = 0;
float fade = 1;

int currentTimeS = 0;
int savedTimeS = 0;


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
  Egg = loadImage("EasterEgg.jpg");
  rectMode(CENTER);

  ellipseMode(CENTER);

  //for text shake

  textAlign(CENTER, CENTER);
  hr = textWidth(message) * 4 ;
  vr = (textAscent() + textDescent())* 4 ;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  println("P " + Phase + " L " + loading);
  if ( restart == 0) {
    background(255);
    textAlign(CENTER);
    fill(0);
    textSize(30);
    text("Press R", width/2, height/2);
  }



  // *****************************************  Startup screen  *****************************************

  if (Phase == 1) {


    rectX = 0;
    //println("X " + x + "Y " +y + "Opacity: " + opacity);


    rect(0, 0, width, height);
    background(0);
    fill(120, 200);


    // If the cursor is over the text, change the position
    if (abs(mouseX - x) < hr && abs(mouseY - y) < vr) {
      x += random(-25, 20);
      y += random(-20, 20);
    }




    for (int i = 500; i>= 1; i -=2) {

      stroke(i);
      fill(i, opacity);
      ellipse(200, height/2, i, i);//can use boolean draw

      fill(i);
    }

    currentTimeS = millis();
    textAlign(CENTER);
    fill(255);

    textSize(30);

    if (currentTimeS >= 3000) {

      fill(opacity);


      text("If only you could move Welcome to Circle", width/2, 425);
      opacity = opacity + fade;

      if (opacity > 50|| opacity < 0) {
        fade = -fade;
      }

      if (x <= 425 && y >= 260 && y <= 550) {
        fill(0);
        stroke(0);
        rect(635, 445, 620, 100);
        fill(opacity);
        text("Press W to begin", width/2, 425);
      } 
      if (x <= 1|| y <= 0 || y >= 710 ) {
        text("Uh oh, you messed up. Press R", width/2, 625);
        rectX = 3000;
      }
    }


    fill(255);


    text("Welcome Player", x, y);
    //println(x, y);
    //println(restart);
  }


  //after W
  if (Phase == 2) {

    background(opacity);
    opacity = opacity + fade;
    if (opacity > 255) {
      fade = +fade;
    }

    textAlign(CENTER);
    fill(0);
    textSize(30);



    fill(r, 0, b);
    text("Left Click then Press A if you would like to continue", width/2, height/2);

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
    background(0);

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


  //              *********************************** the easter egg phase  *********************************** 

  if ( loading == 1 && Phase == 1) {
    fill(255);
    text("Don't look here > Press P", 1050, 245);
  }



  if (secret == 1) {
    
    background (0);
    fill(random(r), g, random(b));
    image(Egg, width/2, height/2);
    text("You Found the Easter Egg! Game done :)", width/2, height/2);
  }
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

  if (Phase <2) {
    if (key == 'w' || key == 'W') {




      background(opacity);
      opacity = opacity + fade;
      if (opacity > 20|| opacity < 0) {
        fade = -fade;
      }


      Phase++;
    }
  }


  if (rectX >= 2580) {
    if (key == 'r' || key == 'R') {
      rectX = 0;
      secret = 0;
      x = 640;
      y = 360;
      opacity = 0;
      rect(0, 0, width, height);
      background(0);
      fill(120, 200);


      // If the cursor is over the text, change the position
      if (abs(mouseX - x) < hr && abs(mouseY - y) < vr) {
        x += random(-25, 20);
        y += random(-20, 20);
      }




      for (int i = 500; i>= 1; i -=2) {

        stroke(i);
        fill(i, opacity);
        ellipse(200, height/2, i, i);//can use boolean draw

        fill(i);
      }

      currentTimeS = millis();
      textAlign(CENTER);
      fill(255);

      textSize(30);

      if (currentTimeS >= 3000) {

        fill(opacity);


        text("If only you could move Welcome to Circle", width/2, 425);
        opacity = opacity + fade;

        if (opacity > 50|| opacity < 0) {
          fade = -fade;
        }

        if (x <= 425 && y >= 260 && y <= 550) {
          fill(0);
          stroke(0);
          rect(635, 445, 620, 100);
          fill(opacity);
          text("Press W to begin", width/2, 425);
        } else if (x <= 0|| y <= 0 ) {
          text("Uh oh, you messed up. Press R", width/2, 625);
          rectX = 3000;
        }
      }
      fill(255);
      text("Welcome Player", x, y);
      println(x, y);


      Phase = 1;
      loading = 0;
      textAlign(CENTER, CENTER);
    }
  }

  //             ******************************************** SECRET *************************************************

  if ( loading == 1 && Phase == 1) {
    if (key == 'p' || key == 'P') {
      secret = 1;
    }
  }
}
//Phase 2
void mousePressed() {
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
}
