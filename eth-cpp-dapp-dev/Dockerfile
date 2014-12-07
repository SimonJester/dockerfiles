# eth-cpp-dapp-dev/Dockerfile
#
# Environment for developing DApps on Ethereum using the C++ client.
#
# To build this Dockerfile into an Image (from Linux):
#   cd <the-directory-where-this-file-is-located>
#   ./buildit.sh
#
# It took me almost 40 minutes to build this Dockerfile into a 1.4 GB Image.
#
# To turn the Image into a Container and run it:
#   sudo docker run -ti eth_cpp_dapp_dev /bin/bash

#TODO: Follow the Dockerfile best practices: https://docs.docker.com/articles/dockerfile_best-practices/#env
#TODO: Is my email in the correct location?
#TODO: Is it possible to 'enhance' autocomplete capabilities within the resulting Image?

FROM ubuntu:14.04
MAINTAINER Joel Cannon <joel@dapps4ancaps.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get autoremove && \
    apt-get update && \
    apt-get dist-upgrade -y

# Install packages that are prerequisites for everything below
RUN apt-get install -y build-essential g++-4.8 git cmake libgmp-dev libboost-all-dev automake unzip libtool libleveldb-dev yasm libminiupnpc-dev libreadline-dev scons libncurses5-dev qtbase5-dev qt5-default qtdeclarative5-dev libqt5webkit5-dev libcurl4-openssl-dev libjsoncpp-dev subversion texinfo flex bison libargtable2-dev

# Install cryptopp
RUN mkdir -p /src && \
    cd /src && \
    git clone https://github.com/mmoss/cryptopp.git
RUN cd /src/cryptopp && \
    scons --shared --prefix=/usr

# Install libmicrohttpd
RUN cd /src && \
    svn co https://gnunet.org/svn/libmicrohttpd
RUN cd /src/libmicrohttpd/ && \
    autoreconf -vfi && \
    ./bootstrap && \
    ./configure && \
    make install

# Install doxygen
RUN cd /src && \
    git clone https://github.com/doxygen/doxygen.git
RUN cd /src/doxygen && \
    ./configure && \
    make && \
    make install

# Install libjson
RUN cd /src && \
    git clone git://github.com/cinemast/libjson-rpc-cpp.git
RUN mkdir -p /src/libjson-rpc-cpp/build && \
    cd /src/libjson-rpc-cpp/build && \
    cmake .. && \
    make && \
    make install && \
    ldconfig

# Build Ethereum client
RUN apt-get update
RUN cd /src && \
    git clone https://github.com/ethereum/cpp-ethereum
RUN cd /src/cpp-ethereum && \
    git checkout master && \
    mkdir -p build
RUN cd /src/cpp-ethereum/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make

# Create script that allows user to easily launch AlethZero (C++ GUI client)
RUN echo "cd /src/cpp-ethereum/build/alethzero && ./alethzero" > /alethZero.sh
RUN chmod +x /alethZero.sh


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
