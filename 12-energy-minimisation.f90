program  energy_minimisation

  implicit none

  real:: x0, E, Ep, Epp, x1
  integer:: A, B, i

  print*, "Enter value for xo"
  read*, x0

  print*, "Enter value for A”`
  read*, A

  print*, "Enter value for B"
  read*, B

  print*, "x0.....", "E.....", "E'.....", "E''.....", "x1....."

  do i = 1, 10
    Ep = -12 * A / x0 ** 13 + 6 * B / x0 ** 7
    Epp = 156 * A / x0 ** 14 - 42 * B / x0 ** 8
    x1 = x0 - Ep / Epp
    E = A / x0 ** 12 - B / x0 ** 6

    print*, x0, E, Ep, Epp, x1
    x0 = x1
  end do

  stop

end
