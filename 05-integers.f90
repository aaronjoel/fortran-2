program integers

  integer:: i

  i = -2.5
  write(*, *) '-2.5 is stored as', i

  i = int(-2.5)
  write(*, *) 'int(-2.5) is stored as', i

  i = nint(-2.5)
  write(*, *) 'nint(-2.5) is stored as', i

  ! Exercise: what do you think nint(-2.5) is? int(-2.5)?

end program integers
