class InputWave{
  float wavelengthI;
  float periodsPerSecondW;
  float sinusoidalAxis;
  float gOfX;
  InputWave(){
  	wavelengthI = 2;
  	periodsPerSecondW = 2;
  	sinusoidalAxis = 1;
  }

  InputWave(float tempWavelengthI, float tempPeriodsPerSecondW, float tempSinusoidalAxis){
  	wavelengthI = tempWavelengthI;
  	periodsPerSecondW = tempPeriodsPerSecondW;
  	sinusoidalAxis = tempSinusoidalAxis;
  }

  void display(Axes other){
    //smooth(2);
    stroke(255, 255, 0);
    strokeWeight(1);

    float a = 0.0;
    float increment = TWO_PI / (other.ticksPerUnit*other.tickSpacing*wavelengthI/.1);

  	for(float i = 0.0; i <= 4.5*4*60; i = i + .1){
      gOfX = (60*cos(a) + (60*sinusoidalAxis));
  		point(i+40, other.startPtY - gOfX);
      a = a + increment;
  	}
  }
}
