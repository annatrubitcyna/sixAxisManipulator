//final float[] l={0, 200, 100, 100};

//private float x=l[2]+l[3];
//private float y=0;
//private float z=l[1];
//private float x1;
//private float y1;
//private float z1;
//private float x2;
//private float y2;
//private float z2;
//private float t1=0;
//private float t2=PI/2;
//private float t3=0;

//float[] angles=backwardTransfer(x, y, z);
//boolean changeAngles=false;


//float[] backwardTransfer(float x, float y, float z)
//{
//  float[] a = {0, 0, l[2], l[3]};  // массив значений a_i
//  float[] d = {0, l[1], 0, 0};  // массив значений d_i
//  float r1 = sqrt(sq(x)+sq(y));
//  float r2 = z - d[1];
//  float r3 = sqrt(sq(r1)+sq(r2));
//  t1 = atan2(y, x);

//  if (abs((sq(a[2]) + sq(r3) - sq(a[3])) / (2 * a[2] * r3))<=1) {
//    float psi1 = acos((sq(a[2]) + sq(r3) - sq(a[3])) / (2 * a[2] * r3));
//    float psi2 = atan2(r2, r1);
//    if (abs((sq(a[2]) + sq(a[3]) - sq(r3)) / (2 * a[2] * a[3]))<=1) {
//      t2 = psi2 + psi1;
//      float psi3 = acos((sq(a[2]) + sq(a[3]) - sq(r3)) / (2 * a[2] * a[3]));
//      t3 = PI - psi3;
//    }
//  }
//  float[] angles={t1, t2, t3};
//  return angles;
//}

//float[][] straightTransfer(float t1, float t2, float t3)
//{
//  t3 = t2 - t3;
//  float[] a = {0, 0, l[2], l[3]};  // массив значений a_i
//  float[] d = {0, l[1], 0, 0};  // массив значений d_i
//  x1=0;
//  y1=0;
//  z1=d[1];
//  x2 = (a[2] * cos(t2)) * cos(t1);
//  y2 = (a[2] * cos(t2)) * sin(t1);
//  z2 = d[1] + a[2] * sin(t2);
//  x = (a[2] * cos(t2) + a[3] * cos(t3)) * cos(t1);
//  y = (a[2] * cos(t2) + a[3] * cos(t3)) * sin(t1);
//  z = d[1] + a[2] * sin(t2) + a[3] * sin(t3);
//  float[][] coords={{x1, y1, z1}, {x2, y2, z2}, {x, y, z}};
//  return coords;
//}



//void drawManipulator()
//{
//  clear();
//  stroke(255, 0, 0);
//  strokeWeight(7);
//  strokeCap(ROUND);
//  if (!changeAngles) {
//    angles=backwardTransfer(x, y, z);
//  }
//  float[][] coords=straightTransfer(angles[0], angles[1], angles[2]);
//  x1=coords[0][0];
//  y1=coords[0][1];
//  z1=coords[0][2];

//  x2=coords[1][0];
//  y2=coords[1][1];
//  z2=coords[1][2];

//  x=coords[2][0];
//  y=coords[2][1];
//  z=coords[2][2];
//  line(0, 0, 0, x1, y1, z1);
//  stroke(255, 255, 0);
//  line(x1, y1, z1, x2, y2, z2);
//  stroke(0, 0, 255);
//  line(x2, y2, z2, x, y, z);

//  if (keyPressed) {
//    if (key == CODED) {
//      if (keyCode == UP)
//      {
//        z+=1;
//      } else if (keyCode == DOWN)
//      {
//        z-=1;
//      } else if (keyCode == RIGHT)
//      {
//        x+=1;
//      } else if (keyCode == LEFT)
//      {
//        x-=1;
//      } else if (keyCode == CONTROL)
//      {
//        y+=1;
//      } else if (keyCode == ALT)
//      {
//        y-=1;
//      }
//      changeAngles=false;
//    } else {
//      if (key== 'a') {
//        angles[0]-=radians(5);
//      }
//      if (key == 's') {
//        angles[0]+=radians(5);
//      }
//      if (key== 'f') {
//        angles[1]-=radians(5);
//      }
//      if (key== 'd') {
//        angles[1]+=radians(5);
//      }
//      if (key== 'g') {
//        angles[2]-=radians(5);
//      }
//      if (key== 'h') {
//        angles[2]+=radians(5);
//      }
//      changeAngles=true;
//    }
//  }
//}
