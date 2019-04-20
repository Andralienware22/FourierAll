InputWave iW1;
Axes axisSet;
int sizeX = 1280;
int sizeY = 720;

void setup(){
  size(1280, 720);
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

void draw(){
  iW1.display(axisSet);
}

//Times New Roman Setup
void Fontset(){
  PFont mono;
  mono = createFont("times-new-roman.ttf", 16);
  textFont(mono);
  textSize(16);
}
