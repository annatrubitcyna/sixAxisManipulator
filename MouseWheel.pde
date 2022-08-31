void mouseWheel(MouseEvent event) //scroll Camera near/far with mouse wheel
{
  float e = event.getCount();
  //Manipulate the Camera Coordinate System
  //..on X axis
  if(e > 0) camTX = camTX + 5*xTrSpeed;
  if(e < 0) camTX = camTX - 5*xTrSpeed;
}
