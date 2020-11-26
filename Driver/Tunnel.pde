void drawTunnel(){
  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
  camera(mouseX, height/2, (height/2) / tan(PI/6), 
          width/2, height/2, 0,
          0, 1, 0);
  //Comentar el siguiente para ver el tunel desde afuera
  camera();
  translate(width/2, height/2, -100+z);
  stroke(255);
  noFill();
  for(int i=0;i<10;i++){
    translate(0,0,-i*100);
    circle( cos(radians(theta))*radius,
            sin(radians(theta))*radius,
            10);
    polygon(0,0,radius+10,npolygon);
  }
}

void polygon(float x, float y, float apotema, int npoints) {
  float angle = TWO_PI / npoints;
  float radius=apotema/cos(angle/2);
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}//A partir de ejemplo de Processing
