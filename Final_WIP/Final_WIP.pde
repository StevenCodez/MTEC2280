//Game Name: Why did you have to Press A? - by Steven Lui //<>//

// referenece for Text shake: https://processing.org/examples/tickle.html 

//************************** ARDUINO SETUP  **************************

import processing.serial.*;

Serial myPort;

boolean firstContact  = false;
int state = 0;
int lastByte = -1;
color bgcolor = color(0, 0, 0);







int secret = 0;

int end;

// startup
String message = "tickle";

String Begin = "Press W to begin";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text



int timer= 1; //setting up timer variable for 2000 millisecond trigger
int currentTime=0;
int savedTime=0; 

// timer for end
int counter; 
int currentTimeE;
int savedTimeE;

// END PHASE
PImage Broly;
int xB = 1;
int yB = 250;


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


//hint phases
int hint;

int hintPhase = 0;


// ******************************* SETUP *****************************

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

  //Broly
  Broly = loadImage("Broly.jpg");


  //Serial
  printArray(Serial.list());
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
}


//************************* DRAW ***************************



void draw() {

  background(bgcolor);
  //println("P " + Phase + " L " + loading);

  if ( restart == 0) {
    //background(255);
    textAlign(CENTER);
    fill(0);
    textSize(30);
    text("Press R", width/2, height/2);
  }


  // *****************************************  Arduino  *****************************************




  if (myPort.available() > 0) {
    int inByte = myPort.read();
    println(inByte);


    if (firstContact == false) {
      if (inByte == 'A') {
        myPort.clear();
        firstContact = true; 
        myPort.write(state);
      }
    } else {
      if (lastByte != inByte) {
        lastByte = inByte;
        state++;
      }
      if (state > 2) {
        state = 0;
      }
    }
    if (state == 0) {
      bgcolor = color(0, 0, 0);
    } else if (state == 1) {
      bgcolor = color(0, 0, 255);
    } else if (state == 2) {
      bgcolor = color(255, 0, 0);
    }
    myPort.write(state);
  }










  // *****************************************  Startup screen  *****************************************

  if (Phase == 1) {


    rectX = 0;
    //println("X " + x + "Y " +y + "Opacity: " + opacity);


    rect(0, 0, width, height);
    //fill(120, 200);
    
    
    
  if (myPort.available() > 0) {
    int inByte = myPort.read();
    println(inByte);


    if (firstContact == false) {
      if (inByte == 'A') {
        myPort.clear();
        firstContact = true; 
        myPort.write(state);
      }
    } else {
      if (lastByte != inByte) {
        lastByte = inByte;
        state++;
      }
      if (state > 2) {
        state = 0;
      }
    }
    if (state == 0) {
      bgcolor = color(0, 0, 0);
    } else if (state == 1) {
      bgcolor = color(0, 0, 255);
    } else if (state == 2) {
      bgcolor = color(255, 0, 0);
    }
    myPort.write(state);
  }





    
    
    
    
    
    


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

      if (currentTimeS >= 6000) {
        fill(255);
        textSize(70);
        text("Circle\nV", 200, 125);
      }


      fill(0);


      textSize(30);


      if (x <= 425 && y >= 260 && y <= 550) {
        fill(0);
        stroke(0);
        rect(635, 445, 620, 100);
        fill(opacity);


        //changes W to A

        if (hint == 1) {
          Begin = "Press A to st- I mean W to start";
          text(Begin, width/2, 425);
        } else {


          text(Begin, width/2, 425);
        }
      } 

      if (x <= 20|| y <= 20  || y >= 700 ) {
        fill(opacity);
        text("Uh oh, you messed up. Press R", width/2, 625);
        rectX = 3000;
      }




      if (x <= 1|| y <= 0 || y >= 710 ) {
        text("Uh oh, you messed up. Press R", width/2, 625);
        rectX = 3000;
      }
    }


    fill(255);

    text("Welcome Player", x, y);
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


  //              *********************************** You shouldn't be there  *********************************** 



  if ( loading == 1 && Phase == 1 && hint < 1) {
    fill(255);
    text("Please don't do that again. Press W", 950, 245);
  }


  //Startup screen change






  //              *********************************** the easter egg phase  *********************************** 

  if ( loading == 1 && Phase == 1 && hint >= 1) {
    fill(255);

    text("I swear there is nothing on this page.", 950, 245);

    if (mouseX <= 345 && mouseY <= 50 && mouseX >= 145 && mouseY <=50) {
      text("Don't Press P", 250, 45);
    }
  }






  if (secret == 1) {

    background (0);
    fill(random(r), g, random(b));

    text("Why you checking here?", 850, 650);
    image(Egg, x, y);

    text("You Found the Easter Egg! Game done :)", width/2, height/2);


    if (mouseX >= 750 && mouseY >= 650 && mouseX <= 1105 ) {

      text("STOP NOT THE 'A'BUTTON PLEASE ", 250, 450);
    }
  }
  // ********************************************* eND PHASE*****************************************************************



  if (end == 1) {

    currentTimeE = millis();

    background(0);
    println("Saved " + savedTimeE + " Timer " + timer + " current " + currentTimeE);

    timer = 70;


    if (currentTimeE-savedTimeE > timer) { 
      fill(255);
      counter ++;


      println("Triggered");

      savedTimeE = currentTimeE;    //assign value of currentTime to savedTime
    }
    fill (255);

    if (counter == 1) {
      text("W", 65, 200);
    }

    if (counter == 2) {
      text("Why", 75, 200);
    }

    if (counter == 3) {
      text("Why?", 85, 200);
    }

    if (counter == 4) {
      text("Why? W", 95, 200);
    }

    if (counter == 5) {
      text("Why? Wh", 105, 200);
    }

    if (counter == 6) {
      text("Why? Why", 115, 200);
    }

    if (counter == 7) {
      text("Why? Why d", 125, 200);
    }

    if (counter == 8) {
      text("Why? Why di", 135, 200);
    }

    if (counter == 9) {
      text("Why? Why did", 145, 200);
    }

    if (counter == 10) {
      text("Why? Why did y", 155, 200);
    }

    if (counter == 11) {
      text("Why? Why did yo", 165, 200);
    }

    if (counter == 12) {
      text("Why? Why did you", 175, 200);
    }

    if (counter == 13) {
      text("Why? Why did you h", 185, 200);
    }

    if (counter == 14) {
      text("Why? Why did you ha", 195, 200);
    }

    if (counter == 15) {
      text("Why? Why did you hav", 205, 200);
    }

    if (counter == 16) {
      text("Why? Why did you have", 215, 200);
    }

    if (counter == 17) {
      text("Why? Why did you have t", 225, 200);
    }

    if (counter == 18) {
      text("Why? Why did you have to", 235, 200);
    }

    if (counter == 19) {
      text("Why? Why did you have to p", 245, 200);
    }

    if (counter == 20) {
      text("Why? Why did you have to pr", 255, 200);
    }

    if (counter == 21) {
      text("Why? Why did you have to pre", 265, 200);
    }

    if (counter == 22) {
      text("Why? Why did you have to pres", 275, 200);
    }

    if (counter == 23) {
      text("Why? Why did you have to press", 285, 200);
    }

    if (counter == 24) {
      text("Why? Why did you have to press", 295, 200);
    }

    if (counter == 25) {
      text("Why? Why did you have to press A!!", 305, 200);
    }

    if (counter == 26) {
      text("Why? Why did you have to press A!!!!", 315, 200);
    }

    if (counter >= 27) {
      text("Why? Why did you have to press A!!!!!!", 325, 200);
    }




    if (counter >= 27) {
      translate(random(-20, 100), random(-20, 100));
      image(Broly, xB, yB);
    }

    image(Broly, xB, yB);

    if (counter >= 120) {
      exit();


      //image(Cupcake, width/2, height/2);
    }
  }
}





// ************************************** FUNCTION FOR KEY PRESSES **************************************-


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
      hint =+ 1;


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
        if (x <= 20|| y <= 20 || x >= 0 || y >= 700 ) {
          text("Uh oh, you messed up. Press R", width/2, 625);
          rectX = 3000;
        }
      }
      fill(255);
      text("Welcome Player", x, y);



      Phase = 1;
      loading = 0;
      textAlign(CENTER, CENTER);
    }
  }



  //             ******************************************** SECRET *************************************************

  if ( loading == 1 && Phase == 1) {
    if (key == 'p' || key == 'P') {
      secret = 1;
      loading = 3;
    }
  }



  if (loading == 3  && mouseX >= 750 && mouseY >= 650 && mouseX <= 1105) {
    if (key == 'a' || key == 'A') {

      end = 1;
      rectX = 0;
    }
  }
}


//Phase 2
void mousePressed() {
  r = random(0, 255);
  g = random(0, 255);
  b = random(0, 255);
}


//bottom right 345, 50
//bottom left 145, 45
