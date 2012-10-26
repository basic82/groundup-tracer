INTERFACE GeometricObject;

IMPORT Triple AS Colour, Ray, ShadeRec;

TYPE
  T = OBJECT 
    colour : Colour.T                    (* Replace with a material *)
  METHODS
    Hit (READONLY ray : Ray.T; VAR tmin : LONGREAL; 
         VAR sr : ShadeRec.T) : BOOLEAN
  END;

END GeometricObject.
