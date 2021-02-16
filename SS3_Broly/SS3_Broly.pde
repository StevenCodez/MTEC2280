//Steven "Broly is excited for Cupcake!
//https://www.openprocessing.org/sketch/621245 me code exactly what I wanted.
//For image]


//float x;
//float y;


PImage cupcake; 
PImage Broly;
PImage hand;

float opacity = 0;
float fade = 1;

//create var for cupcake animation
float fall = 0;

String quote = "CUPCAKEEEE!";
String instruction = "Hold Click";


void setup(){
  size(1920, 1280);
  background(255);
  //Cupcake.png(cupcake, 10, 20, 90, 60);
  
  imageMode(CENTER); //centers photo
  textAlign(CENTER);
  textSize(88);
  cupcake = loadImage("cupcake.png");
  Broly = loadImage("Broly.jpg");
  hand = loadImage("hand.jpg");
}



void draw(){
    
  
  background(255);
    fill(opacity);
    
    
  //Cupcake.png(cupcake, 10, 20, 90, 60);

  //image(Broly,width/2,height/2);
  image(cupcake,width/2,height/2);
  text(instruction, width/2, height/2 - 50);
  

   
    
  
    if(mousePressed){
      image(hand, (width/2) -30, height/2, 500,300);
      image(cupcake, width/2, fall);
      
      if (fall < height/2){
        fall += 2;
      }
       if(fall == 640){
         translate(random(-20, 100), random(-20,100));
         image(Broly,width/2,height/2);
    
    
    text(quote, width/2, height/2 - 50);
    opacity = opacity + fade;
         if (opacity > 255 || opacity < 0){
      
            fade = -fade;
    }
  }
    }
  else{
    fall = 0;
  }
 
}
