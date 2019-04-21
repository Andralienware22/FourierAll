class WrappedWave{
	float frequency;
	float samplesPerInputPixel;
	int sizeScale;
	float a = 0;

	//wrapped output
	int wrappedWaveAxisCenterX; //232
	int wrappedWaveAxisCenterY; //500
	int halfGridLine; //192
	float linesPerSide;

	WrappedWave(){
		frequency = 1;
		samplesPerInputPixel = 10;
		sizeScale = 200;

		wrappedWaveAxisCenterX = 250;
	    wrappedWaveAxisCenterY = 500;
	    halfGridLine = 200;
	    linesPerSide = 2;
	}
	WrappedWave(float tempFrequency, Axes other, InputWave inputWave){
		frequency = tempFrequency;
		samplesPerInputPixel = inputWave.samplesPerPixel;
		sizeScale = other.halfGridLine;

		wrappedWaveAxisCenterX = other.wrappedWaveAxisCenterX;
	    wrappedWaveAxisCenterY = other.wrappedWaveAxisCenterY;
	    halfGridLine = other.halfGridLine;
	    linesPerSide = other.linesPerSide;
	}

	void graph(){
		stroke(220, 40, 40);
    	strokeWeight(1);

		float increment = TWO_PI /(samplesPerInputPixel/frequency);

		for(float i = 0; i <=  TWO_PI; i = i + 1 / (samplesPerInputPixel)){
			float hOfX = (cos(a));
			float xOut = hOfX * cos(i) * halfGridLine;
			float yOut = hOfX * sin(i) * halfGridLine;
			point(wrappedWaveAxisCenterX-xOut, wrappedWaveAxisCenterY-yOut);
			a = a + increment;
		} 
	}
	
}