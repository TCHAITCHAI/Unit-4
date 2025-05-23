color court = #935B00;
color white = #FFFFFF;
color red = #D32F2F;
color blue = #1976D2;
color green = #388E3C;
color yellow = #FBC02D;
color purple = #7B1FA2;
color orange = #F57C00;

color darkBrown = #3E2723;
color tan = #FFCC99;
color wheat = #F5DEB3;

color black = #000000;
color brown = #4E342E;
color lightBrown = #A1887F;
color blonde = #FFC107;

color darkBlue = #1565C0;
color darkGreen = #2E7D32;
color deepBrown = #5D4037;

color pink = #880E4F;
color gray = #969696;

void setup() {
  size(1500, 900);
  background(0);
  fill(court);
  rect(0, 480, width, height - 480);
  drawCourtLines();
  
int totalSeats = 15 * 4; 
int seatsPlaced = 0;

while (seatsPlaced < totalSeats) {
  int row = seatsPlaced / 15;
  int col = seatsPlaced % 15;

  float left = 50;
  float top = 30;
  float max = 480;
  float seatW = (width - 2 * left) / 14.0;
  float seatH = (max - top) / 4.0;

  float x = left + col * seatW;
  float y = top + row * seatH;
  float s = random(0.9, 1.1);

  audience(x, y, s);
  seatsPlaced++;
}


  int playersPlaced = 0;
  int totalPlayers = 10;

  while (playersPlaced < totalPlayers) {
  float px = random(100, width - 100);
  float py = random(500, 880);
  player(px, py);
  playersPlaced++;
}

  
  int refs = 0;
  int totalRefs = 2;

  while (refs < totalRefs) {
    float rx = random(100, width - 100);
    float ry = random(500, 880);
    ref(rx, ry);
    refs++;
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

  color[] skinTones = { darkBrown, tan, wheat };
  color skin = skinTones[int(random(skinTones.length))];

  color[] hairColors = { black, brown, lightBrown, blonde, white };
  color hair = hairColors[int(random(hairColors.length))];

  color[] eyeColors = { darkBrown, darkBlue, darkGreen, deepBrown };
  color eye = eyeColors[int(random(eyeColors.length))];

  color[] shirtColors = { red, blue, green, yellow, purple, orange };
  color shirt = shirtColors[int(random(shirtColors.length))];

  drawHead(skin);
  drawHair(hair);
  drawEyes(eye);
  drawNose(skin);
  drawMouth();
  drawTorso(shirt);
  drawArms(shirt);

  popMatrix();
}

void drawHead(color skin) {
  noStroke();
  fill(skin);
  ellipse(0, 0, 50, 60);
}

void drawHair(color hair) {
  fill(hair);
  arc(0, -10, 60, 50, PI, TWO_PI);
}

void drawEyes(color eye) {
  fill(255);
  ellipse(-12, -5, 12, 8);
  ellipse(12, -5, 12, 8);
  fill(eye);
  ellipse(-12, -5, 6, 6);
  ellipse(12, -5, 6, 6);
  fill(0);
  ellipse(-12, -5, 3, 3);
  ellipse(12, -5, 3, 3);
}

void drawNose(color skin) {
  stroke(skin);
  strokeWeight(2);
  fill(skin);
  triangle(0, -2, -4, 10, 4, 10);
}

void drawMouth() {
  noFill();
  stroke(pink);
  strokeWeight(2);
  arc(0, 18, 20, 10, 0, PI);
}

void drawTorso(color shirt) {
  noStroke();
  fill(shirt);
  rectMode(CENTER);
  rect(0, 50, 30, 40, 5);
}

void drawArms(color shirt) {
  stroke(shirt);
  strokeWeight(4);
  line(-15, 40, -30, 60);
  line(15, 40, 30, 60);
}

void player(float x, float y) {
  pushMatrix();
  translate(x, y);
  float s = random(0.9, 1.2); 
  scale(s);

  // Randomize appearance
  color[] jerseyColors = { #D50000, #2962FF, #00C853, #FFD600, #6A1B9A, #FF6D00 };
  color[] skinTones = { darkBrown, tan, wheat };

  color jersey = jerseyColors[int(random(jerseyColors.length))];
  color skin = skinTones[int(random(skinTones.length))];
  int number = int(random(0, 100));  // Jersey number

  // Draw directly
  drawPlayerHead(skin);
  drawPlayerBody(jersey);
  drawPlayerArms(jersey);
  drawPlayerLegs(jersey);
  drawJerseyNumber(number);

  popMatrix();
}

void drawPlayerHead(color skin) {
  noStroke();
  fill(skin);
  ellipse(0, 0, 40, 45);
}

void drawPlayerBody(color jersey) {
  fill(jersey);
  rectMode(CENTER);
  rect(0, 40, 25, 35, 5);
}

void drawPlayerArms(color jersey) {
  stroke(jersey);
  strokeWeight(3);
  line(-12, 30, -25, 50);  
  line(12, 30, 25, 50);  
}

void drawPlayerLegs(color jersey) {
  stroke(jersey);
  strokeWeight(3);
  line(-7, 55, -7, 75);  
  line(7, 55, 7, 75);  
}

void drawJerseyNumber(int number) {
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(14);
  text(str(number), 0, 40);
}


void ref(float x, float y) {
  pushMatrix();
  translate(x, y);
  float s = random(1.0, 1.2);
  scale(s);

  color[] skinTones = { darkBrown, tan, wheat };
  color skin = skinTones[int(random(skinTones.length))];

  drawRefHead(skin);
  drawRefShirt();
  drawRefStripes();
  drawRefArms();
  drawRefLegs();
  drawWhistle();

  popMatrix();
}

void drawRefHead(color skin) {
  noStroke();
  fill(skin);
  ellipse(0, 0, 40, 45);
}

void drawRefShirt() {
  fill(white);
  rectMode(CENTER);
  rect(0, 40, 30, 35);
}

void drawRefStripes() {
  int stripeX = -13;
  while (stripeX < 15) {
    stroke(black);
    strokeWeight(2);
    line(stripeX, 22, stripeX, 58);
    stripeX += 6;
  }
}

void drawRefArms() {
  stroke(black);
  strokeWeight(3);
  line(-12, 30, -25, 50);
  line(12, 30, 25, 50);
}

void drawRefLegs() {
  stroke(black);
  strokeWeight(3);
  line(-7, 55, -7, 75);
  line(7, 55, 7, 75);
}

void drawWhistle() {
  fill(150);
  noStroke();
  ellipse(0, 15, 6, 6);
  rect(-3, 14, 6, 3);
}
