FROM ubuntu

RUN apt update
RUN apt -y install libcap2-bin coreutils wget
RUN wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
ENV PATH="$PATH:/usr/local/go/bin"
