void drawTunnel(int numberTunnels) {
  for (int j = 0; j < numberTunnels; j++) {
    push();
    camera();
    translate((j*2+1)*width/2/numberTunnels, height/2, z);
    stroke(255);
    noFill();
    for (int i = -3; i <= lengthTunnel; i++) {
      //stroke(int(random(255)), int(random(255)), int(random(255)));
      translate(0, 0, -i*distanceTunnel);
      if(controls[1] == 0){
      circle( cos(radians(P1.angle))*playerRadius/numberTunnels, sin(radians(P1.angle))*playerRadius/numberTunnels, playerSize/numberTunnels);
      } else if(controls[1] == 1) {
      circle( cos(radians(P2.angle))*playerRadius/numberTunnels, sin(radians(P2.angle))*playerRadius/numberTunnels, playerSize/numberTunnels);
      circle( cos(radians(P1.angle))*playerRadius/numberTunnels, sin(radians(P1.angle))*playerRadius/numberTunnels, playerSize/numberTunnels);
      }
      polygon((playerRadius+playerSize)/numberTunnels, sidesTunnel);
      polygon3D(0, sidesTunnel, 0, playerRadius+playerSize, distanceTunnel, false);
      translate(0, 0, i*distanceTunnel);
    }
    pop();
  }
}

void polygon(float apotema, int npoints) {
  float angle = TWO_PI / npoints;
  float radius = apotema/cos(angle/2);
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = cos(a) * radius;
    float sy = sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}//A partir de ejemplo de Processing

void polygon3D(float angle1, int type, int radius, int size, int deepness, boolean cover) {
  float angle2 = TWO_PI / type;
  float radiusPoly=size/cos(angle2/2);
  float x = cos(angle1)*radius;
  float y = sin(angle1)*radius;
  push();
  translate(x, y);
  rotate(PI/4);
  if (type == 3) {
    rotate(angle1+PI/type-PI/4);
  }//Lo único que diferencia tri de cuatro
  if (cover) {
    polygon(size, type);
  } else {
    //fill(0);
    rotate(TWO_PI/sidesTunnel);
  }
  float sx, sy, a=0;
  float sx1 = cos(a) * radiusPoly;
  float sy1 = sin(a) * radiusPoly;
  while (a < TWO_PI) {
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
