program output

  integer:: i, j, k

  open(10, file = 'test.dat')
  open(1, file = 'test2.dat')

  read(10, *) i, j, k

  write(1, *) 'The numbers are', i, j, 'and', k

end program output
