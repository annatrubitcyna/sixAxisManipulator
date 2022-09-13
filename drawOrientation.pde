void drawOrientation(float x, float y, float z, float[][]T, int len){
  float[][] R = getR(T);
                
  float[][] x0={{len}, {0}, {0}};
  float[][] newX=dot(R, x0);
  stroke(255, 0, 0);
  line(x, y, z, x+newX[0][0], y+newX[1][0], z+newX[2][0]);
  float[][] y0={{0}, {len}, {0}};
  float[][] newY=dot(R, y0);
  stroke(0, 255, 0);
  line(x, y, z, x+newY[0][0], y+newY[1][0], z+newY[2][0]);
  float[][] z0={{0}, {0}, {len}};
  float[][] newZ=dot(R, z0);
  stroke(0, 0, 255);
  line(x, y, z, x+newZ[0][0], y+newZ[1][0], z+newZ[2][0]);
}

void drawOrientations(float x1, float y1, float z1, float x2, float y2, float z2, float x3, float y3, float z3, float x, float y, float z,float[][][]Ta){
  
  stroke(255, 0, 0);
  line(0, 0, 0, 200, 0, 0);
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 200, 0);
  //stroke(0, 0, 255);
  //line(0, 0, 0, 0, 0, 50);
  
  ////subscribe axis
  //fill(255, 0, 0);
  //textSize(40);
  //text("x", 180, 30);
  
  drawOrientation(x1, y1, z1, Ta[0], 5);
  drawOrientation(x2, y2, z2, Ta[1], 5);
  drawOrientation(x3, y3, z3, Ta[3], 5);
  drawOrientation(x, y, z, Ta[5], 10);
}
