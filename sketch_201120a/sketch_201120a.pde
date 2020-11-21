int x,y,z;
int time=0, timeFrame=20,timeDiference=10;
boolean countingTime= false;//true;
void setup(){
  size(500,500,P3D);
  x = width/2;
  y = height/2;
  z = 0;
  frameRate(5);
}
void draw(){
  translate(x,y,0);
  background(255);
  noFill();
  for(int i=0;i<10-z;i++){
    print(i);
    translate(0,0,z+i*50);
    circle(0,0,200);
  }
  println("\n",time, z);
  if(timeFrame < time && countingTime){
    z++;
    time=0;
  }
  time++;
}
