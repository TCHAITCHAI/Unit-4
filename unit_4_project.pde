color court = #935B00;



void setup() {
  size(1500, 900);
  
  // Draw court starting at y = 500
  background(0);
  fill(court);
  rect(0, 480, width, height - 480);
  
  // Audience grid parameters
  int cols    = 15;      // seats per row
  int rows    = 6;       // original number of rows
  float left = 50;      // left margin
  float top  = 30;      // starting y for back row
  float max = 480;     // bottom of audience area
  
  float seatW = (width - 2 * left) / (cols - 1);
  float seatH = (max - top) / (rows - 1);
  

  for (int r = 0; r < rows - 1; r++) {
    float y = top + r * seatH;
    for (int c = 0; c < cols; c++) {
      float x = left + c * seatW;
      float s = random(0.9, 1.1);
      audience(x, y, s);
    }
  }
}





void audience(float x, float y, float s){
  pushMatrix();
  translate(x,y);
  scale(s);
  face();
  //chair();
  popMatrix();
}

void face() {
  color[] skinTones = { #3E2723, #FFCC99, #F5DEB3 };
  color skin = skinTones[int(random(skinTones.length))];
  
  color[] hairColors = { #000000, #4E342E, #A1887F, #FFC107, #FFFFFF };
  color hair = hairColors[int(random(hairColors.length))];
  
  color[] irisColors = { #3E2723, #1565C0, #2E7D32, #5D4037 };
  color iris = irisColors[int(random(irisColors.length))];
  
  color[] shirtColors = {
    #D32F2F, // red
    #1976D2, // blue
    #388E3C, // green
    #FBC02D, // yellow
    #7B1FA2, // purple
    #F57C00  // orange
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
  fill(iris);
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
  
  // Body  
  noStroke();
  fill(shirt);
  rectMode(CENTER);
  rect(0, 50, 30, 40, 5);        // body
  stroke(shirt);
  strokeWeight(4);
  line(-15, 40, -30, 60);        // left arm
  line( 15, 40,  30, 60);        // right arm
  rectMode(CORNER);
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

  
  
  
