program free_energy

  implicit none

  real:: dG1, dG, R, K, pK
  integer:: T, Tinit, Tfinal, Tstep
  character(len = 7):: unit

  R = 8.314

  print *, "Enter value for ∆G:"
  read *, dG1

  print *, "Enter units for ∆G ('J', 'KJmol-1', or 'eV'):"
  read *, unit

  print *, "Enter value for Tinit:"
  read *, Tinit

  print *, "Enter value for Tfin:"
  read *, Tfinal

  print *, "Enter value for Tstep:"
  read *, Tstep

  if (unit == "KJmol-1") then
    dG = dG1 * 1000
  else if (unit == "eV") then
    dG = dG1 * 1.602e-19 * 6.022e23
  else if (unit == "J") then
    dG = dG1 * 6.022e23
  else
    print *, "Invalid unit (not J, KJmol-1 or eV)."
    stop
  end if

  print *, "Temp.........", "K...............", "pK......."

  do T = Tinit, Tfinal, Tstep
    if (T <= 0) then
      print *, "Warning: T cannot be <= 0"
      stop
    end if

    K = exp(dG / (R * T))
    pk = log10(K)

    print *, T, K, pK
  end do

  stop

end
