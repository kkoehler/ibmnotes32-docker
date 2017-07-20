# ibmnotes32-docker
This Dockerfile builds an image for IBM Notes (32bit) to run on Ubuntu 16.04 64bit. IBM only provide a 32bit version of IBM Notes client installation packages. There are a lot of "patch scripts" out there which pathes the downloaded packages so that they can be installed on a 64bit architecture. I decided to install the 32bit version of IBM notes within a docker container with all the 32bit dependencies. Works well for me.

## Setup the image

First of all you have to download the following files to your local machine:

* ibm-notes-9.0.1.i586.deb
* ibm-activities-9.0.1.i586.deb
* ibm-opensocial-9.0.1.i586.deb
* ibm-sametime-9.0.1.i586.deb

Maybe you find them here: http://www-03.ibm.com/software/products/en/ibmnotes

Now it's time to build the docker image (you do not have to clone the git repo, but if you have any enhancements you can easily create a pull request ;-) ).

```
git clone https://github.com/kkoehler/ibmnotes32-docker.git
```

Copy the ibm* files into the directory and run the docker build with

```
docker build -t ibmnotes32 .
```

After a while you should have a working docker image (there are some warnings).

```
$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ibmnotes32          latest              XXXXXXXXXXXX        2 days ago          2.17 GB
```

## Start the notes container

Now you can run your image (see startNotes.sh in the project):

```
xhost +
docker run -ti --rm -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /home/kkoehler/work/ibm:/home/developer/ibm \
    -t ibmnotes32 /opt/ibm/notes/notes
```

In my case it was neccessary to add a dns config:
```
--dns-search=XXX --dns=XXX
```

The data of the workspace is mapped from outside the container with the `-v` option.