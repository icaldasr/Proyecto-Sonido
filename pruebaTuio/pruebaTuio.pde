import TUIO.*;

TuioProcessing tuio;
int posX;
int posY;

void setup()
{
  size(640,480);
  tuio = new TuioProcessing(this);
}

void draw()
{
  background(0);
  ellipse(posX,posY,20,20);
}

void updateTuioObject(TuioObject objetoTuio)
{
  posX = round(objetoTuio.getX()*width);
  posY = round(objetoTuio.getY()*height);
}

void identificateTuioObject(TuioObject objetoTuio)
{
  if(objetoTuio.getSymbolID() == 173)
  {
    println("Entra");
  }
}

void removeTuioObject(TuioObject objetoTuio)
{
  println("salio");
}
