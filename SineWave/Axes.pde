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
  float tickSpacingX;
  float  tickSpacingY;
  Axes(){
    startPtX = 40;
    startPtY = 240;
    overHang = 5;
    yHeight = 144;
    wrappedWaveAxisCenterX = 232;
    wrappedWaveAxisCenterY = 500;
    halfGridLine = 192;
    numberOfUnitLengths = 5;
    ticksPerUnit = 4;
    endPtX = width - startPtX;
    tickSpacingX = (endPtX - startPtX) / (numberOfUnitLengths * ticksPerUnit); 
    tickSpacingY = tickSpacingX * 1;
  }
  Axes(float tempStartptX, float tempStartPtY, float tempOverHang, float tempYHeight, float tempWrappedWaveAxisCenterX, float tempWrappedWaveAxisCenterY, float tempHalfGridLine, float tempNumberOfUnitLengths, int tempTicksPerUnit, int tickConversionFactor){
    startPtX = tempStartptX;
    startPtY = tempStartPtY;
    overHang =tempOverHang;
    yHeight = tempYHeight;
    wrappedWaveAxisCenterX = tempWrappedWaveAxisCenterX;
    wrappedWaveAxisCenterY = tempWrappedWaveAxisCenterY;
    halfGridLine = tempHalfGridLine;
    numberOfUnitLengths = tempNumberOfUnitLengths;
    ticksPerUnit = tempTicksPerUnit;
    endPtX = width - startPtX;
    tickSpacingX = (endPtX - startPtX) / (numberOfUnitLengths * ticksPerUnit); 
    tickSpacingY = tickSpacingX * tickConversionFactor;
  }

    //wave input visual axes  
  void InputAxes(){
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
  void WrappedAxes(){
    stroke(255);
    strokeWeight(2);
      line(wrappedWaveAxisCenterX-halfGridLine, wrappedWaveAxisCenterY, wrappedWaveAxisCenterX+halfGridLine, wrappedWaveAxisCenterY);
      line(wrappedWaveAxisCenterX, wrappedWaveAxisCenterY-halfGridLine, wrappedWaveAxisCenterX, wrappedWaveAxisCenterY+halfGridLine);
      for(int i=94; i < 189; i = i + 94){
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
