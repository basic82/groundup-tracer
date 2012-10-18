MODULE GroundupTracer EXPORTS Main;

(* A bare-bones system that works like the one in RTftGU ch. 3, and
   for a start, the implementation given in sec. 3.1-3.8 which is
   concerned with rendering a particular single-sphere scene.

   Global variables and free-standing procedures are used here in
   place of classes (p. 62 summarizes a better, extensible
   design). The main reason for using a different design here is to
   better understand the code in ch. 3 (re-formulation aids
   comprehension). The resulting program is shorter, too. *)

(* ---------------------------------------------------------------- *)
(* Representing rays (Ray class p. 50). As only a single ray is cast
   at a time, we need just one set of ray state variables. *)

VAR ox, oy : LONGREAL;                   (* Ray origin point *)
CONST oz : LONGREAL = 100.0d0;           (* Origin z-coord, p. 69 *)
CONST rdx : LONGREAL = 0.0d0;            (* Ray direction, p. 69 *)
CONST rdy : LONGREAL = 0.0d0;
CONST rdz : LONGREAL = -1.0d0;

(* ---------------------------------------------------------------- *)
(* Representing hit results (ShadeRec class p. 53). As the scene
   contains just one object all we need to know is whether or not it
   was hit. *)

VAR hitAnObject : BOOLEAN;               (* Did ray hit sphere *)

(* ---------------------------------------------------------------- *)
(* Representing geometric objects (p. 55, also pp 301-3). *)

CONST kEpsilon : LONGREAL = 1.0d-5;

(* ---------------------------------------------------------------- *)
(* Representing the view plane (ViewPlane class p. 65). *)

CONST hres : INTEGER = 200;              (* Image width in pixels *)
CONST vres : INTEGER = 200;              (* Image height *)
CONST pixelSize : REAL = 1.0;

(* ---------------------------------------------------------------- *)
(* Representing the single-sphere scene (World class p. 63, also
   pp 68-9). The sphere's x- & y-coordinates are zero. *)

CONST bred : REAL = 0.0;                 (* Black background *)
CONST bgrn : REAL = 0.0;
CONST bblu : REAL = 0.0;
CONST sphz : LONGREAL = 0.0d0;           (* Sphere z-coord & radius *)
CONST sphr : LONGREAL = 85.0d0;

PROCEDURE RenderScene () =
  VAR r, c : REAL := 0.0;
  VAR red, grn, blu : REAL;
  BEGIN
    WITH rmax = FLOAT (vres), midRow = 0.5 * (rmax - 1.0),
         cmax = FLOAT (hres), midCol = 0.5 * (cmax - 1.0)
     DO
      WHILE r < rmax DO
        WHILE c < cmax DO
          WITH x = pixelSize * (FLOAT (c) - midCol),
               y = pixelSize * (FLOAT (r) - midRow)
           DO
            ox := FLOAT (x, LONGREAL);
            oy := FLOAT (y, LONGREAL);
          END;
          (* UNIMPLEMENTED TraceRay (red, grn, blu); *)
          (* UNIMPLEMENTED DisplayPixel (r, c, red, grn, blu); *)
          c := c + 1.0;
        END;
        r := r + 1.0;
      END;
    END;
  END RenderScene;

(* ---------------------------------------------------------------- *)
(* Function main p. 64 *)

BEGIN
  RenderScene ();
END GroundupTracer.
