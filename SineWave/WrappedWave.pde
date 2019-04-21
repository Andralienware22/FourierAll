class WrappedWave{
	float frequency;
	float samplesPerInputPixel;
	int sizeScale;
  float sinusoidalAxisDisplacement;
  
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
  
  float colorRed;
  float colorBlue;
  float colorGreen;

	WrappedWave(){
		frequency = 1;
		samplesPerInputPixel = 1;
		sizeScale = 200;
    sinusoidalAxisDisplacement = 1;

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
    sinusoidalAxisDisplacement = inputWave.sinusoidalAxis;
    

		wrappedWaveAxisCenterX = other.wrappedWaveAxisCenterX;
	  wrappedWaveAxisCenterY = other.wrappedWaveAxisCenterY;
	  halfGridLine = other.halfGridLine;
	  linesPerSide = other.linesPerSide;

    ticksPerUnit = other.ticksPerUnit;
    lengthOfInputs = other.numberOfUnitLengths;
    pixelsPerTick =  other.tickSpacingX;
	  inputFrequency = inputWave.frequencyI;

    colorRed = frequency;
    colorBlue = inputFrequency;
    colorGreen = sinusoidalAxisDisplacement;

	}

	void graph(){
		stroke(255 * noise(colorRed), 255 * noise(colorBlue), 255 * noise(colorGreen));
  	strokeWeight(1);
  
    float a = 0;
		float aIncrement = TWO_PI * inputFrequency  / (samplesPerInputPixel * ticksPerUnit * pixelsPerTick);
    float graphIncrement = TWO_PI * frequency  / (ticksPerUnit * pixelsPerTick * samplesPerInputPixel);
	
	for(float i = 0; i <=  lengthOfInputs*ticksPerUnit*pixelsPerTick; i = i + graphIncrement){
			float hOfX = cos(a) - sinusoidalAxisDisplacement;
			float xOut = hOfX * cos(i) * .5 * halfGridLine;
			float yOut = hOfX * sin(i) * .5 * halfGridLine;
			point(wrappedWaveAxisCenterX-xOut, wrappedWaveAxisCenterY-yOut);
			a = a + aIncrement;
		}

	}
	
}
