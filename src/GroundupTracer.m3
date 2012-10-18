MODULE GroundupTracer EXPORTS Main;

IMPORT Math;

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
   pp 68-9). *)

CONST bred : REAL = 0.0;                 (* Black background *)
CONST bgrn : REAL = 0.0;
CONST bblu : REAL = 0.0;
CONST sphx : LONGREAL = 0.0d0;           (* Centre of sphere *)
CONST sphy : LONGREAL = 0.0d0;
CONST sphz : LONGREAL = 0.0d0;
CONST sphr : LONGREAL = 85.0d0;          (* Radius *)

PROCEDURE RenderScene () =
  VAR r, c : REAL;
  VAR red, grn, blu : REAL;
  BEGIN
    WITH rmax = FLOAT (vres), midRow = 0.5 * (rmax - 1.0),
         cmax = FLOAT (hres), midCol = 0.5 * (cmax - 1.0)
     DO
      r := 0.0;
      WHILE r < rmax DO
        c := 0.0;
        WHILE c < cmax DO
          WITH x = pixelSize * (FLOAT (c) - midCol),
               y = pixelSize * (FLOAT (r) - midRow)
           DO
            ox := FLOAT (x, LONGREAL);
            oy := FLOAT (y, LONGREAL);
          END;
          TraceRay (red, grn, blu);
          (* UNIMPLEMENTED DisplayPixel (r, c, red, grn, blu); *)
          c := c + 1.0;
        END;
        r := r + 1.0;
      END;
    END;
  END RenderScene;

(* ---------------------------------------------------------------- *)
(* Representing the single-sphere ray tracer (SingleSphere class
   p. 72). *) 

PROCEDURE TraceRay (VAR red, grn, blu : REAL) =
  BEGIN
    grn := bgrn; blu := bblu;
    SphereHit ();
    IF hitAnObject THEN
      red := 1.0;
    ELSE
      red := bred;
    END;
  END TraceRay;

(* ---------------------------------------------------------------- *)
(* Representing spherical objects (Sphere class p. 58). *) 

PROCEDURE SphereHit () =
  BEGIN
    WITH tmpx = ox - sphx, tmpy = oy - sphy, tmpz = oz - sphz, 
         a = rdx * rdx + rdy * rdy + rdz * rdz, 
         b = 2.0d0 * (tmpx * rdx + tmpy * rdy + tmpz * rdz),
         c = tmpx * tmpx + tmpy * tmpy + tmpz * tmpz - sphr * sphr,
         disc = b * b - 4.0d0 * a * c
     DO
      IF disc < 0.0d0 THEN
        hitAnObject := FALSE;
      ELSE
        WITH e = Math.sqrt (disc),
             denom = 2.0d0 * a,
             minRoot = (-b - e) / denom, maxRoot = (-b + e) / denom
         DO hitAnObject := minRoot > kEpsilon OR maxRoot > kEpsilon;
        END;
      END;
    END;
  END SphereHit;

(* ---------------------------------------------------------------- *)
(* Function main p. 64 *)

BEGIN
  RenderScene ();
END GroundupTracer.
