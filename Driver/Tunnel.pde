void drawTunnel() {
  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
  //camera(mouseX*2, mouseY*2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  camera(mouseX*4, mouseY*4, -716, width/2, height/2, 0, 0, 1, 0);

  //Descomentar lo anterior para ver el tunel desde afuera
  push();
  translate(width/2, height/2, z);
  stroke(255,0,0);//Red Y
  line(0,0,0,height);
  stroke(0,255,0);//Green X
  line(0,0,width,0);
  stroke(0,0,255);//Blue Z
  line(0,0,0,0,0,500);
  stroke(255);
  noFill();
  for (int i=0; i<=lengthTunnel; i++) {
    push();
    translate((distanceTunnel*lengthTunnel/TWO_PI)*sin(unitRotateTunnel*i),
              0,
             (distanceTunnel*lengthTunnel/TWO_PI)*cos(unitRotateTunnel*i));
    rotateY(PI/3*i*unitRotateTunnel+PI/2);//unitRotateTunnel);
    circle( cos(radians(theta))*playerRadius, sin(radians(theta))*playerRadius, 10);
    polygon( playerRadius+10, npolygon);
    pop();
  }
  pop();
}

void polygon( float apotema, int npoints) {
  float angle = TWO_PI / npoints;
  float radius=apotema/cos(angle/2);
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = cos(a) * radius;
    float sy = sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}//A partir de ejemplo de Processing

void polygon3D(float angle1,int type,int radius,int size,int deepness) {
  float angle2 = TWO_PI / type;
  float radiusPoly=size/cos(angle2/2);
  float x = cos(angle1)*radius;
  float y = sin(angle1)*radius;
  push();
  translate(x,y);
  rotate(PI/4);
  if(type==3){rotate(angle1+PI/type-PI/4);}//Lo único que diferencia tri de cuatro
  polygon(size,type);
  float sx,sy,a=0;
  float sx1 = cos(a) * radiusPoly;
  float sy1 = sin(a) * radiusPoly;

  while(a<TWO_PI){
    sx = sx1;
    sy = sy1;
    beginShape();
    vertex(sx, sy, 0);
    vertex(sx, sy, -deepness);
    a += angle2;
    sx1 = cos(a) * radiusPoly;
    sy1 = sin(a) * radiusPoly;
    vertex(sx1, sy1, -deepness);
    vertex(sx1, sy1, 0);
    vertex(sx, sy, 0);
    endShape(CLOSE);
  }
  pop();
}//A partir de ejemplo de Processing
void colision(Obstacle obs,Player p1){
  for(int i=0;i<obs.number;i++){
    float angleDummy=obs.angle+TWO_PI/obs.number*(i+1);
  }
}
