class Player {
  //Atributos
  color c;
  float radius;
  float angle;

  //Constructor
  Player(float r, float a,color c1) {
    radius = r;
    angle = a;
    c=c1;
  }

  //Métodos
  void drawP() {
    translate(width/2, height/2, 300);
    fill(c);
    stroke(c);
    circle(cos(radians(angle))*radius, sin(radians(angle))*radius, playerSize);
    if (radians(angle)%TWO_PI == 0) {
      angle = 0;
    }
  }

  void keyPressed1() {
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == LEFT) {
          angle += 1.5;
        } else if (keyCode == RIGHT) {
          angle -= 1.5;
        }
      }
    }
  }

  void Mouse() {
    if (mousePressed) {
      if (mouseButton == RIGHT) {
        angle -= 1.5;
      } else if (mouseButton == LEFT) {
        angle += 1.5;
      }
    }
  }
}
