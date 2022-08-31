//final float[] l={0, 100, 100, 100, 100};

//private float x=l[2]+l[3]+l[4];
//private float y=0;
//private float z=l[1];
//private float x1;
//private float y1;
//private float z1;
//private float x2;
//private float y2;
//private float z2;
//private float x3;
//private float y3;
//private float z3;
//float[] angles={0, PI/2, -PI/2, 0, 0, 0};
//float[] orientation={0, 0, 0};


//float[][] straightTransferCoordF(float t1, float t2, float t3,float t5)
//{
//  x1 = 0;
//  y1 = 0;
//  z1 = l[1];
//  x2 = (l[2] * cos(t2)) * cos(t1);
//  y2 = (l[2] * cos(t2)) * sin(t1);
//  z2 = l[1]+ l[2] * sin(t2);
//  x3 = (l[2] * cos(t2) + l[3] * cos(t2+t3)) * cos(t1);
//  y3 = (l[2] * cos(t2) + l[3] * cos(t2+t3)) * sin(t1);
//  z3 = l[1] + l[2] * sin(t2) + l[3] * sin(t2+t3);
  
//  x = (l[2] * cos(t2) + l[3] * cos(t3 + t2) + l[4] * cos(t5 + (t3 + t2))) * cos(t1);
//  y = (l[2] * cos(t2) + l[3] * cos(t3 - t2) + l[4] * cos(t5 + (t3 + t2))) * sin(t1);
//  z = l[1] + l[2] * sin(t2) + l[3] * sin(t3 + t2) + l[4] * sin(t5 + (t3 + t2));
//  float[][] coords={{x1, y1, z1}, {x2, y2, z2}, {x3, y3, z3}, {x, y, z}};
//  return coords;
//}


//float[][] getT(float t1, float t2, float t3, float t4, float t5, float t6){
  
//   t3 = t3 + PI / 2;
  
//  float[] a = {0, 0, l[2], 0, 0, 0, 0};
//  float[] alpha = {0, PI / 2, 0, PI / 2, -PI / 2, PI / 2, 0};
//  float[] d = {0, l[1], 0, 0, l[3], 0, l[4]};
  
//  float[][] T_0_1 = {{cos(t1), -sin(t1) * cos(alpha[1]), sin(t1) * sin(alpha[1]), a[1] * cos(t1)},
//                    {sin(t1), cos(t1) * cos(alpha[1]), -cos(t1) * sin(alpha[1]), a[1] * sin(t1)},
//                    {0, sin(alpha[1]), cos(alpha[1]), d[1]},
//                    {0, 0, 0, 1}};
  
//  float[][] T_1_2 = {{cos(t2), -sin(t2) * cos(alpha[2]), sin(t2) * sin(alpha[2]), a[2] * cos(t2)},
//                    {sin(t2), cos(t2) * cos(alpha[2]), -cos(t2) * sin(alpha[2]), a[2] * sin(t2)},
//                    {0, sin(alpha[2]), cos(alpha[2]), d[2]},
//                    {0, 0, 0, 1}};
  
//  float[][] T_2_3 = {{cos(t3), -sin(t3) * cos(alpha[3]), sin(t3) * sin(alpha[3]), a[3] * cos(t3)},
//                    {sin(t3), cos(t3) * cos(alpha[3]), -cos(t3) * sin(alpha[3]), a[3] * sin(t3)},
//                    {0, sin(alpha[3]), cos(alpha[3]), d[3]},
//                    {0, 0, 0, 1}};
//  float[][]T_3_4 = {{cos(t4), -sin(t4) * cos(alpha[4]), sin(t4) * sin(alpha[4]), a[4] * cos(t4)},
//                    {sin(t4), cos(t4) * cos(alpha[4]), -cos(t4) * sin(alpha[4]), a[4] * sin(t4)},
//                    {0, sin(alpha[4]), cos(alpha[4]), d[4]},
//                    {0, 0, 0, 1}};
//  float[][] T_4_5 = {{cos(t5), -sin(t5) * cos(alpha[5]), sin(t5) * sin(alpha[5]), a[5] * cos(t5)},
//                    {sin(t5), cos(t5) * cos(alpha[5]), -cos(t5) * sin(alpha[5]), a[5] * sin(t5)},
//                    {0, sin(alpha[5]), cos(alpha[5]), d[5]},
//                    {0, 0, 0, 1}};
//  float[][] T_5_6 = {{cos(t6), -sin(t6) * cos(alpha[6]), sin(t6) * sin(alpha[6]), a[6] * cos(t6)},
//                    {sin(t6), cos(t6) * cos(alpha[6]), -cos(t6) * sin(alpha[6]), a[6] * sin(t6)},
//                    {0, sin(alpha[6]), cos(alpha[6]), d[6]},
//                    {0, 0, 0, 1}};
                    
//  float[][] T = dot(dot(dot(dot(dot(T_0_1, T_1_2), T_2_3), T_3_4), T_4_5), T_5_6);
//  return T;
//}


//float[][] straightTransferCoord(float t1, float t2, float t3, float t4, float t5, float t6)
//{
//  x1 = 0;
//  y1 = 0;
//  z1 = l[1];
//  x2 = (l[2] * cos(t2)) * cos(t1);
//  y2 = (l[2] * cos(t2)) * sin(t1);
//  z2 = l[1]+ l[2] * sin(t2);
//  x3 = (l[2] * cos(t2) + l[3] * cos(t2+t3)) * cos(t1);
//  y3 = (l[2] * cos(t2) + l[3] * cos(t2+t3)) * sin(t1);
//  z3 = l[1] + l[2] * sin(t2) + l[3] * sin(t2+t3);
  
//  float[][] Q ={{0}, {0}, {0}, {1}};
//  float[][] T = getT(t1, t2, t3, t4, t5, t6);
  
  
//  float[][] XYZ = dot(T, Q);
  
//  float x=XYZ[0][0];
//  float y=XYZ[1][0];
//  float z=XYZ[2][0];
//  println("xyz", x, y, z);
//  float[][] coords={{x1, y1, z1}, {x2, y2, z2}, {x3, y3, z3}, {x, y, z}};
//  return coords;
//}

//float[][] straightTransfer(float t1, float t2, float t3, float t4, float t5, float t6)
//{
  
//  float[][] T = getT(t1, t2, t3, t4, t5, t6);
  
//  float[][] R = {{T[0][0], T[0][1], T[0][2]},
//                {T[1][0], T[1][1], T[1][2]},
//                {T[2][0], T[2][1], T[2][2]}};
//  float y_angle = -PI / 2;
//  float[][] T_y = {{cos(y_angle), 0, sin(y_angle)},
//                  {0, 1, 0},
//                  {-sin(y_angle), 0, cos(y_angle)}};
//  float x_angle = PI;
//  float[][] T_x = {{1, 0, 0},
//                  {0, cos(x_angle), -sin(x_angle)},
//                  {0, sin(x_angle), cos(x_angle)}};
//  T = dot(dot(R, T_y), T_x);
//  return T;
  
//}

//float[] straightTransferOr(float t1, float t2, float t3, float t4, float t5, float t6){
  
//  float[][] T=straightTransfer(t1, t2, t3, t4, t5, t6);
//  float aalpha;
//  float betta;
//  float gamma;
  
//  //if (round(T[0][2]) == 1 | round(T[0][2]) == -1){
//  //    if (round(T[0][2]) == -1){
//  //        betta = PI / 2;
//  //    }
//  //    else{
//  //        betta = -PI / 2;
//  //    }
//  //    gamma = 0;
//  //    aalpha = atan2(T[1][0], T[1][1]);
//  //}
//  //else{
//      betta = -asin(T[2][0]);
//      aalpha = atan2(-T[1][2] / cos(betta), T[2][2] / cos(betta));
//      gamma = atan2(T[0][1] / cos(betta), T[0][0] / cos(betta));
//  //}
//  //println(t1, t2, t3, t4, t5, t6);
//  println(-aalpha*180/PI, betta*180/PI, gamma*180/PI);
//  float[] orientation={-aalpha, betta, gamma};
//  //float[] orientation={};
//  return orientation;
//}

//void drawOrientation(float x, float y, float z, float[][]T){
//  float[][] R = {{T[0][0], T[0][1], T[0][2]},
//                {T[1][0], T[1][1], T[1][2]},
//                {T[2][0], T[2][1], T[2][2]}};
//  float[][] x0={{10}, {0}, {0}};
//  float[][] newX=dot(R, x0);
//  stroke(255, 0, 0);
//  line(x, y, z, x+newX[0][0], y+newX[1][0], z+newX[2][0]);
//  float[][] y0={{0}, {10}, {0}};
//  float[][] newY=dot(R, y0);
//  stroke(0, 255, 0);
//  line(x, y, z, x+newY[0][0], y+newY[1][0], z+newY[2][0]);
//  float[][] z0={{0}, {0}, {10}};
//  float[][] newZ=dot(R, z0);
//  stroke(0, 0, 255);
//  line(x, y, z, x+newZ[0][0], y+newZ[1][0], z+newZ[2][0]);
//}

//void drawManipulator()
//{
//  clear();
//  stroke(255, 0, 0);
//  strokeWeight(7);
//  strokeCap(ROUND);
//  float[][] coords=straightTransferCoord(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
//  float[][] T=getT(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
//  //orientation=straightTransferOr(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
//  x1=coords[0][0];
//  y1=coords[0][1];
//  z1=coords[0][2];
  
//  x2=coords[1][0];
//  y2=coords[1][1];
//  z2=coords[1][2];
  
//  x3=coords[2][0];
//  y3=coords[2][1];
//  z3=coords[2][2];
  
//  x=coords[3][0];
//  y=coords[3][1];
//  z=coords[3][2];
  
//  line(0, 0, 0, x1, y1, z1); //<>//
//  stroke(255, 255, 0);
//  line(x1, y1, z1, x2, y2, z2);
//  stroke(0, 0, 255);
//  line(x2, y2, z2, x3, y3, z3);
//  stroke(0, 255, 255);
//  line(x3, y3, z3, x, y, z);
  
//  drawOrientation(x, y, z, T);
  
  
//  //float axLen=10;
//  //float xO=x+axLen*cos(orientation[0]);
//  //float yO=y+axLen*cos(orientation[1]);
//  //float zO=z+axLen*cos(orientation[2]);
  
//  if (keyPressed){
//    if (key != CODED){
//      if (key== 'a'){
//        angles[0]-=radians(5);
//      }
//      if (key == 's'){
//        angles[0]+=radians(5);
//      }
//      if (key== 'f'){
//        angles[1]-=radians(5);
//      }
//      if (key== 'd'){
//        angles[1]+=radians(5);
//      }
//      if (key== 'g'){
//        angles[2]-=radians(5);
//      }
//      if (key== 'h'){
//        angles[2]+=radians(5);
//      }
//      if (key== 'j'){
//        angles[3]-=radians(5);
//      }
//      if (key== 'k'){
//        angles[3]+=radians(5);
//      }
//      if (key== 'q'){
//        angles[4]-=radians(5);
//      }
//      if (key== 'w'){
//        angles[4]+=radians(5);
//      }
//      if (key== 'e'){
//        angles[5]-=radians(5);
//      }
//      if (key== 'r'){
//        angles[5]+=radians(5);
//      }
//      //changeAngles=true;
//    }
//  }
//}
