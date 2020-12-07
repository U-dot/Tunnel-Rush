/**
 *This class define objects that represents the obstacles placed inside the tunnel
 */
class Obstacle {
  //Instances
  float angle;//Pos theta with respect to the x-axis
  int posZ;
  int type;//Number of sides of the obstacle(3 or 4)
  int number;//Number of sub-obstacles
  int radius = playerRadius;//Distance to the origin
  int size = playerRadius/3;
  int deepness = 20;
  color c = color(int(random(255)) , int(random(255)), int(random(255)) );
  float[] oba;//Saves the angles of each sub-obstacle

  /**
   *Constructor
   *@param posZ defines obstacles z position
   *@param angle defines obstacles angle inside the tunnel
   *@param type defines obstacles form
   *@param number defines number of obstacles to be represented
   */
  Obstacle(int posZ, float angle, int type, int number) {
    this.posZ = posZ;
    this.angle = angle;
    this.type = type;
    this.number = number;
    oba = new float[number];
    for (int i = 0; i < number; i++) {//Angle of each substacle
      oba[i] = angle+TWO_PI/number*(i+1);
    }
  }

  //Methods
  /**
   *This method calls the function polygon3D() to create the obstacles and set them in order inside the tunnel 
   */
  void display() {
    push();
    stroke(0);
    fill(c);
    translate(width/2, height/2, z - posZ*distanceTunnel);
    for (int i = 0; i < number; i++) {
      polygon3D(oba[i], type, radius, size, deepness, true);
    }
    pop();
  }
}
