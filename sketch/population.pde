class populationManager {
  ArrayList<drawingObject> members = new ArrayList<drawingObject>();
  
  populationManager() {
    for (int i = 0; i < popSize; i++) {
      members.add(new drawingObject(true));
    }
  }
  
  void render() {
   for (drawingObject member : members) {
     member.render();
   }
  }
}
