//Steven Lui - Trun your pot to change colors on both the LED and drawing. (In Sync)

import processing.serial.*;

Serial myPort; //creates object from serial class
int val = 0;

int r = 1;

int g = 3;

int b = 254;

void setup() {

  size(400, 400);
  String[] portList = Serial.list();
  printArray(portList);
  String portName = portList[0];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  if (myPort.available() > 0) {
    val = myPort.read();// reads one byte of data and stores in val
  }
  background(0);
  
  if (val <= 170){
    fill(r, g, b);
    textAlign(CENTER, CENTER);
    
    textSize(30);
    text("Blue", 300, 50);
}
if (val >= 171){
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("White", 300, 50);
    
    
    
}

ellipse(width/2, height/2, val, val);

println(val);
//println(val);
}
