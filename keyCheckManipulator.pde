
void keyCheck(){
//работа с клавиатурой
  if (keyPressed){
    if (key == CODED) {
      int linearVelocity=2;
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
      if (key== 'q'){
        angles[0]=an(angles[0]-angularVelocity);
      }
      if (key == 'w'){
        angles[0]=an(angles[0]+angularVelocity);
      }
      if (key== 'e'){
        angles[1]=an(angles[1]-angularVelocity);
      }
      if (key== 'r'){
        angles[1]=an(angles[1]+angularVelocity);
      }
      if (key== 't'){
        angles[2]=an(angles[2]-angularVelocity);
      }
      if (key== 'y'){
        angles[2]=an(angles[2]+angularVelocity);
      }
      if (key== 'a'){
        angles[3]=an(angles[3]-angularVelocity);
      }
      if (key== 's'){
        angles[3]=an(angles[3]+angularVelocity);
      }
      if (key== 'd'){
        angles[4]=an(angles[4]-angularVelocity);
      }
      if (key== 'f'){
        angles[4]=an(angles[4]+angularVelocity);
      }
      if (key== 'g'){
        angles[5]=an(angles[5]-angularVelocity);
      }
      if (key== 'h'){
        angles[5]=an(angles[5]+angularVelocity);
      }
      changeAngles=true;
    }
  }
}
