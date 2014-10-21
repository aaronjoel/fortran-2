program files

	implicit none

  integer:: i, j, k

  open(10, file = 'test.dat')

  read(10, *) i, j, k

  print *, 'Found numbers', i, j, 'and', k

  read (10, *) i, j, k

  print *, 'Found numbers', i, j, 'and', k

  close(10)

  ! Exercise: how do you think we get the other three numbers?
  ! Exercise: update the program to print the other three as well.

end program files
