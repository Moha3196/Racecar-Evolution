//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int populationSize = 50;     

//CarSystem: Indholder en population af "controllere" 
CarSystem carSystem = new CarSystem(populationSize);

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn 
PImage trackImage;

void setup() {
  size(500, 600);
  
  trackImage = loadImage("track.png");
}

void draw() {
  background(255);
  image(trackImage, -50, 80);  
  //noLoop();

  carSystem.updateAndDisplay();

  //TESTKODE: Frastortering af dårlige biler, for hver gang der går 200 frame - f.eks. dem der kører uden for banen
  //if (frameCount % 300 == 0) {
    //println("FJERN DEM DER KØRER UDENFOR BANEN frameCount: " + frameCount);
    //for (int i = carSystem.CarControllerList.size()-1; i >= 0; i--) {
    //  SensorSystem s = carSystem.CarControllerList.get(i).sensorSystem;
    //  if (s.whiteSensorFrameCount > 0) {
    //    carSystem.CarControllerList.remove(carSystem.CarControllerList.get(i));
    //  }
    carSystem.getWeights();
    //noLoop();
  //}
}
