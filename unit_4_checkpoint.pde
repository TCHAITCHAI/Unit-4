color beige = #fdf065;
color red = #c1131f;
color black = #000000;
color blue =#669bbc;

void setup(){
  size(800,600);
}

void draw(){
  background(beige);
  
  //face
  fill(blue);
  stroke(black);
  strokeWeight(3);
  rect(200,100,400,500);
  
  //hair
  strokeWeight(25);
  int x = 200; 
  while (x <= 600) {
    line(x, 50, x, 150);
    x = x + 50;
  }
  
  //put strokeWeight back to normal
  strokeWeight(3);
  
  //left eye 
  fill(beige);
  ellipse(300,300,100,50);
  fill(red);
  circle(300,300,50);
  fill(black);
  circle(300,300,25);
  
  //right eye
  fill(beige);
  ellipse(500,300,100,50);
  fill(red);
  circle(500,300,50);
  fill(black);
  circle(500,300,25);
  
  //mouth
  fill(beige);
  rect(300,350,200,100);
  line(300,400,500,400);
  line(350,350,350,450);
  line(400,350,400,450);
  line(450,350,450,450);
  
}
