InputWave iW1;
Axes axisSet;
WrappedWave wW1;
WrappedWave wW2;
WrappedWave wW3;

void setup(){
  size(1280, 720);
  frameRate(.2);
  background(20);
  noiseSeed(4);
  noiseDetail(3,0.5);

  Fontset();

  axisSet = new Axes(40, 240, 5, 144, 4, 1, 10, 250, 500, 200, 4);
  axisSet.InputAxes();
  axisSet.WrappedAxes();
  iW1 = new InputWave(2, 1, 10);
  wW1 = new WrappedWave(4, axisSet, iW1);
  wW2 = new WrappedWave(8, axisSet, iW1);
  wW3 = new WrappedWave(1, axisSet, iW1);
}

int xspacing = 1; //spacing of each pt
int w; //period of the wave

void draw(){
  iW1.display(axisSet);
  wW1.graph();
  wW2.graph();
  wW3.graph();
}

//Times New Roman Setup
void Fontset(){
  PFont mono;
  mono = createFont("times-new-roman.ttf", 16);
  textFont(mono);
  textSize(16);
}
