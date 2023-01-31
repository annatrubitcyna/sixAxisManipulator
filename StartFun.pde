void start_angles(float t1, float t2, float t3, float t4, float t5, float t6){
    angles[0]=t1;
    angles[1]=t2;
    angles[2]=t3;
    angles[3]=t4;
    angles[4]=t5;
    angles[5]=t6;
    
    float[][][] Ta=getT(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
    Ta=straightTwist();

    R=getR(Ta[5]);
    float[][] coords=straightTransferCoord(angles[0], angles[1], angles[2], Ta); 
    
    x=coords[3][0];
    y=coords[3][1];
    z=coords[3][2];
    
    //x=100; y=0; z=200;
    angles=backwardTransfer(x, y, z, R);
    changeAngles=true;
    first=false;
}

float[][] getRfromSixOrCoordinates(float ax1, float ay1, float ax2){
  if((sq(R[0][0])+sq(R[1][0]))<1 | ay1<1){
    //x-axis
    R[0][0]=ax1; R[1][0]=ay1; R[2][0]=sqrt(1-sq(R[0][0])-sq(R[1][0]) ); float az1=R[2][0];
    //y-axis
    R[0][1]=ax2; 
    float ay21= (-ax1*ax2*ay1+sqrt(sq(ax1*ax2*ay1)-(sq(ax1*ax2)-sq(az1)+sq(az1*ax2))*(sq(ay1)+sq(az1))))/((sq(ay1)+sq(az1))); 
    float az21=sqrt(1-sq(ax2)-sq(ay21));
    float ay22= (-ax1*ax2*ay1-sqrt(sq(ax1*ax2*ay1)-(sq(ax1*ax2)-sq(az1)+sq(az1*ax2))*(sq(ay1)+sq(az1))))/((sq(ay1)+sq(az1))); 
    float az22=sqrt(1-sq(ax2)-sq(ay22));
    float ay2; float az2;
    if(ax1*ax2+ay1*ay21+az1*az21==0) {
      R[1][1]=ay21;
      ay2=ay21;
      R[2][1]=az21;
      az2=az21;
    }
    else{
      R[1][1]=ay22;
      ay2=ay22;
      R[2][1]=az22;
      az2=az22;
    }
    
    //float ay2=R[1][1]; 
    //R[2][1]=sqrt(1-sq(R[0][1])-sq(R[1][1])); float az2=R[2][1];
    //println("0: ", ax1*ax2+ay1*ay2, " ", az1*az2);
    
    //z-axis
    R[0][2]=ay1*az2-ay2*az1; R[1][2]=ax2*az1-ax1*az2; R[2][2]=ax1*ay2-ax2*ay1;
  }
  //printMatrix(R);
  return R;
}

void start_coords(float x, float y, float z, float[][] R){
  angles=backwardTransfer(x, y, z, R);
  println("!!!", angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
  start_angles(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
}
