INTERFACE Triple;

TYPE 
  T = RECORD
    i, ii, iii : LONGREAL := 0.0d0;
  END;  

PROCEDURE Add (READONLY a, b : T) : T;

PROCEDURE Sub (READONLY a, b : T) : T;

PROCEDURE Dot (READONLY a, b : T) : LONGREAL;

PROCEDURE Scale (READONLY a : T; s : LONGREAL) : T;

END Triple.
