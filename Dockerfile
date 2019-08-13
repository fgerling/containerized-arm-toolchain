FROM ubuntu
## Name of the source package from arm gnu toolchain
ARG SOURCE_PACKAGE=gcc-arm-none-eabi-8-2019-q3-update-src.tar.bz2
## DEBIAN_FRONTEND=noninteractive is needet to build the container without user
## input.  https://stackoverflow.com/questions/52259241
ARG DEBIAN_FRONTEND=noninteractive

## Enable 32-bit lib/packages
RUN dpkg --add-architecture i386

RUN apt update 
RUN apt install -y \
      gcc-mingw-w64-i686 \
      g++-mingw-w64-i686 \
      binutils-mingw-w64-i686
RUN apt install -y \
      build-essential \
      autoconf \
      autogen \
      bison \
      dejagnu \
      flex \
      flip \
      gawk \
      git \
      gperf \
      gzip \
      nsis \
      openssh-client \
      p7zip-full \
      perl \
      python-dev \
      libisl-dev \
      scons \
      tcl \
      texinfo \
      tofrodos \
      wget \
      zip \
      texlive \
      texlive-extra-utils \
      libncurses5-dev

WORKDIR /app
COPY $SOURCE_PACKAGE /app/gcc-arm-none-eabi-src.tar.bz2
COPY ./run.sh /app/
VOLUME ["/arm-toolchain"]
ENTRYPOINT /app/run.sh
