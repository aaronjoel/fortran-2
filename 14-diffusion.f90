program diffusion

	implicit none

	! n: the number of lines in the file.
	! IO: the error code for the reads. See line 34.

	integer :: n, io, i
	real, dimension(:), allocatable:: x, y

	! The sums accumulated in the read loop.
	! s_abc = the S values for regression. (See formula on sheet).
	real :: Ex, Ey, Exy, Ex2, Ey2, Sxy, Sxx, Syy, Sxxy, r, c0, c1, dwc, D

	! You must set a variable before you get it - otherwise, you can't guarantee
	! its value. For example, the first line with n is "n = n + 1". Becasue we
	! don't know what n *was*, we can't know what it will be, so you'll get weird
	! results. Hence, we set it to 0 on the line below.

	n    = 0
	Ex   = 0
	Ey   = 0
	Exy  = 0
	Ex2  = 0
	Ey2  = 0

	open(11, file = "msd.txt") ! Open the file.

	! --- HOW LONG IS THE FILE ????????????

	read(11, *) ! Ignore the first line - it's the header.

  do
  	! IOSTAT is for recording the success of a file read. More here:
  	! http://www.oc.nps.edu/~bird/oc3030_online/fortran/io/io.html

    read(11, *, iostat = io) ! Read in a line.

    if (io /= 0) exit ! 0 means that everything worked - not at the end yet.

    n = n + 1 ! If we didn't exit above, this line is valid.
  end do

  rewind(11) ! Puts the pointer back to the start of the file.

  ! If we didn't do this, the read on line 54 would (probably) fail.
  ! Exercise: read up on IOSTAT (line 35), reason why line 54 might not fail.

  ! --- CALCULATE SOME MEMORY ~~~~~~~~~~~~

  print *, "Found", n, "lines."

  ! Now that we know n, we can allocate the array space.
  allocate(x(n))
  allocate(y(n))

  ! You can get rid of the above allocate lines and line 9 if you use this one:
  ! real, dimension(n) :: x, y
  ! You probably shouldn't, though - define variables at the top.

  read(11, *) ! Again, we ignore the header.

  do i = 1, n ! For each line of the file...
  	read(11, *) x(i), y(i) ! Part (a) of the sheet.

  	! We can add the values to the sums in this loop.

  	Ex  = Ex + x(i)
  	Ey  = Ey + y(i)
  	Exy = Exy + x(i) * y(i)
  	Ex2 = Ex2 + x(i) ** 2
  	Ey2 = Ey2 + y(i) ** 2
  end do

 	Sxy  = Exy - (Ex * Ey) / n
 	Sxx  = Ex2 - (Ex ** 2) / n
 	Syy  = Ey2 - (Ey ** 2) / n
 	Sxxy = ((Ex2 * Ey) / n) - ((Ex * Exy) / n)

 	print *, "Sxy:", Sxy, "Sxx:", Sxx, "Syy:", Syy, "Sxxy:", Sxxy

 	r = Sxy / sqrt(Sxx * Syy)

 	print *, "r:", r

 	c0 = Sxxy / Sxx
 	c1 = Sxy / Sxx

 	print *, "Slope:", c1, "Intercept:", c0

 	print *, "Please enter a Debye-Waller constant"
 	read *, dwc

 	! If one has an array of N things, x(1) is the first and x(N) is the last
 	! element. Assuming that t is the total time, t = x(n).

 	D = (r ** 2 - dwc) / (6 * x(n))

 	print *, "Diffusion constant:", D

 	! EXTENSION:

 	! do n times:
 	!   d(i) calculation with x(i), y(i), c0, and c1
 	! end do

 	! Calculate average (use the sum() function). Needs a new variable.

 	! do n times:
 	!   if (d(i) > 4 * average) delete point.
 	! end do


 	! EXTENSION EXTENSION:

 	! http://stackoverflow.com/questions/21397197/in-fortran-how-do-i-remove-nth-element-from-an-array
 	! final_with_deleted = pack(d, d > 4 * average) ? Needs looking up. See PACK function.

end program diffusion
