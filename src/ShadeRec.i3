INTERFACE ShadeRec;

IMPORT Triple AS Colour;

TYPE
  T = RECORD
    hitAnObject : BOOLEAN := FALSE;
    colour : Colour.T                    (* Replace with a material *)
  END;

END ShadeRec.
