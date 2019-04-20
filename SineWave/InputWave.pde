class InputWave{
  float frequencyI;
  float sinusoidalAxis;
  float gOfX;
  InputWave(){
  	frequencyI = 2;
  	sinusoidalAxis = 1;
  }

  InputWave(float tempFrequencyI, float tempSinusoidalAxis){
  	frequencyI = tempFrequencyI;
  	sinusoidalAxis = tempSinusoidalAxis;
  }

  void display(Axes other){
    //smooth(2);
    stroke(255, 255, 0);
    strokeWeight(1);

    float a = 0.0;
    float increment = TWO_PI / ((other.ticksPerUnit*other.tickSpacing)/frequencyI/.1);

  	for(float i = 0.0; i <= 4.5*other.ticksPerUnit*other.tickSpacing; i = i + .1){
      gOfX = (60*cos(a) + (60*sinusoidalAxis));
  		point(i+40, other.startPtY - gOfX);
      a = a + increment;
  	}
  }
}
