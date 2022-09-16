float cAdd(float t1, float t2){ //addition of corners
 float t3=t1+t2;
 return an(t3);
}

float cSub(float t1, float t2){ //addition of corners
 float t3=t1-t2;
 return an(t3);
}

float an(float t3){ //angle in normal interval (to compare angles)

  t3=t3%(2*PI);
  if(t3>PI){
     t3-=2*PI;
   }
   if(t3<-PI){
     t3+=2*PI;
   }
   return t3;
}
