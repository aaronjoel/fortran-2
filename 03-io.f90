program io

  integer:: i, j

  ! This is a comment. You can write anything here!

  write(*, *) 'Simple calculator'

  write(*, *) 'First number:'
  read(*, *) i

  write(*, *) 'Second number:'
  read(*, *) j

  write(*, *) 'The product of', i, 'and', j, 'is', i * j
  write(*, *) 'The sum of', i, 'and', j, 'is', i + j
  ! Exercise: print the sum as well.

end program io
