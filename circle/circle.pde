int diam = 10; 
float centX,centY;

void setup[]{
size [500, 300];
framerate[24];
smooth[];
background[180];
centX = width/2;
centY = width/2;
stroke[0];
strokeWeight[1];
noFill[];
}

void draw[]{
 if[diam <=400]{
   ellipse(centX,CentY,diam,diam);
   diam=+10;
 }
}
