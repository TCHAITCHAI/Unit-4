color beige = #fdf065;
color red = #c1131f;
color black = #000000;
color blue =#669bbc;

float x; 
void setup(){
  background(beige);
  size(800,600);
  int count = 0;
  while (count < 1000){
  face(random(200,700),random(0,600),random(0.1,1));
  count = count + 1;
  }
}



void face(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  rotate(PI/random(5));
  scale(s);
  
  skin();
  hair();
  float r,g,b;
  r = random(0,255);
  g = random(0,255);
  b = random(0,255);
  eye(100,200,r,g,b);
  eye(300,200,r,g,b);
  mouth();
  
  popMatrix();
}

void skin(){
  fill(random(255), random(255), random(255));
  stroke(black);
  strokeWeight(3);
  rect(0,0,400,400);
}

void hair(){
  strokeWeight(25);
  int x = 0; 
  while (x <= 400) {
    line(x, -50, x, 50);
    x = x + 50;
  }

strokeWeight(random(20));
}

void eye(float x, float y, float r, float g, float b){
  fill(beige);
  ellipse(x,y,100,50);
  fill(r,g,b);
  circle(x,y,50);
  fill(black);
  circle(x,y,25);
}

void mouth(){
  fill(beige);
  rect(100,250,200,100);
  line(100,300,300,300);
  line(150,250,150,350);
  line(200,250,200,350);
  line(250,250,250,350);
}
  
  
  
