void translateModel(boolean LR, boolean TB, float wid) //function to translate Camera with mouse
{
  if(LR == true) //display left/right rectangles
  {
    stroke(0,255,0); //Green
    rect(0,0,wid,height); //Left
    rect(width-wid,0,width,height); //Right
  }
  if(TB == true) //display top/bottom rectangles
  {
    stroke(0,0,255); //Blue
    rect(0,0,width,wid); //Top
    rect(0,height-wid,width,height); //Bottom
  }
  //Manipulate the Camera Coordinate System
  //...on Y axis
  if((mousePressed) && (mouseButton == LEFT) && (mouseX < wid)) camTY -= yTrSpeed;
  if((mousePressed) && (mouseButton == LEFT) && (mouseX > width-wid)) camTY += yTrSpeed;
  //...and Z axiz
  if((mousePressed) && (mouseButton == LEFT) && (mouseY < wid)) camTZ += zTrSpeed;
  if((mousePressed) && (mouseButton == LEFT) && (mouseY > height-wid)) camTZ -= zTrSpeed;
}

void checkModelRotation() //rotate Camera with pressed mouse middle button
{
  if(mousePressed && mouseButton==CENTER)
  {
    camRZ += (mouseX-pmouseX)/yRotSpeed;
    camRY += (mouseY-pmouseY)/zRotSpeed;
  }
}

void smoothRX(float targetX)
{
  if(needSmoothRX)
  {
    if(camRX != targetX)
    {
      if(targetX-camRX > 1) camRX++;
      else if(targetX-camRX < -1) camRX--;
      else camRX = targetX;
    }
    else needSmoothRX = false;
  }
}

void smoothRY(float targetY)
{
  if(needSmoothRY)
  {
    if(camRY != targetY)
    {
      if(targetY-camRY > 1) camRY++;
      else if(targetY-camRY < -1) camRY--;
      else camRY = targetY;
    }
    else needSmoothRY = false;
  }
}

void smoothRZ(float targetZ)
{
  if(needSmoothRZ)
  {
    if(camRZ != targetZ)
    {
      if(targetZ-camRZ > 1) camRZ++;
      else if(targetZ-camRZ < -1) camRZ--;
      else camRZ = targetZ;
    }
    else needSmoothRZ = false;
  }
}
