import processing.opengl.*;
int rad = 200;

void setup(){
 size(800,600,OPENGL);
 background(255);
 stroke(0);
 
  
}

void draw(){
 translate(width/2,height/2,0);
 rotateY(frameCount * 0.02);
 rotateX(frameCount * 0.02);
  float sa =0; 
  float ta = 0; 
  float absx =0; 
  float absy = 0; 
  float absz = 0; 
  while (ta <180) {
    sa +=36;
    ta +=36;
    float radTA = radians(ta);
    float radSA = radians(sa);
    
    float curx = 0 + (rad * cos(radSA) * sin(radTA));
    float cury = 0 + (rad * sin(radSA) * cos(radTA));
    float curz = 0 + (rad *cos(radTA)* tan(radSA));
    
    if (absx != 0){
      line(curx,cury,curz,absx,absy,absz);
    }
absx= curx;
absy = cury;
absz = curz;
}
}
