class CarSystem {
  //CarSystem - 
  //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser

  ArrayList<CarController> CarControllerList  = new ArrayList<CarController>();

  CarSystem(int populationSize) {
    for (int i=0; i<populationSize; i++) { 
      CarController controller = new CarController();
      CarControllerList.add(controller);
    }
  }

  void updateAndDisplay() {
    //1.) Opdaterer sensorer og bilpositioner
    for (CarController controller : CarControllerList) {
      controller.update();
    }

    //2.) Tegner tilsidst - så sensorer kun ser banen og ikke andre biler!
    for (CarController controller : CarControllerList) {
      controller.display();
    }
  }

  void getWeights() {
    for (int i = 0; i < CarControllerList.size(); i++) {
      if (CarControllerList.get(i).sensorSystem.clockWiseRotationFrameCounter >= 255 &&
          CarControllerList.get(i).sensorSystem.whiteSensorFrameCount == 0
      ) {
        println(" ");
        for (int j = 0; j < CarControllerList.get(i).hjerne.weights.length; j++) {
          int b = j+1;
          println("Weigh " + b + " for Car " + i + " is: " + CarControllerList.get(i).hjerne.weights[j]);
          if (j < 3) {
            println("Bias " + b + " for Car " + i + " is: " + CarControllerList.get(i).hjerne.biases[j]);
          }
        }
        println("Car " + i + "'s green-value is: " + CarControllerList.get(i).sensorSystem.clockWiseRotationFrameCounter);
        //CarControllerList.get(i).sensorSystem.highlighter = 255;
        fill(CarControllerList.get(i).sensorSystem.clockWiseRotationFrameCounter);
        circle(CarControllerList.get(i).bil.pos.x, CarControllerList.get(i).bil.pos.y, 50);
      }
    }
  }
}
