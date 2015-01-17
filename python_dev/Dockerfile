# python_dev/Dockerfile
#
# Environment for developing Python programs.
#
# To build this Dockerfile into an Image (from Linux):
#   cd <the-directory-where-this-file-is-located>
#   sudo docker build -t="my_image_name" <path_to_dockerfile>
#
# To turn the Image into a Container and run it:
#   sudo docker run -ti eth_cpp_dapp_dev /bin/bash

#TODO: Follow the Dockerfile best practices: https://docs.docker.com/articles/dockerfile_best-practices/#env
#TODO: Is my email in the correct location?
#TODO: Is it possible to 'enhance' autocomplete capabilities within the resulting Image?

FROM ubuntu:14.04
MAINTAINER Joel Cannon <joel@dapps4ancaps.com>

#ENV DEBIAN_FRONTEND noninteractive
RUN apt-get autoremove && \
    apt-get update && \
    apt-get dist-upgrade -y

# Set up my personal basics like vim editor and such
RUN apt-get install -y vim
#TODO: Add better command completion.
#TODO: Remove Unity sliders.
#TODO: Improve command history etc.

# Install packages that are prerequisites for everything below
RUN apt-get install -y git python-setuptools python-dev build-essential
RUN easy_install pip
RUN pip install --upgrade virtualenv
RUN pip install -U pytest pytest-cov
#TODO: Need to upgrade pytest? (get error: unrecognized arguments: --cov=. --cov-report)

# Install via package manager:
# keepassx
# vim
# gvim
# emacs
# virtualbox
# unison
# gparted

# Download and install tor browser
# also, must create Tor\ Browser.desktop file
# and save it to /usr/share/applications/
# and set up bookmark sync

# Install google chrome (must do it through firefox)

# Set up bitmessage and create a bitmessage.desktop file

# Change the Brightness & Lock so it dims screen after 1hr

# Set clock so it displays Weekday, Date & Month, Year, and Seconds

# Set up keyboard for international use
#(TBD: equivalent of En1 > Text Entry Settings > English (US, international with dead keys))

# Install my custom files: 
# .bashrc
# .emacs
# .inputrc
# .profile
# .viminfo
# .vimrc


# Set up a folder for doing software development
RUN mkdir -p /src


# Make the Docker Container GUI capable
#TODO: Get GUI working (at first, just hard code it): http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/developer && \
#    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
#    echo "developer:x:${uid}:" >> /etc/group && \
#    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
#    chmod 0440 /etc/sudoers.d/developer && \
#    chown ${uid}:${gid} -R /home/developer
#
#USER developer
#ENV HOME /home/developer
#CMD /usr/bin/firefox

#TODO: Can I make this Dockerfile parametric? This is needed to get GUI working. See this article on how: http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/

#TODO: Record (in the masthead comments) the correct minutes it took to build and the GB of size.
