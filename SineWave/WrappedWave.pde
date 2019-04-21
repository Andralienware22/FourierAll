class WrappedWave{
	float frequency;
	float hOfX;
	float samplesPerInputPixel;
	int sizeScale;
	WrappedWave(){
		frequency = 1;
		samplesPerInputPixel = 10;
		sizeScale = 200;
	}
	WrappedWave(float tempFrequency, Axes other, InputWave inputWave){
		frequency = tempFrequency;
		samplesPerInputPixel = inputWave.samplesPerPixel;
		sizeScale = other.halfGridLine;
	}

}