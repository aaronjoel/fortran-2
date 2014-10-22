for f in *.f90; do expand -t 2 14-diffusion.f90 > /tmp/expf && mv /tmp/expf 14-diffusion.f90; done
