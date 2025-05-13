color court = #935B00;
color white = #FFFFFF;
color red = #D32F2F;
color blue = #1976D2;
color green = #388E3C;
color yellow = #FBC02D;
color purple = #7B1FA2;
color orange = #F57C00;

void setup() {
  size(1500, 900);
  background(0);
  fill(court);
  rect(0, 480, width, height - 480);
  drawCourtLines();

  int cols = 15;
  int rows = 6;
  float left = 50;
  float top = 30;
  float max = 480;

  float seatW = (width - 2 * left) / (cols - 1);
  float seatH = (max - top) / (rows - 1);

  // Draw audience
  for (int r = 0; r < rows - 1; r++) {
    float y = top + r * seatH;
    for (int c = 0; c < cols; c++) {
      float x = left + c * seatW;
      float s = random(0.9, 1.1);
      audience(x, y, s);
    }
  }

  // Draw players just once
  int totalPlayers = 10;
  for (int i = 0; i < totalPlayers; i++) {
    float px = random(100, width - 100);
    float py = random(500, 880);
    player(px, py);
  }
}


void drawCourtLines() {
  stroke(white);
  strokeCap(SQUARE);
  strokeWeight(7);
  circle(0, 690, 380);
  circle(1500, 690, 380);
  line(0, 690, 10, 690);
  circle(30, 690, 40);
  circle(1470, 690, 40);
  line(1490, 690, 1500, 690);
  line(0, 620, 150, 620);
  line(0, 760, 150, 760);
  line(150, 617, 150, 763);
  line(1500, 620, 1350, 620);
  line(1500, 760, 1350, 760);
  line(1350, 617, 1350, 763);
  line(750, 480, 750, 900);
  circle(750, 690, 150);
}



void audience(float x, float y, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  body(); 
  popMatrix();
}

void body() {
  color[] skinTones = { #3E2723, #FFCC99, #F5DEB3 };
  color skin = skinTones[int(random(skinTones.length))];

  color[] hairColors = { #000000, #4E342E, #A1887F, #FFC107, #FFFFFF };
  color hair = hairColors[int(random(hairColors.length))];

  color[] eyeColors = { #3E2723, #1565C0, #2E7D32, #5D4037 };
  color eye = eyeColors[int(random(eyeColors.length))];

  color[] shirtColors = {
    red, blue, green, yellow, purple, orange 
  };
  color shirt = shirtColors[int(random(shirtColors.length))];

  noStroke();
  // Head
  fill(skin);
  ellipse(0, 0, 50, 60);

  // Hair
  fill(hair);
  arc(0, -10, 60, 50, PI, TWO_PI);

  // Eyes
  fill(255);
  ellipse(-12, -5, 12, 8);
  ellipse( 12, -5, 12, 8);
  fill(eye);
  ellipse(-12, -5, 6, 6);
  ellipse( 12, -5, 6, 6);
  fill(0);
  ellipse(-12, -5, 3, 3);
  ellipse( 12, -5, 3, 3);

  // Nose
  stroke(skin);
  strokeWeight(2);
  fill(skin);
  triangle(0, -2, -4, 10, 4, 10);

  // Mouth
  noFill();
  stroke(#880E4F);
  strokeWeight(2);
  arc(0, 18, 20, 10, 0, PI);

  // body
  noStroke();
  fill(shirt);
  rectMode(CENTER);
  rect(0, 50, 30, 40, 5);        
  stroke(shirt);
  strokeWeight(4);
  line(-15, 40, -30, 60);        
  line(15, 40, 30, 60);        
  rectMode(CORNER);
}

void player(float x, float y) {
  pushMatrix();
  translate(x, y);
  float s = random(0.9, 1.2); 
  scale(s);

  color[] jerseyColors = { #D50000, #2962FF, #00C853, #FFD600, #6A1B9A, #FF6D00 };
  color[] skinTones = { #3E2723, #FFCC99, #F5DEB3 };

  color jersey = jerseyColors[int(random(jerseyColors.length))];
  color skin = skinTones[int(random(skinTones.length))];

  noStroke();

  // Head
  fill(skin);
  ellipse(0, 0, 40, 45);

  // Body
  fill(jersey);
  rectMode(CENTER);
  rect(0, 40, 25, 35, 5);

  // arms
  stroke(jersey);
  strokeWeight(3);
  line(-12, 30, -25, 50);  
  line(12, 30, 25, 50);   

  // legs
  line(-7, 55, -7, 75);  
  line(7, 55, 7, 75);      
  
  // Jersey number
  fill(0);  
  textAlign(CENTER, CENTER);
  textSize(14);
  int number = int(random(0, 100));  // random number 
  text(str(number), 0, 40); 

  popMatrix();
}






// mouse cords
void draw() {
  textSize(18);

  // Draw a white rectangle to cover old text
  noStroke();
  fill(255);
  rect(width - 120, 0, 120, 30);

  // Draw updated coordinates on top
  fill(0);
  textAlign(RIGHT, TOP);
  text("X: " + mouseX + "  Y: " + mouseY, width - 10, 10);
}
