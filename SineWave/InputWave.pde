class InputWave{
  float frequencyI;
  float sinusoidalAxis;
  float gOfX;
  float samplesPerPixel;
  InputWave(){
  	frequencyI = 2;
  	sinusoidalAxis = 1;
    samplesPerPixel = 10;
  }

  InputWave(float tempFrequencyI, float tempSinusoidalAxis, float tempSamplesPerPixel){
  	frequencyI = tempFrequencyI;
  	sinusoidalAxis = tempSinusoidalAxis;
    samplesPerPixel = tempSamplesPerPixel;
  }

  void display(Axes other){
    //smooth(2);
    stroke(255, 255, 0);
    strokeWeight(1);

    float a = 0.0;
    float increment = TWO_PI / ((other.ticksPerUnit*other.tickSpacingX)/frequencyI*samplesPerPixel);

  	for(float i = 0.0; i <= other.numberOfUnitLengths*other.ticksPerUnit*other.tickSpacingX; i = i + 1 / samplesPerPixel){
      gOfX = (other.tickSpacingY*cos(a) + (other.tickSpacingY*sinusoidalAxis));
  		point(i+other.startPtX, other.startPtY - gOfX);
      a = a + increment;
  	}
  }
}
