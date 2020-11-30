class Player {
  int[] c = {int(random(255)), int(random(255)), int(random(255))};
  
  Player() {
  }
  
  void drawP(){
    translate(width/2, height/2, 300);
    noFill();
    polygon(0,0,playerRadius+10,npolygon);
    fill(c[0],c[1],c[2]);
    stroke(c[0],c[1],c[2]);
    circle(cos(radians(theta))*playerRadius, sin(radians(theta))*playerRadius, 10);
  }
  
}
