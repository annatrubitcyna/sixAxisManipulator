
void keyCheck(){
//работа с клавиатурой
  if (keyPressed){
    if (key == CODED) {
      int linearVelocity=4;
      if (keyCode == UP)
      {
        z+=linearVelocity;
      } else if (keyCode == DOWN)
      {
        z-=linearVelocity;
      } else if (keyCode == RIGHT)
      {
        x+=linearVelocity;
      } else if (keyCode == LEFT)
      {
        x-=linearVelocity;
      } else if (keyCode == CONTROL)
      {
        y+=linearVelocity;
      } else if (keyCode == ALT)
      {
        y-=linearVelocity;
      }
      changeAngles=false;
    } else {
      float angularVelocity=radians(2);
      if (key== 'q' | key=='й'){
        angles[0]=an(angles[0]-angularVelocity);
      }
      if (key == 'w' | key=='ц'){
        angles[0]=an(angles[0]+angularVelocity);
      }
      if (key== 'e' | key=='у'){
        angles[1]=an(angles[1]-angularVelocity);
      }
      if (key== 'r' | key=='к'){
        angles[1]=an(angles[1]+angularVelocity);
      }
      if (key== 't' | key=='е'){
        angles[2]=an(angles[2]-angularVelocity);
      }
      if (key== 'y' | key=='н'){
        angles[2]=an(angles[2]+angularVelocity);
      }
      if (key== 'a' | key=='ф'){
        angles[3]=an(angles[3]-angularVelocity);
      }
      if (key== 's' | key=='ы'){
        angles[3]=an(angles[3]+angularVelocity);
      }
      if (key== 'd' | key=='в'){
        angles[4]=an(angles[4]-angularVelocity);
      }
      if (key== 'f' | key=='а'){
        angles[4]=an(angles[4]+angularVelocity);
      }
      if (key== 'g' | key=='п'){
        angles[5]=an(angles[5]-angularVelocity);
      }
      if (key== 'h' | key=='р'){
        angles[5]=an(angles[5]+angularVelocity);
      }
      if(key=='n' | key=='т'){
        first=true;
      }
      if(key=='i' | key=='ш'){  
        //for( int time=0;time<100;time++){
        //goWithSpeed();
        goWithSpeedGrip();
      }
      if(key=='k' | key=='л'){  
        //for( int time=0;time<100;time++){
        //goWithSpeed();
        goWithSpeedGripTwist();
      }
      //changeAngles=true; ///?????????????????вопрос по поводу последних 3х
      if(key=='b' | key=='и'){
        R[0][0]= 1;R[0][1]= 0; R[0][2]= 0;
        R[1][0]= 0; R[1][1]= -1; R[1][2]= 0;
        R[2][0]= 0; R[2][1]= 0; R[2][2]= -1;
        start_coords(table_x, table_y, table_z, R);
        flag_go_by_gcode=true;
        float[] start_point_gcode0={table_x, table_y, table_z, 0, 1000};
        start_point_gcode=start_point_gcode0;
        if(flag_line){ 
          next_point_gcode=getTrajectoryByGcode();
          pr_time=millis();
          x=start_point_gcode[0];
          y=start_point_gcode[1];
          z=start_point_gcode[2];
          float[][] mov_vect= subM(transpose_row_to_column(next_point_gcode), transpose_row_to_column(start_point_gcode));
          float mov_v_n=norm_vect(mov_vect);
          float speed=start_point_gcode[4]/60; //пикселей в секунду
          float kx=0;   if(mov_vect[0][0]!=0) kx=mov_v_n/mov_vect[0][0];
          float ky=0;   if(mov_vect[1][0]!=0) ky=mov_v_n/mov_vect[1][0];
          float kz=0;   if(mov_vect[2][0]!=0) kz=mov_v_n/mov_vect[2][0];
          float[][] velocity={{0}, {0},{0},{speed*kx},{speed*ky},{speed*kz}};
          //время к которому должен доехать (в секундах) 
          if(speed!=0) t_m+=mov_v_n/speed;
          theta_s_gcode=backSpeedTransferTwist(velocity);
        } //<>//
      }
    }
  }
}

void keyReleased(){
  if(key=='j' | key=='о'){ 
        mouseCheck=!mouseCheck;
      }
  //if(key=='b' | key=='и'){ 
  //  if(i_gcode<i_gcode_l){
  //    goByGcodes();
  //  }
  //}
}
