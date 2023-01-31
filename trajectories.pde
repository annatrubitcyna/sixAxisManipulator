void goWithSpeed(){
    float[][] theta_s={{-1}, {-1},{-1},{-1},{-1},{-1}};
    theta_s=dotL(theta_s, 0.01);
    for( int i=0;i<6;i++){
      angles[i]=an(angles[i]+theta_s[i][0]);
    }
    changeAngles=true;
    //draw();
}

void goWithSpeedGripsWitoutRotation(){
    float[][] grip_s={{-1}, {-1},{-1},{-1},{-1},{-1}};
    
    grip_s=dotL(grip_s, 0.01);
    x+=grip_s[0][0];
    y+=grip_s[0][1];
    z+=grip_s[0][2];
}


void goWithSpeedGrip(){
  float[][] grip_s={{-1}, {0},{0},{0},{0},{0}};
  //grip_s=dotL(grip_s, 0.01);
  float[][][] Ta=getT(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
  float[][] theta_s=backSpeedTransfer(Ta, grip_s);
    
    //float[][] theta_s={{-1}, {-1},{-1},{-1},{-1},{-1}};
    //theta_s=dotL(theta_s, 0.01);
    //grip_s=straightSpeedTransfer(Ta, theta_s);
    //theta_s=backSpeedTransfer(Ta, grip_s);
  float[] angles_s=angles;
  //print("ex: "); println(exeption);
  if(!singularity & exeption=="OK"){
    for( int i=0;i<6;i++){
      angles_s[i]=an(angles[i]+theta_s[i][0]);
    }
    
    Ta=getT(angles_s[0], angles_s[1], angles_s[2], angles_s[3], angles_s[4], angles_s[5]);
    float[][] coords=straightTransferCoord(angles_s[0], angles_s[1], angles_s[2], Ta);
    k=1.1;
    x=coords[3][0]*k;
    y=coords[3][1]*k;
    z=coords[3][2]*k;
    changeAngles=false;
    
    float[][] angles_m={angles};
    //printMatrix(angles_m);
  }
}


void goWithSpeedGripTwist(){
  float[][] grip_s={{0}, {0},{0},{-1},{-1},{0}}; //w(x)=-1
  //grip_s=dotL(grip_s, 0.01);
  float[][][] Ta=getT(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
  float[][] theta_s=backSpeedTransferTwist(grip_s);
  float[] angles_s=angles;
  if(!singularity & exeption=="OK"){
    for( int i=0;i<6;i++){
      angles_s[i]=an(angles[i]+theta_s[i][0]);
    }
    
    Ta=getT(angles_s[0], angles_s[1], angles_s[2], angles_s[3], angles_s[4], angles_s[5]);
    float[][] coords=straightTransferCoord(angles_s[0], angles_s[1], angles_s[2], Ta);
    k=1.1;
    x=coords[3][0]*k;
    y=coords[3][1]*k;
    z=coords[3][2]*k;
    changeAngles=false;
    
    float[][] angles_m={angles};
    //printMatrix(angles_m);
  }
}
