void checkKeyboard() //One on a program. Function to check which keys where hited
{
  if(keyPressed)
  { 
    //return Camera to origin point (0,0,0)
    if((key == 'z') || (key == 'я'))
    {
      camTX = 0;
      camTY = 0;
      camTZ = 0;
      camRX = 0;
      camRY = 0;
      camRZ = 0;
    }
    
    //F = Front Plane
    //R = Right Plane
    //T = Top Plane
    if((key == 'p') || (key == 'з'))
    {
      camTX = 0;
      camTY = 0;
      camTZ = 0;
      targetCamRX = 0;
      targetCamRY = 0;
      if(camRZ != 0) targetCamRZ = 0; //Теперь инвертирует правильно, благодаря замене == на !=
      else targetCamRZ = 180;
      needSmoothRX = true;
      needSmoothRY = true;
      needSmoothRZ = true;
    }
    if((key == 'l') || (key == 'д'))
    {
      camTX = 0;
      camTY = 0;
      camTZ = 0;
      targetCamRX = 0;
      targetCamRY = 0;
      if(camRZ != -90) targetCamRZ = -90;
      else targetCamRZ = 90;
      needSmoothRX = true;
      needSmoothRY = true;
      needSmoothRZ = true;
    }
    if((key == 'm') || (key == 'ь'))
    {
      camTX = 0;
      camTY = 0;
      camTZ = 0;
      targetCamRX = 0;
      if(camRY != 90) targetCamRY = 90;
      else targetCamRY = -90;
      targetCamRZ = 0;
      needSmoothRX = true;
      needSmoothRY = true;
      needSmoothRZ = true;
    }
  }
}
