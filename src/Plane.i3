INTERFACE Plane;

IMPORT GeometricObject, Ray, ShadeRec, Triple AS Point, 
       Triple AS Normal;

TYPE
  T = GeometricObject.T OBJECT
    point : Point.T;
    normal : Normal.T
  OVERRIDES
    Hit := Hit
  END;

PROCEDURE Hit 
  (plane : T; READONLY ray : Ray.T; VAR tmin : LONGREAL; 
   VAR sr : ShadeRec.T) : BOOLEAN;

END Plane.
