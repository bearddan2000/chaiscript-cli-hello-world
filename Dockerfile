FROM ubuntu:22.04

WORKDIR /workspace

RUN apt-get update && \
    apt-get install -y git cmake make g++ && \
    git clone https://github.com/ChaiScript/ChaiScript

WORKDIR /workspace/ChaiScript

RUN cmake . && \
    make -j4 && \
    make install

WORKDIR /code

COPY bin .

CMD "./run.sh"