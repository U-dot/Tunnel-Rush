/**
 *This function draws each polygon of the tunnel
 */
void drawTunnel() {
  push();
  translate(width/2, height/2, z);
  stroke(255);
  noFill();
  for (int i = -3; i <= lengthTunnel; i++) {
    stroke(int(random(255)), int(random(255)), int(random(255)));
    translate(0, 0, -i*distanceTunnel);
    //polygon((playerRadius+playerSize), sidesTunnel);
    polygon3D(0, sidesTunnel, 0, playerRadius+playerSize, distanceTunnel, false);
    translate(0, 0, i*distanceTunnel);
  }
  pop();
}

/**
 *This function draws an empty n-polygon
 *@param apotema defines the n-poligon apothem
 *@param npoints defines the n-poligon number of vertexes
 */
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

/**
 *This function calls the polygon() function to draws a n-polygon with deepness
 *@param angle1 defines the n-polygon rotation angle
 *@param type defines the the n-polygon number of sides
 *@param radius defines the distance within the n-polygon and the origin
 *@param size defines the n-polygon size
 *@param deepness defines the 3D n-poligon deepness
 *@param cover defines if the 3D n-poligon has a cover or not
 */
void polygon3D(float angle1, int type, int radius, int size, int deepness, boolean cover) {
  float angle2 = TWO_PI / type;
  float radiusPoly=size/cos(angle2/2);
  float x = cos(angle1)*radius;
  float y = sin(angle1)*radius;
  push();
  translate(x, y);
  rotate(PI/4);
  if (type == 3) {//To adjust the triangle obstacles
    rotate(angle1+PI/type-PI/4);
  }
  if (cover) {
    polygon(size, type);
  } else if(!cover && (page == 2 || page == 3)) {
    fill(0);
    rotate(TWO_PI/sidesTunnel);
  }
  float sx, sy, a=0;
  float sx1 = cos(a) * radiusPoly;
  float sy1 = sin(a) * radiusPoly;
  while (a < TWO_PI) {//Draws the "deepness" of each side
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

/**
 *Compares the angles of the players and the obstacles immediately in
 *front of them to verify if they crash
 */
void wreck(Obstacle obstacle1, Player p) {
  boolean colission=false;
  for (int i = 0; i < obstacle1.number; i++) {
    if (abs(obstacle1.oba[i]%TWO_PI - radians(p.angle)%TWO_PI) %TWO_PI <= 0.46 ) {
      colission=true;
    }
    if ( abs(obstacle1.oba[i]%TWO_PI - radians(p.angle)%TWO_PI)%TWO_PI <= TWO_PI) {
      if ( abs(obstacle1.oba[i]%TWO_PI - radians(p.angle)%TWO_PI)%TWO_PI >= 5.8) {
        colission=true;
      }
    }
    if (colission) {
      if ((z-obstacle1.posZ*distanceTunnel)%100 >= 0) {
        if ( (z-obstacle1.posZ*distanceTunnel)%100 <= 20) {
          if ( z-obstacle1.posZ*distanceTunnel >= 299) {
            page = 3;
          }
        }
      }
    }
  }
}
