# Fetch ubuntu image
FROM ubuntu:24.04

# Copy CppUTest-Demo into image
RUN mkdir /CppUTest-Demo
RUN mkdir /CppUTest-Demo/build
COPY src /CppUTest-Demo/src
COPY include /CppUTest-Demo/include
COPY tests /CppUTest-Demo/tests
COPY main.c /CppUTest-Demo/main.c
COPY Makefile /CppUTest-Demo/Makefile

# Install CppUTest prerequisite build tools
RUN apt update && \
    apt install -y wget build-essential autoconf automake libtool

# Download and build CppUTest
RUN mkdir /CppUTest-Demo/tools/ && \
    cd /CppUTest-Demo/ && \
    wget https://github.com/cpputest/cpputest/releases/download/v4.0/cpputest-4.0.tar.gz && \
    tar xf cpputest-4.0.tar.gz && \
    mv cpputest-4.0/ tools/cpputest/ && \
    cd tools/cpputest/ && \
    autoreconf -i && \
    ./configure && \
    make
    
# Execute script
ENTRYPOINT ["make", "tests", "-C", "/CppUTest-Demo/"]
