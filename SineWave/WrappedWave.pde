class WrappedWave{
	float frequency;
	float samplesPerInputPixel;
	int sizeScale;

	//wrapped output
	int wrappedWaveAxisCenterX; //232
	int wrappedWaveAxisCenterY; //500
	int halfGridLine; //192
	float linesPerSide;
  
  int ticksPerUnit;
  float lengthOfInputs;
  float pixelsPerTick;


	float inputIncrement;
	float inputFrequency;


	WrappedWave(){
		frequency = 1;
		samplesPerInputPixel = 10;
		sizeScale = 200;

		wrappedWaveAxisCenterX = 250;
	    wrappedWaveAxisCenterY = 500;
	    halfGridLine = 200;
	    linesPerSide = 2;
      
      ticksPerUnit = 5;
      lengthOfInputs = 5;
      pixelsPerTick =  60;

	    inputIncrement = 0.0041887905;
	    inputFrequency = 2;

      
	}
	WrappedWave(float tempFrequency, Axes other, InputWave inputWave){
		frequency = tempFrequency;
		samplesPerInputPixel = inputWave.samplesPerPixel;
		sizeScale = other.halfGridLine;

		wrappedWaveAxisCenterX = other.wrappedWaveAxisCenterX;
	    wrappedWaveAxisCenterY = other.wrappedWaveAxisCenterY;
	    halfGridLine = other.halfGridLine;
	    linesPerSide = other.linesPerSide;

      ticksPerUnit = other.ticksPerUnit;
      lengthOfInputs = other.numberOfUnitLengths;
      pixelsPerTick =  other.tickSpacingX;
      
	    inputIncrement = inputWave.display(other);
	    inputFrequency = inputWave.frequencyI;

	}

	void graph(){
		stroke(220, 40, 40);
  	strokeWeight(1);
  
    float a = 0;
		float aIncrement = TWO_PI * inputFrequency  / (samplesPerInputPixel * ticksPerUnit * pixelsPerTick);
    float graphIncrement = TWO_PI * frequency  / (ticksPerUnit * pixelsPerTick * samplesPerInputPixel);
	
	for(float i = 0; i <=  samplesPerInputPixel*lengthOfInputs*ticksPerUnit*pixelsPerTick; i = i + frequency / samplesPerInputPixel){
			float hOfX = cos(a);
			float xOut = hOfX * cos(i) * halfGridLine;
			float yOut = hOfX * sin(i) * halfGridLine;
			point(wrappedWaveAxisCenterX-xOut, wrappedWaveAxisCenterY-yOut);
			a = a + aIncrement;
		}
		println(inputIncrement); 
	}
	
}
