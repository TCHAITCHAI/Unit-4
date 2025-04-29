color beige = #fdf065;
color red = #c1131f;
color black = #000000;
color blue =#669bbc;

void setup(){
  size(800,600);
}

void draw(){
  background(beige);
  face(200,100);

}

void face(int x, int y) {
  pushMatrix();
  translate(x, y);
  
  skin();
  hair();
  eye(100,200);
  //eye();
  //mouth();
  
  popMatrix();
}

void skin(){
  fill(blue);
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

strokeWeight(3);
}

void eye(int x, int y){
  fill(beige);
  ellipse(x,y,100,50);
  fill(red);
  circle(x,y,50);
  fill(black);
  circle(x,y,25);
}

  
  
  
