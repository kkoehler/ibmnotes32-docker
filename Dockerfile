FROM ubuntu:16.04

ADD ./ibm-notes-9.0.1.i586.deb /tmp/
ADD ./ibm-activities-9.0.1.i586.deb /tmp/
ADD ./ibm-opensocial-9.0.1.i586.deb /tmp/
ADD ./ibm-sametime-9.0.1.i586.deb /tmp/

RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y gdb:i386 unzip procps:i386 grep sed libart-2.0-2:i386 libasound2:i386 libatk1.0-0:i386 libbonobo2-0:i386 libbonoboui2-0:i386 libc6:i386 libfontconfig1:i386 libfreetype6:i386 libgcc1:i386 libgconf2-4:i386 libgtk2.0-0:i386 libglib2.0-0:i386 libgnome2-0:i386 libgnomecanvas2-0:i386  libgnome-desktop-3-12:i386 libgnomeui-0:i386 libgnomevfs2-0:i386 libglib2.0-0:i386 libice6:i386 libjpeg62:i386 liborbit2:i386 libpam0g:i386 libpango1.0-0:i386 libpng12-0:i386 libpopt0:i386 libsm6:i386 libstdc++6:i386 libx11-6:i386 libxcursor1:i386 libxext6:i386 libxft2:i386 libxi6:i386 libxkbfile1:i386 libxml2:i386 libxrender1:i386 libxss1:i386 libxt6:i386 libxtst6:i386 libz1:i386 libhunspell-1.3-0:i386 libcanberra-gtk-module:i386	alsa-base:i386 iproute2:i386 xterm

RUN apt-get install -y iputils-ping net-tools iproute2 dnsutils

RUN dpkg -i --ignore-depends=libcupsys2:i386,libxp6:i386,libgnome-desktop-2:i386 /tmp/ibm-notes-9.0.1.i586.deb 

#RUN dpkg -i /tmp/ibm-activities-9.0.1.i586.deb
#RUN dpkg -i /tmp/ibm-opensocial-9.0.1.i586.deb
RUN dpkg -i --ignore-depends=iproute:i386 /tmp/ibm-sametime-9.0.1.i586.deb

RUN useradd -c 'user' -m -d /home/developer -s /bin/bash developer

USER developer
ENV HOME /home/developer


