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

# Install packages that are prerequisites for everything below
RUN apt-get install -y git python-setuptools python-dev \
    build-essential cmake
RUN easy_install pip
RUN pip install --upgrade virtualenv
RUN pip install -U pytest pytest-cov

# Set up my personal basics like vim editor and such
RUN apt-get install -y curl && vim
#TODO: Add better command completion.
#TODO: Remove Unity sliders.
#TODO: Improve command history etc.

# Set up python tab-completion for vim
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#TODO: Consider switching from pathogen to vundle -- it handles cloning and upgrades automatically.
RUN cd ~/.vim/bundle && git clone git://github.com/klen/python-mode.git
RUN cd ~/.vim/bundle/python-mode
#TODO: Figure out how to run this command in vim: :helptags ~/.vim/bundle/python-mode/doc/
RUN cd ~/.vim/bundle && git clone https://github.com/scrooloose/syntastic.git
RUN cd ~/.vim/bundle && git clone https://github.com/Valloric/YouCompleteMe.git
RUN cd ~/.vim/bundle/YouCompleteMe && \
    git submodule update --init --recursive && \
    ./install.sh --clang-completer  #TODO: Do I need C language support?
#TODO: Append to vimrc all lines related to packages (see my vimrc file).

#TODO: Add steps that install emacs and Evil (Note: evil will only install if you use the tarball method.)

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
