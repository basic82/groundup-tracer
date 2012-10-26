MODULE Plane;

IMPORT Ray, ShadeRec, Triple AS V, Constants AS K;

PROCEDURE Hit 
  (plane : T; READONLY ray : Ray.T; VAR tmin : LONGREAL; 
   VAR sr : ShadeRec.T) : BOOLEAN =

  BEGIN
    WITH distance = V.Sub (plane.point, ray.o),
         t = V.Dot (distance, plane.normal) / 
             V.Dot (ray.d, plane.normal),
         intersected = t > K.epsilon
     DO IF intersected THEN tmin := t END;
     RETURN intersected
    END
  END Hit;

BEGIN
END Plane.
