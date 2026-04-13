class Planet {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitspeed; // Orbit speed
  color planetColor;
 
  // Each Planet now has a Moon!
  Moon moon1, moon2;
 
  // Criado mais um parâmetro para informar a quantidade de luas (max. 2)
  Planet(float distance_, float diameter_, int qtdLuas) {
    distance = distance_;
    diameter = diameter_;
    theta = 0;
    orbitspeed = random(0.01,0.03);
    //Cores aleatorias para os planetas
    planetColor = color(random(255), random(255), random(255));
    
    
    // create the Moon 24 pixels from the planet with a diameter of 5
    if(qtdLuas == 1){
      moon1 = new Moon(24,random(1,9));
    } else {
      moon1 = new Moon(24,random(1,9));
      moon2 = new Moon(40,random(1,9));
    }
  }
  
  void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
    // Update the moon
    moon1.update();
    if (moon2 != null){
      moon2.update();
    }
  }
  
  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    // Rotate orbit
    rotate(theta); 
    // translate out distance
    translate(distance,0); 
    stroke(0);
    fill(planetColor);
    ellipse(0,0,diameter,diameter);
    // The planet is drawn, now draw the moon
    moon1.display();
    if (moon2 != null){
      moon2.display();
    }
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix(); 
  }
}
