FROM ubuntu as builder

WORKDIR /workspace

RUN apt update
RUN apt -y install libcap2-bin wget
RUN touch a
RUN setcap "CAP_NET_BIND_SERVICE,CAP_SYS_PTRACE+ep" a

FROM ubuntu

WORKDIR /workspace

COPY --from=builder /workspace/a .

#RUN apt update
#RUN apt -y install libcap2-bin wget
#RUN wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
#RUN tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
#
#RUN touch b
#RUN ls -l b
#USER root
#RUN /usr/local/go/bin/go run main.go
#RUN setcap "CAP_NET_BIND_SERVICE,CAP_SYS_PTRACE+ep" a
#RUN tar --selinux --xattrs -cf b.tar b
#
#FROM ubuntu
#COPY --from=builder
#COPY m.tar .
#RUN tar --selinux --xattrs -xf m.tar
#RUN ls -Z a
#RUN getcap a
