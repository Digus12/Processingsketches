float r1 =200;
float r2 =200; 
float m1 = 40; 
float m2 =40; 
float a1 = PI/4; 
float a2 = PI/8;
float a1_v = 0;
float a2_v = 0;
float a2_a = 0.01;
float a1_a = -0.0001;
float g = 1; 
 
PGraphics canvas;
void setup (){
  size(600,600);
  canvas = createGraphics(600,600);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
  canvas.translate(300,60);
  
}


void draw() {
 float num1= -g *(2 *m1 +m2) *sin(a1);
  float num2 = -m2 * g * sin(a1-2*a2);
  float num3 = -2 *sin(a1-a2)*m2;
  float num4 = a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2);
  float den = r2 * (2*m1 + m2 -m2*cos(2*a1 -2*a2));
  a1_a =( num1 +num2 +num3 * num4 )/ den;
  a2_a =0;
  num1= 2 * sin(a1-a2);
  num2 = (a1_v*a1_v*r1*(m1+m2));
  num3=g *(m1 + m2) *cos(a1);
  num4= a2_v*a2_v*r2*m2*cos(a1-a2);
  den = r1 * (2*m1 + m2 -m2*cos(2*a1 -2*a2));
  image(canvas,0,0);
  float a2_a = (num1*(num2+num3+num4))/ den;
 // background(255);
  strokeWeight(2);
  translate(300,50);
  float x1 = r1 *sin(a1);
  float y1 =r1 *cos(a1);
  
  float x2 = y1 +r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  
  line(0,0,x1,y1);
  fill(0);
  ellipse(x1,y1,m1,m1);
  
    line(0,0,x2,y2);
  fill(0);
  ellipse(x2,y2,m2,m2);
 a1_v += a1_a;
 a2_v += a2_a; 
  a1 += 0.1;
  a2 -= 0.2;
  
  
canvas.beginDraw();
canvas.translate(300,50);
  canvas.point(x2,y2);
canvas.strokeWeight(4);
  canvas.stroke(0);
  canvas.endDraw();
  
}
