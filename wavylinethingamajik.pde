import peasy.*;

PeasyCam cam;

void setup(){
  size(800, 600, P3D);
  cam  = new PeasyCam(this, 800);
  noStroke();
}

void draw(){
  background(200);
  lights();
  
  drawCentralPlatform();
  
  drawBackWallElements();
  
  drawHexagonalGrid();
  
  drawFanShape();
  
  drawWaveLines();
  
  drawFloatingBoxes();
}

void drawCentralPlatform(){
  pushMatrix();
  translate(0, 100, 0);
  
  fill(139, 69, 19);
  box(40, 20, 40);
  
  int numPillars = 12;
  float radius = 100;
  for (int i = 0; i < numPillars; i++){
    float angle = TWO_PI / numPillars * i;
    float x = cos(angle) * radius;
    float z = sin(angle) * radius;
    
    fill(169, 169, 169);
    pushMatrix();
    translate(x, -10, z);
    box(20, 50, 20);
    popMatrix();
  }
  
  popMatrix();
}

void drawBackWallElements(){
  int[] positionX = {-200, 0, 200};
  int[] positionY = {-100, 0, 100};
  
  for(int x : positionX){
    for (int y : positionY){
      
      fill(0,0,255);
      pushMatrix();
      translate(x, y, -400);
      box(40);
      popMatrix();
      
      fill(255, 255, 0);
      pushMatrix();
      translate(x, y - 50, -350);
      rotateZ(PI / 4);
      box(60, 10, 10);
      popMatrix();
    }
  }
}

void drawHexagonalGrid(){
  int gridSize = 30;
  for (int y = -8; y <= 8; y++){
    for (int x = -8; x <= 9; x++){
      float offsetX = (y % 2) * gridSize/2;
      fill(34, 139, 34);
      pushMatrix();
      translate(x * gridSize + offsetX + 400, y * gridSize, 0);
      hexagon(gridSize/2);
      popMatrix();
    }
  }
}


void hexagon(float radius){
  beginShape();
  for (int i = 0; i < 6; i++){
    float angle = TWO_PI/6 * i;
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    vertex(x, y);
  }
  endShape(CLOSE);
}

void drawFanShape(){
  fill(138, 43, 226, 150);
  int numSlices = 20;
  float radius = 150;
  for (int i = 0; i < numSlices; i++){
    float angle1 = map(i, 0, numSlices, -PI/2, PI/2);
    float angle2 = map(i + 1, 0, numSlices, -PI/2, PI/2);
    beginShape();
    vertex(0, 0);
    vertex(cos(angle1) * radius, sin(angle1) * radius);
    vertex(cos(angle2) * radius, sin(angle2) * radius);
    endShape(CLOSE);
  }
}


void drawWaveLines(){
  noFill();
  strokeWeight(2);
  for (int i = 0; i < 10; i++){
    stroke(map(i, 0, 10, 0, 255), 0, 255 - map(i, 0, 10, 0, 255));
    beginShape();
    for (int x = -400; x <= 400; x += 10){
      float y = sin(x * 0.05 + i * PI/5 + frameCount * 0.05)*50;
      float z = i * 20 - 300;
      vertex(x, y, z);
    }
    endShape();
  }
}

void drawFloatingBoxes(){
  int numBoxes = 8;
  float spacing = 70;
  
  for(int i = 0; i < numBoxes; i++){
    fill(255, 165, 0);
    pushMatrix();
    translate(400, -150 + i * spacing, -200);
    box(30);
    popMatrix();
  }
}
