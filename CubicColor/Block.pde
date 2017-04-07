
class Lollipop {

  
  Body body;
  float w;
  float h;


 
  Lollipop(float x, float y) {
    w = 24;
    h = 24;

  
    makeBody(new Vec2(x, y));
  }

 
  void killBody() {
    box2d.destroyBody(body);
  }

  
  boolean done() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
   
    if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
  }


  void display() {
   
    Vec2 pos = box2d.getBodyPixelCoord(body);
   
    float a = body.getAngle();

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(random(255),random(255),random(255));
    noStroke();
    strokeWeight(2);

    rect(0,0,w,h);
    //ellipse(0, -h/2, r*2, r*2);
    popMatrix();
  }


  void makeBody(Vec2 center) {

    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

   
    Vec2 offset = new Vec2(0,-h/2);
    offset = box2d.vectorPixelsToWorld(offset);
 

    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);

    body.createFixture(ps,1.0);
    

    
    body.setLinearVelocity(new Vec2(random(0, 0.5), random(0, 0.5)));
    body.setAngularVelocity(random(0.5, 0.5));
  }
}