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
int sizeX = 1280;
int sizeY = 720;

public void setup(){
  
  frameRate(60);
  background(20);

  Fontset();

  axisSet = new Axes();
  axisSet.InputAxes();
  axisSet.WrappedAxes();
  iW1 = new InputWave();
}

int xspacing = 1; //spacing of each pt
int w; //period of the wave

public void draw(){
  iW1.display(axisSet);
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
  float startPtX; // 40
  float startPtY; // 240
  float overHang; //5
  float yHeight; //144
  float wrappedWaveAxisCenterX; //232
  float wrappedWaveAxisCenterY; //500
  float halfGridLine; //192
  float numberOfUnitLengths;
  int ticksPerUnit;
  float endPtX;
  float tickSpacing;
  
  Axes(){
    startPtX = 40;
    startPtY = 240;
    overHang = 5;
    yHeight = 144;
    wrappedWaveAxisCenterX = 232;
    wrappedWaveAxisCenterY = 500;
    halfGridLine = 192;
    endPtX = width - startPtX;
    numberOfUnitLengths = 5;
    ticksPerUnit = 4;
    tickSpacing = (endPtX - startPtX) / (numberOfUnitLengths * ticksPerUnit); 
  }
  Axes(float tempStartptX, float tempStartPtY, float tempOverHang, float tempYHeight, float tempWrappedWaveAxisCenterX, float tempWrappedWaveAxisCenterY, float tempHalfGridLine, int tempTicksPerUnit, float tempNumberOfUnitLengths){
    startPtX = tempStartptX;
    startPtY = tempStartPtY;
    overHang =tempOverHang;
    yHeight = tempYHeight;
    wrappedWaveAxisCenterX = tempWrappedWaveAxisCenterX;
    wrappedWaveAxisCenterY = tempWrappedWaveAxisCenterY;
    halfGridLine = tempHalfGridLine;
    numberOfUnitLengths = tempNumberOfUnitLengths;
    ticksPerUnit = tempTicksPerUnit;
    tickSpacing = (endPtX - startPtX) / (numberOfUnitLengths * ticksPerUnit); 
  }

    //wave input visual axes  
  public void InputAxes(){
    stroke(255);
    strokeWeight(2);
    line(startPtX, startPtY, endPtX, startPtY); //horiz axis line
    line(endPtX - overHang, startPtY - overHang, endPtX, startPtY);//end arrow
    line(endPtX - overHang, startPtY + overHang, endPtX, startPtY);//end arrow top

    for(float i = tickSpacing; i < (endPtX-startPtX) ; i = i+tickSpacing){//tick marks
        line(startPtX+i, startPtY + overHang, startPtX + i, startPtY - overHang);
    }

    for (int i = 0; tickSpacing * i < endPtX-startPtX; i++) {
      if(i%ticksPerUnit == 0){
        text(i/ticksPerUnit, startPtX + tickSpacing*i, startPtY+20);
      }
    }

    line(startPtX, startPtY, startPtX, startPtY-yHeight);//vert axis line
    line(startPtX - overHang, startPtY-yHeight+ overHang, startPtX, startPtY-yHeight);
    line(startPtX + overHang, startPtY-yHeight + overHang, startPtX, startPtY-yHeight);

    for(float i = tickSpacing; i < yHeight; i = i+tickSpacing){//tck marks
      line(startPtX - overHang, startPtY-i, startPtX + overHang, startPtY-i);
    }
  }

  //wrapped wave axes
  public void WrappedAxes(){
    stroke(255);
    strokeWeight(2);
      line(wrappedWaveAxisCenterX-halfGridLine, wrappedWaveAxisCenterY, wrappedWaveAxisCenterX+halfGridLine, wrappedWaveAxisCenterY);
      line(wrappedWaveAxisCenterX, wrappedWaveAxisCenterY-halfGridLine, wrappedWaveAxisCenterX, wrappedWaveAxisCenterY+halfGridLine);
      for(int i=94; i < 200; i = i + 94){
        strokeWeight(1);
        stroke(0, 160, 210);
        
        line(wrappedWaveAxisCenterX - i, wrappedWaveAxisCenterY-halfGridLine, wrappedWaveAxisCenterX - i, wrappedWaveAxisCenterY + halfGridLine);
        line(wrappedWaveAxisCenterX + i, wrappedWaveAxisCenterY-halfGridLine, wrappedWaveAxisCenterX + i, wrappedWaveAxisCenterY + halfGridLine);
        line(wrappedWaveAxisCenterX - halfGridLine, wrappedWaveAxisCenterY - i, wrappedWaveAxisCenterX + halfGridLine, wrappedWaveAxisCenterY - i);
        line(wrappedWaveAxisCenterX - halfGridLine, wrappedWaveAxisCenterY + i , wrappedWaveAxisCenterX + halfGridLine, wrappedWaveAxisCenterY + i);
    }
  }
  /*public active float AxesStartPtY(){
    return startPtY;
  }*/
}
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

  public void display(Axes other){
    //smooth(2);
    stroke(255, 255, 0);
    strokeWeight(1);

    float a = 0.0f;
    float increment = TWO_PI / (other.ticksPerUnit*other.tickSpacing*wavelengthI/.1f);

  	for(float i = 0.0f; i <= 4.5f*4*60; i = i + .1f){
      gOfX = (60*cos(a) + (60*sinusoidalAxis));
  		point(i+40, other.startPtY - gOfX);
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
