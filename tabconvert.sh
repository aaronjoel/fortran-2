for f in *.f90; do expand -t 2 $f > /tmp/expf && mv /tmp/expf $f; done
