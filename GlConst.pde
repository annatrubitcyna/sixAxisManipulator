float camRX = 0; //R = Rotate, mod = Model, X = X axis
float camRY = 0;
float camRZ = 0;

float camTX = 0; //T = Translate
float camTY = 0;
float camTZ = 0;

float camTrWid = 10; //Width of sides around the screen to translate model with mouse
float xTrSpeed = 5; //Speed of translation model on X axis with help of mouse wheel | greater numer == faster speed
float yTrSpeed = 3;
float zTrSpeed = 3;
float yRotSpeed = 6; //Speed of rotation of model around Y axis
float zRotSpeed = 3; //Speed of rotation of model around Z axis

float sceBoxSize = width;

//Constants for smoothRotation (in Cam_TrRot)
float targetCamRX = 0; //Target rotation angle for X axis
boolean needSmoothRX = false; //Flag for om=n/off smoothRotation mode on X axis
float targetCamRY = 0;
boolean needSmoothRY = false;
float targetCamRZ = 0;
boolean needSmoothRZ = false;
