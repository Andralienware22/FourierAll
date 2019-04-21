class InputWave{
  float frequencyI;
  float sinusoidalAxis;
  float gOfX;
  float samplesPerPixel;

  float colorRed;
  float colorBlue;
  float colorGreen;

  InputWave(){
    frequencyI = 2;
    sinusoidalAxis = 1;
    samplesPerPixel = 10;
  }

  InputWave(float tempFrequencyI, float tempSinusoidalAxis, float tempSamplesPerPixel){
    frequencyI = tempFrequencyI;
    sinusoidalAxis = tempSinusoidalAxis;
    samplesPerPixel = tempSamplesPerPixel;

    colorRed = sinusoidalAxis;
    colorBlue = frequencyI;
    colorGreen = samplesPerPixel;
  }

  float display(Axes other){
    //smooth(2);
    stroke(255 * noise(colorRed), 255 * noise(colorBlue), 255 * noise(colorGreen));
    strokeWeight(1);

    float a = 0.0;
    float increment = TWO_PI * frequencyI / (other.ticksPerUnit*other.tickSpacingX * samplesPerPixel);

    for(float i = 0.0; i <= other.numberOfUnitLengths*other.ticksPerUnit*other.tickSpacingX; i = i + 1 / samplesPerPixel){
      gOfX = cos(a);
      point(i+other.startPtX, other.startPtY - other.tickSpacingY*gOfX - (other.tickSpacingY*sinusoidalAxis));
      a = a + increment;
    }
    return increment;
  }
}
