ChichoTile[][] casilla;
//float m = map (value, 0, width, 0, 100);
float rd;

void setup(){
  size(450, 450);
  background(255);
  
  int n = 10;
  int col = width/n;
  int row = height/n;
  
  casilla = new ChichoTile[col][row];
  
  float factor = 16;
  
  color c1 = #ff0000;
  color c2 = #000000;
  
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      // Initialize each object
      casilla[i][j] = new ChichoTile (i*col, j*row, col, row, factor, c1, c2);
      //casilla[i][j].display3();
      rd=random(-1, 1);
      if (rd<0) {
        casilla[i][j].display3();
      }
      else {
        casilla[i][j].display2();
      }
    }
  }
}

// A Truchet object
class ChichoTile{
  
  float x, y;   // x,y location
  float w, h;   // width and height
  float m;
  color color1, color2;
  
  // Truchet Constructor
  ChichoTile (float tempX, float tempY, float tempW, float tempH, float tempM, color tempC1, color tempC2){
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    m = tempM;
    color1 = tempC1;
    color2 = tempC2;   
  }
  
  void display1(){
    noStroke();
    fill(color1);
    diagonalA (x, y, w, h, m);
   
    noStroke();
    fill(color2);
    cornersA (x, y, w, h, m);
  }
  
  void display2(){
    noStroke();
    fill(color2);
    diagonalA (x, y, w, h, m);
    
    noStroke();
    fill(color1);
    cornersA (x, y, w, h, m);
  }
  
  void display3(){
    noStroke();
    fill(color2);
    diagonalB (x, y, w, h, m);
    
    noStroke();
    fill(color1);
    cornersB (x, y, w, h, m);
  }
  
  void display4(){
    noStroke();
    fill(color1);
    diagonalB (x, y, w, h, m);
   
    noStroke();
    fill(color2);
    cornersB (x, y, w, h, m);
  }
  

  
  void diagonalA (float x, float y, float w, float h, float m){
    beginShape();
      vertex(x+0, y+0);
      vertex(x+m, y+0);
      vertex(x+w, y+h-m);
      vertex(x+w, y+h);
      vertex(x+w-m, y+h);
      vertex(x+0, y+m);
    endShape(CLOSE);
  }
  
  void cornersA (float x, float y, float w, float h, float m){
    triangle(x+w-m, y+0, x+w, y+0, x+w, y+m);
    triangle(x+0, y+h-m, x+m, y+h, x+0, y+h);
  }
  
  void diagonalB (float x, float y, float w, float h, float m){
    beginShape();
      vertex(x+w-m, y+0);
      vertex(x+w, y+0);
      vertex(x+w, y+m);
      vertex(x+m, y+h);
      vertex(x+0, y+h);
      vertex(x+0, y+h-m);
    endShape(CLOSE);
  }
  
  void cornersB (float x, float y, float w, float h, float m){
    triangle(x+0, y+0, x+m, y+0, x+0, y+m);
    triangle(x+w, y+h-m, x+w, y+h, x+w-m, y+h);
  }
  
}