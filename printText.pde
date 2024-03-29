//useful information about text:
//text(float, x, y) always print a number with 3 decimal places
 
private float k=1.2; //length factor between strings
int startX;
int startY;
int textSize;

void printAngle(String name, String letters, int n){
  startX=1200;
  startY=100;
  textSize=40;
  textSize(textSize);
  text(name, startX, startY+textSize*k*(n-1));
  text(round(angles[n-1]*180/PI),startX+5*textSize/2, startY+textSize*k*(n-1));
  text(angles[n-1],startX+7*textSize, startY+textSize*k*(n-1));
  
  //how can we change the angle (keys)
  textSize(30);
  text(letters, startX-3*textSize/2, startY+textSize*k*(n-1));
}

void printR(){
  startX=1200;
  startY=700;
  textSize=40;
  textSize(textSize);
  text(R[0][0], startX, startY);
  text(R[0][1], startX+5*textSize/2, startY);
  text(R[0][2], startX+10*textSize/2, startY);
  
  text(R[1][0], startX, startY+textSize);
  text(R[1][1], startX+5*textSize/2, startY+textSize);
  text(R[1][2], startX+10*textSize/2, startY+textSize);
  
  text(R[2][0], startX, startY+2*textSize);
  text(R[2][1], startX+5*textSize/2, startY+2*textSize);
  text(R[2][2], startX+10*textSize/2, startY+2*textSize);
}

void printC23(){
  startX=100;
  startY=270;
  textSize=30;
  
  textSize(textSize);
  text("X2: ", startX, startY);
  text(x2,startX+5*textSize/2, startY);
  text("Y2: ", startX, startY+textSize*k);
  text(y2,startX+5*textSize/2, startY+textSize*k);
  text("Z2: ", startX, startY+textSize*k*2);
  text(z2,startX+5*textSize/2, startY+textSize*k*2);
  
  startY=400;
  textSize(textSize);
  text("X3: ", startX, startY);
  text(x3,startX+5*textSize/2, startY);
  text("Y3: ", startX, startY+textSize*k);
  text(y3,startX+5*textSize/2, startY+textSize*k);
  text("Z3: ", startX, startY+textSize*k*2);
  text(z3,startX+5*textSize/2, startY+textSize*k*2);
}

void printText(){
  
  startX=100;
  startY=100;
  textSize=40;
  
  fill(255);
  textSize(textSize);
  text("X_EE: ", startX, startY);
  text(x,startX+5*textSize/2, startY);
  text("Y_EE: ", startX, startY+textSize*k);
  text(y,startX+5*textSize/2, startY+textSize*k);
  text("Z_EE: ", startX, startY+textSize*k*2);
  text(z,startX+5*textSize/2, startY+textSize*k*2);
  
  textSize(20);
  text("left right", startX-5*textSize/2, startY);
  text("ctrl alt", startX-5*textSize/2, startY+textSize*k);
  text("down up", startX-5*textSize/2, startY+textSize*k*2);
  
  printC23();  
  
  startY=400;
  textSize(textSize);
  text("front p ", startX, startY+textSize*k*4);
  text("right l ", startX, startY+textSize*k*5);
  text("top m ", startX, startY+textSize*k*6);
  
  printAngle("Th1", "q w", 1);
  printAngle("Th2", "e r", 2);
  printAngle("Th3", "t y", 3);
  printAngle("Th4", "a s", 4);
  printAngle("Th5", "d f", 5);
  printAngle("Th6", "g h", 6);
  
  startX=400;
  startY=700;
  
  textSize(30);
  text("n   start position", startX, startY);
  text("j   mouse checking", startX, startY+textSize*1);
  if(mouseCheck) text("on", startX+20*textSize/2, startY+textSize*1);
  else text("off", startX+20*textSize/2, startY+textSize*1);
  text("i   go with speed grip", startX, startY+textSize*2);
  text("k  go with speed grip Twist", startX, startY+textSize*3);
  text("b  go by gcodes", startX, startY+textSize*4);
  
  startX=100;
  startY=800;
  textSize=40;
  
  fill(255);
  textSize(textSize);
  text(exeption, startX, startY);
  
  text(caseM, startX, startY-textSize*2);
  
  
  float[] euler=findEulerAngles(R);
  
  startX=1200;
  startY=500;
  textSize=40;
  
  fill(255);
  textSize(textSize);
  text("EA_1: ", startX, startY);
  text(euler[0],startX+5*textSize/2, startY);
  text("EA_2: ", startX, startY+textSize*k);
  text(euler[1],startX+5*textSize/2, startY+textSize*k);
  text("EA_3: ", startX, startY+textSize*k*2);
  text(euler[2],startX+5*textSize/2, startY+textSize*k*2);
  
  printR();
  
}
