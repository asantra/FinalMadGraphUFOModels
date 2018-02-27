c Momenta of particles in event, written by the user

      REAL*8 FUNCTION mymdl_FormFactor(AAA)
      IMPLICIT NONE
      INCLUDE '../genps.inc'
      COMMON/momenta_pp/pp
      INCLUDE 'input.inc' ! include all model parameter
      REAL*8 pp(0:3,max_particles), DOT
      REAL*8 AAA, ENERGYSQUARE
      REAL*8 PSQUARE, OUTVAL
      REAL*8 SHAT

      PSQUARE = pp(1,2)*pp(1,2)+pp(2,2)*pp(2,2)+pp(3,2)*pp(3,2)
      ENERGYSQUARE  = pp(0,3)*pp(0,3)
      SHAT = 2*DOT(pp(0,1),pp(0,2))
      mymdl_FormFactor = SQRT(1 - 4*AAA*AAA/SHAT)
      !mymdl_FormFactor = SQRT(1.0 - AAA*AAA/(ENERGYSQUARE))  ! beta = sqrt(1 - mass^2/energy^2)
      OUTVAL = mymdl_FormFactor
      !PRINT *, 'PSQUARE:', PSQUARE
      !PRINT *, 'MASS: ', AAA
      !PRINT *, 'SHAT: ', SHAT
      PRINT *, 'Form Factor:', OUTVAL
      PRINT *, 'ENERGYSQUARE: ', ENERGYSQUARE 
      
      RETURN
      END