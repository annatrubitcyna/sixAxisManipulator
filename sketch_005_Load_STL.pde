void setup() {
  size(1600, 900, P3D);
  mesh=(TriangleMesh)new STLReader().loadBinary(sketchPath("BaseBot.stl"),STLReader.TRIANGLEMESH);
  //mesh=(TriangleMesh)new STLReader().loadBinary(sketchPath("mesh-flipped.stl"),STLReader.TRIANGLEMESH).flipYAxis();
  gfx=new ToxiclibsSupport(this);
}

void draw() 
{
  ortho();
  //PREPARATIONS
  background(0);
  lights();
  
  //Check Keyboart Input
  checkKeyboard();
  if(mouseCheck)  mouseCheck();
  
  
  //ScreenCoordinates
  translateModel(false,false,camTrWid); //Translate model with mouse
  //true/false - visibility of Left/Right segments
  //true/false - visibility of Top/Bottom segments
  //modTrWid - global constant of width of translation rectangles around the screen
  checkModelRotation();
  stroke(255, 255, 255);
  strokeWeight(17); //7
  arc(0, 0, 0, 100, 0, PI);

 
  //Global Transform Matrices start
  pushMatrix();
  
  //Transform Left-Handed Coordinate System to Right-Handed
  scale(-1, 1, 1);
  
  //Some basic rotations and transformations of Camera
  rotateX(PI/2);
  rotateZ(PI/2);
  translate(1*sceBoxSize, width/2, -height*0.6);
  
  //moving Camera around the Camera
  translate(camTX,camTY,camTZ);
  smoothRX(targetCamRX);
  smoothRY(targetCamRY);
  smoothRZ(targetCamRZ);
  rotateX(radians(camRX));
  rotateY(radians(camRY));
  rotateZ(radians(camRZ));
  //println("camRX = " + camRX + "; camRY = " + camRY + "; camRZ = " + camRZ);
  
  //Drawing Scene Basis
  stroke(255,0,0);
  line(0,0,0,200,0,0);
  stroke(0,255,0);
  line(0,0,0,0,200,0);
  stroke(0,0,255);
  line(0,0,0,0,0,200);
  
  //Drawing some box with center in (0,0,0) at Scene
  stroke(255);
  noFill();
  //box(800);
  
  //Some transforms of Model
  
  //Drawing Model Basis
  strokeWeight(3);
  stroke(255,0,0);
  line(0,0,0,100,0,0);
  stroke(0,255,0);
  line(0,0,0,0,100,0);
  stroke(0,0,255);
  line(0,0,0,0,0,100);
  
  drawManipulator();
  
  //Drawing some box with center in (0,0,0) at Model
  stroke(155);
  noFill();
  //box(200);
  strokeWeight(1);
  
  //Drawing Model
  //pushMatrix();
  //rotateZ(PI);
  //translate(-100,-100,0);
  //gfx.origin(new Vec3D(),0);
  //noStroke();
  //fill(255,0,255);
  //gfx.mesh(mesh,false,0);
  //noFill();
  //popMatrix();
  
  //Global Transform Matrices end
  popMatrix();  
  
  pushMatrix();
  printText();
  popMatrix();
}



TriangleMesh mesh;
ToxiclibsSupport gfx;
