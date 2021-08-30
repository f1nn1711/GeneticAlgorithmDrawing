class populationManager {
  ArrayList<drawingObject> members = new ArrayList<drawingObject>();

  populationManager() {
    for (int i = 0; i < popSize; i++) {
      members.add(new drawingObject(true));
    }
  }

  populationManager calculateNewPopulation(populationManager startingPop) {
    float maxFit = 0;
    float minFit = 999999999;

    for (drawingObject member : startingPop.members) {
      member.calcualateFitness();

      if (member.fitness < minFit) {
        minFit = member.fitness;
      }

      if (member.fitness > maxFit) {
        maxFit = member.fitness;
      }
    }

    for (drawingObject member : startingPop.members) {
      member.fitness = round(map(member.fitness, minFit, maxFit, 1, 100));
    }

    ArrayList<drawingObject> pool = new ArrayList<drawingObject>();
    
    for (drawingObject member : startingPop.members) {
      for (int i = 0; i < member.fitness; i++) {
        pool.add(member);
      }
    }
  }

  void render() {
    for (drawingObject member : members) {
      member.render();
    }
  }
}
