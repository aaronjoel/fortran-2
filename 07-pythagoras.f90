program pythagoras

  real:: i, j

  write(*, *) 'Length of side A:'
  read(*, *) i

  write(*, *) 'Length of side B:'
  read(*, *) j

  write(*, *) 'Length of side C:', sqrt(i**2 + j**2)

  ! Exercise: calculate the perimeter.
  ! EXercise: why do we need i and j to be real?

end program pythagoras
