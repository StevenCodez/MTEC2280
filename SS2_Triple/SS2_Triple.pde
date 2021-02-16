//Steven Lui "Triple 
//Hold left click and can press


float r = random(0, 255);
float g = random(0, 255);
float b = random(0, 255);

void setup (){
  size(700, 700);
  rectMode(CENTER);
}

void draw(){
  background(r,g,b);
  
  //if mouse is on right side fo screen, draw red ellipse
 if(mousePressed){//this goes over whatever you want pressed to affect
 if(mouseX>400){
   fill(r,0,b);
   ellipse(width/2, 400,100,100);
 
 }
 else if(mouseY >500){
   //draw rectangle
   fill(0);
   rect(100, 600, 100, 100);
 }
   else{
     fill(random(0,255));
     rect(600, 100, 100, 100);
   }
 }
}

void mousePressed(){
   r = random(0, 255);
   g = random(0, 255);
   b = random(0, 255);
   
   
   
}
