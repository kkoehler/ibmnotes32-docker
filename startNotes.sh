#!/bin/sh

xhost +
docker run --dns-search=XXX --dns=XXX -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/kkoehler/work/ibm:/home/developer/ibm -t ibmnotes32 /opt/ibm/notes/notes
