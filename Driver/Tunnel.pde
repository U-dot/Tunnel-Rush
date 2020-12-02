void drawTunnel() {
  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
  //camera(mouseX*2, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  //Descomentar lo anterior para ver el tunel desde afuera
  push();
  translate(width/2, height/2, z);
  stroke(255);
  noFill();
  for (int i=-3; i<=lengthTunnel; i++) {
    translate(0, 0, -i*distanceTunnel);
    circle( cos(radians(theta))*playerRadius, sin(radians(theta))*playerRadius, 10);
    polygon( playerRadius+10, npolygon);
    translate(0, 0, i*distanceTunnel);
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
