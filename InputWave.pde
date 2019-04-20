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
    float increment = TWO_PI / (4*(other.tickSpacing)/.01);

  	for(float i = 0.0; i <= 4.5*4*60; i = i + .01){
      gOfX = (64*sin(a) + (64*sinusoidalAxis));
  		point(i+40, other.startPtY - gOfX);
      a = a + increment;
  	}
  }
}
