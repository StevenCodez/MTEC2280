//"Anything you Imagine it to be" Steven Lui Hover around however you like


void setup() {
  size(700, 700);
  ellipseMode(CENTER);
}

void draw() {
  float r = 223;
  float g = 42;
  float b = 42;


  background(0);
  //for loop printing values
  //for (int i =1; i<=10; i=i+1){
  //println(i);
  //}
  //left to right

  for (int i= 0; i<width; i+=15) {
   
    line(mouseY, i, i, mouseX);//super cool effect\\
    
     if (mouseY <= 50){
     r = 25; 
     g = 233;
    }
    
    if (mouseY <= 5){
     g = 215; 
    }
  }

  for (int i= 0; i<height; i+=15) {

    line(i, mouseY, mouseX, i);//super cool look

    if (mouseX <= 50){
     r = 25; 
    }
    
    if (mouseX <= 50){
     g = 125; 
    }

    

    //line(0,i,width,i);// for perfect grid
  }
  //cvreate cicle for loop where strokes get thicker


  //my super cool circler effect
  for (int i = 300; i>= -114; i = i-1) {  
    stroke(g);
    
    if (i <= 20) {
      
      fill( r, r, b);
      ellipse(300, width/2, i, i);
    }
  }


  /*for(int i = 0; i<= 2000; i += 40){
   noFill();
   strokeWeight((i+1/25));
   ellipse(mouseX, mouseY, i+i, i+i);*/
  //map(value, start1, stop1, start2, stop2) is hint for the color pallete.
}
