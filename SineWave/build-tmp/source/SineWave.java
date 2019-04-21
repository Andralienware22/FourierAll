import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SineWave extends PApplet {

InputWave iW1;
Axes axisSet;
WrappedWave wW1;

public void setup(){
  
  frameRate(60);
  background(20);

  Fontset();

  axisSet = new Axes(40, 240, 5, 144, 4, 4, 1, 250, 500, 200, 4);
  axisSet.InputAxes();
  axisSet.WrappedAxes();
  iW1 = new InputWave(2, 1, 10);
  wW1 = new WrappedWave(2, axisSet, iW1);
}

int xspacing = 1; //spacing of each pt
int w; //period of the wave

public void draw(){
  iW1.display(axisSet);
  wW1.graph();
}

//Times New Roman Setup
public void Fontset(){
  PFont mono;
  mono = createFont("times-new-roman.ttf", 16);
  textFont(mono);
  textSize(16);
}
//wave input visual axes
class Axes{
  //wave Input
  float startPtX; // 40
  float startPtY; // 240
  float overHang; //5
  float yHeight; //144
  float numberOfUnitLengths;
  int ticksPerUnit;
  float endPtX;
  float tickSpacingX;
  float  tickSpacingY;

  //wrapped output
  int wrappedWaveAxisCenterX; //232
  int wrappedWaveAxisCenterY; //500
  int halfGridLine; //192
  float linesPerSide;
  Axes(){
    startPtX = 40;
    startPtY = 240;
    overHang = 5;
    yHeight = 144;
    numberOfUnitLengths = 5;
    ticksPerUnit = 4;
    endPtX = width - startPtX;
    tickSpacingX = (endPtX - startPtX) / (numberOfUnitLengths * ticksPerUnit); 
    tickSpacingY = tickSpacingX * 1;


    wrappedWaveAxisCenterX = 250;
    wrappedWaveAxisCenterY = 500;
    halfGridLine = 200;
    linesPerSide = 2;
  }
  Axes(float tempStartptX, float tempStartPtY, float tempOverHang, float tempYHeight, float tempNumberOfUnitLengths, int tempTicksPerUnit, int tickConversionFactor, int tempWrappedWaveAxisCenterX, int tempWrappedWaveAxisCenterY, int tempHalfGridLine, float tempLinesPerSide){
    startPtX = tempStartptX;
    startPtY = tempStartPtY;
    overHang =tempOverHang;
    yHeight = tempYHeight;
    numberOfUnitLengths = tempNumberOfUnitLengths;
    ticksPerUnit = tempTicksPerUnit;
    endPtX = width - startPtX;
    tickSpacingX = (endPtX - startPtX) / (numberOfUnitLengths * ticksPerUnit); 
    tickSpacingY = tickSpacingX * tickConversionFactor;

    wrappedWaveAxisCenterX = tempWrappedWaveAxisCenterX;
    wrappedWaveAxisCenterY = tempWrappedWaveAxisCenterY;
    halfGridLine = tempHalfGridLine;
    linesPerSide = tempLinesPerSide;
  }

    //wave input visual axes  
  public void InputAxes(){
    stroke(255);
    strokeWeight(2);
    line(startPtX, startPtY, endPtX, startPtY); //horiz axis line
    line(endPtX - overHang, startPtY - overHang, endPtX, startPtY);//end arrow
    line(endPtX - overHang, startPtY + overHang, endPtX, startPtY);//end arrow top

    for(float i = tickSpacingX; i < (endPtX-startPtX) ; i = i+tickSpacingX){//tick marks
        line(startPtX+i, startPtY + overHang, startPtX + i, startPtY - overHang);
    }

    for (int i = 0; tickSpacingX * i < endPtX-startPtX; i++) {
      if(i%ticksPerUnit == 0){
        text(i/ticksPerUnit, startPtX + tickSpacingX*i, startPtY+20);
      }
    }

    line(startPtX, startPtY, startPtX, startPtY-yHeight);//vert axis line
    line(startPtX - overHang, startPtY-yHeight+ overHang, startPtX, startPtY-yHeight);
    line(startPtX + overHang, startPtY-yHeight + overHang, startPtX, startPtY-yHeight);

    for(float i = tickSpacingY; i < yHeight; i = i+tickSpacingY){//tck marks
      line(startPtX - overHang, startPtY-i, startPtX + overHang, startPtY-i);
    }
  }

  //wrapped wave axes
  public void WrappedAxes(){
    stroke(255);
    strokeWeight(2);
      line(wrappedWaveAxisCenterX-halfGridLine, wrappedWaveAxisCenterY, wrappedWaveAxisCenterX+halfGridLine, wrappedWaveAxisCenterY);
      line(wrappedWaveAxisCenterX, wrappedWaveAxisCenterY-halfGridLine, wrappedWaveAxisCenterX, wrappedWaveAxisCenterY+halfGridLine);
       for(float i = halfGridLine / linesPerSide; i <= halfGridLine; i = i + halfGridLine / linesPerSide){
        strokeWeight(1); //sets weights
        stroke(0, 160, 210); //sets color
        
        line(wrappedWaveAxisCenterX - i, wrappedWaveAxisCenterY-halfGridLine, wrappedWaveAxisCenterX - i, wrappedWaveAxisCenterY + halfGridLine);
        line(wrappedWaveAxisCenterX + i, wrappedWaveAxisCenterY-halfGridLine, wrappedWaveAxisCenterX + i, wrappedWaveAxisCenterY + halfGridLine);
        line(wrappedWaveAxisCenterX - halfGridLine, wrappedWaveAxisCenterY - i, wrappedWaveAxisCenterX + halfGridLine, wrappedWaveAxisCenterY - i);
        line(wrappedWaveAxisCenterX - halfGridLine, wrappedWaveAxisCenterY + i , wrappedWaveAxisCenterX + halfGridLine, wrappedWaveAxisCenterY + i);
    }

  }
  /* public active float AxesStartPtY(){
    return startPtY;
  }
  */
}
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

  public void display(Axes other){
    //smooth(2);
    stroke(255, 255, 0);
    strokeWeight(1);

    float a = 0.0f;
    float increment = TWO_PI / ((other.ticksPerUnit*other.tickSpacingX)/frequencyI*samplesPerPixel);

  	for(float i = 0.0f; i <= other.numberOfUnitLengths*other.ticksPerUnit*other.tickSpacingX; i = i + 1 / samplesPerPixel){
      gOfX = (cos(a));
  		point(i+other.startPtX, other.startPtY - other.tickSpacingY*gOfX - (other.tickSpacingY*sinusoidalAxis));
      a = a + increment;
  	}
  }
}
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

	public void graph(){
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
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SineWave" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
