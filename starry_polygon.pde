int polygonSides = 5; // Altere para valores maiores ou iguais a 5 para aumentar.

int side = 500;
float middleRadius = 100;
float minRadius = 0;
float maxRadius = side / 2;

void setup() {
  size(500, 500);
}

void vertexFixedPoint(int i) {
    // OBS: o ajuste TWO_PI/4 faz com que a estrela não fique torta na tela. 
    float angle1 = i * (TWO_PI / polygonSides) - (TWO_PI / 4);
    float x1 = middleRadius * cos(angle1);
    float y1 = middleRadius * sin(angle1);
    
    float angle2 = (i + 1) * (TWO_PI / polygonSides) - (TWO_PI / 4);
    float x2 = middleRadius * cos(angle2);
    float y2 = middleRadius * sin(angle2);
    
    float x = x1 + (x2 - x1) / 2;
    float y = y1 + (y2 - y1) / 2;
    vertex(x, y);
    
}

void draw() {
  background(200);
  float variant = round(map(mouseY, 0, height, middleRadius, maxRadius));
  translate(width/2, height/2);
  beginShape();
  for (int i = 0; i < polygonSides; i++) {
    float angle = i * (TWO_PI / polygonSides) - (TWO_PI / 4);
    float x = variant * cos(angle);
    float y = variant * sin(angle);
    vertex(x, y);
    vertexFixedPoint(i);
  }
  endShape(CLOSE);
}
