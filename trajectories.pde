float t_m;
float time_m_d;

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
  float[][] grip_s={{-5}, {0},{0},{0},{0},{0}};
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
  float[][] grip_s ={{0}, {0},{0},{-1},{-1},{0}};
  //float[][] grip_s={{0}, {0},{0},{-1},{-1},{0}}; //w(x)=-1
  //grip_s=dotL(grip_s, 0.01);
  float[][][] Ta=getT(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
  float[][] theta_s=backSpeedTransferTwist(grip_s);
  float[] angles_s=angles;
  if(!singularity & exeption.equals("OK")){
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

//void goWithSpeedGripTwist(float[] start_point, float[] next_point, float[][] grip_s){ //<>//
//  float[][][] Ta=getT(angles[0], angles[1], angles[2], angles[3], angles[4], angles[5]);
//  float[][] theta_s=backSpeedTransferTwist(grip_s);
//  float[] angles_s=angles;
//  for( int i=0;i<6;i++){
//    angles_s[i]=an(angles[i]+theta_s[i][0]);
//  }
//}


void goWithSpeedPoinToPoint(float[] start_point, float[] next_point, float speed){
  x=start_point[0]; //<>//
  y=start_point[1];
  z=start_point[2];
  float[][] mov_vect= subM(transpose_row_to_column(next_point), transpose_row_to_column(start_point));
  float mov_v_n=norm_vect(mov_vect);
  speed=speed/10; //пикселей в секунду
  float kx=0;   if(mov_vect[0][0]!=0) kx=mov_v_n/mov_vect[0][0];
  float ky=0;   if(mov_vect[1][0]!=0) ky=mov_v_n/mov_vect[1][0];
  float kz=0;   if(mov_vect[2][0]!=0) kz=mov_v_n/mov_vect[2][0];
  float[][] velocity={{0}, {0},{0},{speed*kx},{speed*ky},{speed*kz}};
  
  if(speed!=0) t_m=mov_v_n/speed;
  else t_m=0.1;
  println(t_m);
  float[][] theta_s=backSpeedTransferTwist(velocity);
  
  //time_m_d=0;
  if (time_m_d<t_m){
    for( int i=0;i<6;i++){
       angles[i]=an(angles[i]+theta_s[i][0]*0.01);
    }
    delay(10);
    time_m_d+=0.01;
    changeAngles=true;
    //draw();
    //println(x);
  }
}
