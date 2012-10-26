MODULE Triple;

PROCEDURE Add (READONLY a, b : T) : T =
  BEGIN
    RETURN T {a.i + b.i, a.ii + b.ii, a.iii + b.iii}
  END Add;

PROCEDURE Sub (READONLY a, b : T) : T =
  BEGIN
    RETURN T {a.i - b.i, a.ii - b.ii, a.iii - b.iii}
  END Sub;

PROCEDURE Dot (READONLY a, b : T) : LONGREAL =
  BEGIN
    RETURN a.i * b.i + a.ii * b.ii + a.iii * b.iii
  END Dot;  

PROCEDURE Scale (READONLY a : T; s : LONGREAL) : T =
  BEGIN
    RETURN T {a.i * s, a.ii * s, a.iii * s}
  END Scale;

BEGIN
END Triple.
