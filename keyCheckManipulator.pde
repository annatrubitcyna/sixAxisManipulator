
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
        i_gcode_l=trajectory.length-1;
        if(i_gcode<i_gcode_l){
          goByGcodes(); //<>//
        }
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
