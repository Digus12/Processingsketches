float angle = 0;
PVector[] points = new PVector[8];
float[][]projection = {
 {1,0,0},
 {0,1,0}
  
};

void setup(){
 size(600,400); 
 
 
  points[0] = new PVector(-0.5, -0.5, -0.5);
  points[1] = new PVector(0.5, -0.5, -0.5);
  points[2] = new PVector(0.5, 0.5, -0.5);
  points[3] = new PVector(-0.5, 0.5, -0.5);
  points[4] = new PVector(-0.5, -0.5, 0.5);
  points[5] = new PVector(0.5, -0.5, 0.5);
  points[6] = new PVector(0.5, 0.5, 0.5);
  points[7] = new PVector(-0.5, 0.5, 0.5);
}

void draw(){
  
  background(0); 
  translate(width/2,height/2);

  
  
  float[][] rotationZ = {
    { cos(angle), -sin(angle), 0},
    { sin(angle), cos(angle), 0},
    { 0, 0, 1}
  };

  float[][] rotationX = {
    { 1, 0, 0},
    { 0, cos(angle), -sin(angle)},
    { 0, sin(angle), cos(angle)}
  };

  float[][] rotationY = {
    { cos(angle), 0, sin(angle)},
    { 0, 1, 0},
    { -sin(angle), 0, cos(angle)}
  };
  
  PVector[] projected = new PVector[8];
 int index = 0;
  for (PVector v : points) {
    PVector rotated = matmul(rotationY, v);
    rotated = matmul(rotationX, rotated);
    rotated = matmul(rotationZ, rotated);
    PVector projected2d = matmul(projection, rotated);
    projected2d.mult(700);
    projected[index] = projected2d;
    //point(projected2d.x, projected2d.y);
    index++;
  }

  for (PVector v : projected) {
    stroke(255);
    strokeWeight(16);
    noFill();
    point(v.x, v.y);
  }

  // Connecting
  for (int i = 0; i < 4; i++) {
    connect(i, (i+1) % 4, projected);
    connect(i+4, ((i+1) % 4)+4, projected);
    connect(i, i+4, projected);
  }





  angle += 0.06;
}

void connect(int i, int j, PVector[] points) {
  PVector a = points[i];
  PVector b = points[j];
  strokeWeight(1);
  stroke(255);
  line(a.x, a.y, b.x, b.y);
}
float[][] vecToMatrix(PVector v) {
  float[][] m = new float[3][1];
  m[0][0] = v.x;
  m[1][0] = v.y;
  m[2][0] = v.z;
  return m;
}

PVector matrixToVec(float[][] m) {
  PVector v = new PVector();
  v.x = m[0][0];
  v.y = m[1][0];
  if (m.length > 2) {
    v.z = m[2][0];
  }
  return v;
}

void logMatrix(float[][] m) {
  int cols = m[0].length;
  int rows = m.length;
  println(rows + "x" + cols);
  println("----------------");
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      print(m[i][j] + " ");
    }
    println();
  }
  println();
}


PVector matmul(float[][] a, PVector b) {
  float[][] m = vecToMatrix(b);
  return matrixToVec(matmul(a,m));
}

float[][] matmul(float[][] a, float[][] b) {
  int colsA = a[0].length;
  int rowsA = a.length;
  int colsB = b[0].length;
  int rowsB = b.length;

  if (colsA != rowsB) {
    println("Columns of A must match rows of B");
    return null;
  }

  float result[][] = new float[rowsA][colsB];

  for (int i = 0; i < rowsA; i++) {
    for (int j = 0; j < colsB; j++) {
      float sum = 0;
      for (int k = 0; k < colsA; k++) {
        sum += a[i][k] * b[k][j];
      }
      result[i][j] = sum;
    }
  }
  return result;
}
