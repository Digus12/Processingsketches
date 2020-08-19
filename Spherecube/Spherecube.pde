PGraphics cube; 
PGraphics sphere;
void setup(){
 size(600,800,P3D);
 cube =createGraphics(width,height,P3D);
 sphere =createGraphics(width,height,P3D);
 
}

void draw(){
 background(0);
 drawCube();
 drawSphere();
  image(cube,0,0);
  image(sphere,0,0);
  
}

void drawCube(){
 cube.beginDraw();
 cube.lights();
 cube.background(0);
 cube.noStroke();
 cube.translate(width/2,height/2);
 cube.rotateX(frameCount/100.00);
 cube.rotateZ(frameCount/200.00);
  cube.box(50);
  cube.endDraw();
  
  
}
void drawSphere(){
 sphere.beginDraw();
 sphere.lights();
 sphere.background(0);
 sphere.noStroke();
 sphere.translate(width/2,height/2);
 sphere.rotateX(frameCount/100.00);
 sphere.rotateY(frameCount/200.0);
 sphere.sphere(50);
 sphere.endDraw();
 
}
