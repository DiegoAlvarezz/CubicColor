
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
Box2DProcessing box2d;

Box box;

ArrayList<Boundary> boundaries;
ArrayList<Lollipop> pops;

Spring spring;

float xoff = 0;
float yoff = 1000;


void setup() {
  size(640,360);
  
  box2d = new Box2DProcessing(this,20);
  box2d.createWorld();
 
  box2d.setGravity(0, -20);

  	
  pops = new ArrayList<Lollipop>();
  boundaries = new ArrayList<Boundary>();
  
 
  boundaries.add(new Boundary(width/2,height-5,width/2,10));
  boundaries.add(new Boundary(width/2,5,width,10));
  boundaries.add(new Boundary(width-5,height/2,10,height));
  boundaries.add(new Boundary(5,height/2,10,height));
  
  boundaries.add(new Boundary(300,470,10,height));
  
  
 box = new Box(width/2,height/2);

  
  spring = new Spring();
  spring.bind(width/2,height/2,box);


}


  




void draw() {
  background(0);

 
  box2d.step();

  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }

 
  for (Lollipop p: pops) {
    p.display();
  }
  
  for (int i = pops.size()-1; i >= 0; i--) {
    Lollipop p = pops.get(i);
    if (p.done()) {
      pops.remove(i);
    }
  }
    
    if (mousePressed) {
    spring.update(mouseX,mouseY);
  }
  



 box.display();

}

void mouseReleased() {
  Lollipop p = new Lollipop(mouseX,mouseY);
  pops.add(p);
  
}


 
    
  
  
