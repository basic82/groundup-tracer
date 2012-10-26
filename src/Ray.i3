INTERFACE Ray;

IMPORT Triple AS Point, Triple AS Vector;

TYPE
  T = RECORD
    o: Point.T := Point.T {};            (* Origin *)
    d: Vector.T := Vector.T {1.0d0}      (* Direction, unit vector *)
  END;

END Ray.
