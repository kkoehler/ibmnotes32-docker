# ibmnotes32-docker
Dockerimage for IBM Notes 32bit on Ubuntu 16.04 64bit

You have to download the following files to your local machine:

* ibm-notes-9.0.1.i586.deb
* ibm-activities-9.0.1.i586.deb
* ibm-opensocial-9.0.1.i586.deb
* ibm-sametime-9.0.1.i586.deb

Maybe you find them here: http://www-03.ibm.com/software/products/en/ibmnotes

## Setup the image

```
git clone https://github.com/kkoehler/ibmnotes32-docker.git
```

Copy the ibm* files into the directory and run the docker build with

```
docker build -t ibmnotes32 .
```

After a while you should have a working docker image.

```
$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ibmnotes32          latest              XXXXXXXXXXXX        2 days ago          2.17 GB
```

## Start the notes container

Now you can run your image (see startNotes.sh in the project):

```
xhost +
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/kkoehler/work/ibm:/home/developer/ibm -t ibmnotes32 /opt/ibm/notes/notes
```

In my case it was neccessary to add a dns config:
```
--dns-search=XXX --dns=XXX
```

The data of the workspace is mapped from outside the container with the `-v` option.