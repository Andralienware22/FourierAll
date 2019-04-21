InputWave iW1;
Axes axisSet;
WrappedWave wW1;

void setup(){
  size(1280, 720);
  frameRate(30);
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

void draw(){
  iW1.display(axisSet);
  wW1.graph();
}

//Times New Roman Setup
void Fontset(){
  PFont mono;
  mono = createFont("times-new-roman.ttf", 16);
  textFont(mono);
  textSize(16);
}
