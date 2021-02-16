//3 Primitive shapes by Steven Lui

float r = 230;
float g = 33;
float b = 77;

void setup(){
  
  size(1080, 720);
}

void draw(){

noStroke();
triangle(-10, 220, 500, 50,900, 800);


fill(r, g ,b);

quad(20, 100, 30, 30, 600, 600, 100, 600);

stroke(0);
fill(g, g ,b);

strokeWeight(3);



rect(600,400, 600, height/3);
fill(g, g ,g);
}
