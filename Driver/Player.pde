/**
 *This class define objects that represents the player
 */
class Player {
  //Instances
  color c;
  float radius;//Distance to the origin
  float angle;//Pos theta with respect to the x-axis

  /**
  *Constructor
  *@param r defines the player movement radius inside the tunnel
  *@param a defines the player initial angle inside the tunnel
  *@param c defines the player color
  */
  Player(float r, float a, color c) {
    radius = r;
    angle = a;
    this.c = c;
  }

  //Methods
  /**
   *This method draws the player inside the tunnel
   */
  void drawP() {
    translate(width/2, height/2, 300);
    fill(c);
    stroke(c);
    circle(cos(radians(angle))*radius, sin(radians(angle))*radius, playerSize);
    if (radians(angle)%TWO_PI == 0) {
      angle = 0;
    }
  }

  /**
   *Player movement is controled with keyboard keys (right and left arrows)
   */
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

  /**
   *Player movement is controled with the mouse
   */
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
