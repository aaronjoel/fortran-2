
program  energy_minimisation_harmonic

  implicit none

  real:: x0, E, Ep, Epp, x1, k
  integer:: A, B, i
  k = 32.2

  print*, "Enter value for xo"
  read*, x0

  print*, "Enter value for A"
  read*, A

  print*, "Enter value for B"
  read*, B

  print*, "x0.....", "E.....", "E'.....", "E''.....", "x1....."

  do i = 1, 10
    Ep = k * x
    Epp = k
    x1 = x0 - Ep / Epp
    E = 0.5 * k * x0 ** 2

    print*, x0, E, Ep, Epp, x1
    x0 = x1
  end do

  stop

end
