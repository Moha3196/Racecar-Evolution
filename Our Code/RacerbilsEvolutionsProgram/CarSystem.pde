class CarSystem {
  //CarSystem - 
  //Her kan man lave en generisk alogoritme, der skaber en optimal "hjerne" til de forhåndenværende betingelser

  ArrayList<CarController> CarControllerList = new ArrayList<CarController>();
  ArrayList<CarController> goodCars = new ArrayList<CarController>();

  int badCars = 0;  //variable to keep track of bad cars, so CarControllerList can be filled back up to full population

  CarSystem(int populationSize) {
    for (int i = 0; i < populationSize; i++) { 
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


  void createGeneration() {  //function for almost everything about making a new generation
    for (int i = 0; i < populationSize; i++) {
      if (CarControllerList.get(i).sensorSystem.clockWiseRotationFrameCounter >= 255  &&  //this statement only takes the best cars - those with a high green-value 
          CarControllerList.get(i).sensorSystem.whiteSensorFrameCount == 0  &&  //that haven't gone outside the track, 
          CarControllerList.get(i).sensorSystem.lapTimeInFrames <= 300  //and who have a semi-low laptime
        ) {
        goodCars.add(CarControllerList.get(i));
        //println(" ");
        //  code for printing good weights+biases was previously here
        //println("Car " + i + "'s green-value is: " + CarControllerList.get(i).sensorSystem.clockWiseRotationFrameCounter);
        //println("Car " + i + "'s lap time is: " + CarControllerList.get(i).sensorSystem.lapTimeInFrames);

        //fill(0, 255, 0);
        //circle(CarControllerList.get(i).bil.pos.x, CarControllerList.get(i).bil.pos.y, 50);
      }
      else if (goodCars.size() > 0) {
        //CarControllerList.remove(CarControllerList.get(i));
        //badCars++;

        for (int j = 0; j < CarControllerList.get(i).hjerne.weights.length; j++) {
          CarControllerList.get(i).hjerne.weights[j] = goodCars.get(j).hjerne.weights[j];
          if (j < 3) {
            CarControllerList.get(i).hjerne.weights[j] = goodCars.get(j).hjerne.biases[j];
          }
        }
      }
      else {
        CarControllerList.remove(CarControllerList.get(i));
      }
      if (CarControllerList.size() == 0) {
        for (int c = 0; c < populationSize; c++) {
          CarController controller = new CarController();
          CarControllerList.add(controller);
        }
      }

      //code for printing good weights+biases
      for (int j = 0; j < CarControllerList.get(i).hjerne.weights.length; j++) {
        int b = j+1;
        println("Weigh " + b + " for Car " + i + " is: " + CarControllerList.get(i).hjerne.weights[j]);
        if (j < 3) {
          println("Bias " + b + " for Car " + i + " is: " + CarControllerList.get(i).hjerne.biases[j]);
        }
      }
    }
  }
}
