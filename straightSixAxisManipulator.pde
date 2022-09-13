float[][] straightTransferCoord(float t1, float t2, float t3, float[][] T)
{
  x1 = 0;
  y1 = 0;
  z1 = l[1];
  x2 = (l[2] * cos(t2)) * cos(t1);
  y2 = (l[2] * cos(t2)) * sin(t1);
  z2 = l[1]+ l[2] * sin(t2);
  x3 = (l[2] * cos(t2) + l[3] * cos(t2+t3)) * cos(t1);
  y3 = (l[2] * cos(t2) + l[3] * cos(t2+t3)) * sin(t1);
  z3 = l[1] + l[2] * sin(t2) + l[3] * sin(t2+t3);
  
  float[][] Q ={{0}, {0}, {0}, {1}};
  //float[][] T = getT(t1, t2, t3, t4, t5, t6)[5];
  
  
  float[][] XYZ = dot(T, Q);
  
  float x=XYZ[0][0];
  float y=XYZ[1][0];
  float z=XYZ[2][0];
  println("xyz", x, y, z);
  float[][] coords={{x1, y1, z1}, {x2, y2, z2}, {x3, y3, z3}, {x, y, z}};
  return coords;
}
