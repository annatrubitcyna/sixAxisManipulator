
void keyCheck(){
//работа с клавиатурой
  if (keyPressed){
    if (key == CODED) {
      int ls=2;
      if (keyCode == UP)
      {
        z+=ls;
      } else if (keyCode == DOWN)
      {
        z-=ls;
      } else if (keyCode == RIGHT)
      {
        x+=ls;
      } else if (keyCode == LEFT)
      {
        x-=ls;
      } else if (keyCode == CONTROL)
      {
        y+=ls;
      } else if (keyCode == ALT)
      {
        y-=ls;
      }
      changeAngles=false;
    } else {
      if (key== 'q'){
        angles[0]-=radians(5);
      }
      if (key == 'w'){
        angles[0]+=radians(5);
      }
      if (key== 'e'){
        angles[1]-=radians(5);
      }
      if (key== 'r'){
        angles[1]+=radians(5);
      }
      if (key== 't'){
        angles[2]-=radians(5);
      }
      if (key== 'y'){
        angles[2]+=radians(5);
      }
      if (key== 'a'){
        angles[3]-=radians(5);
      }
      if (key== 's'){
        angles[3]+=radians(5);
      }
      if (key== 'd'){
        angles[4]-=radians(5);
      }
      if (key== 'f'){
        angles[4]+=radians(5);
      }
      if (key== 'g'){
        angles[5]-=radians(5);
      }
      if (key== 'h'){
        angles[5]+=radians(5);
      }
      changeAngles=true;
    }
  }
}
