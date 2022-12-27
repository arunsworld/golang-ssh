FROM golang:alpine
LABEL maintainer "Arun Barua - https://github.com/arunsworld"
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY rootfs /
COPY userfs /root/

RUN apk add --no-cache vim curl git openssh \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:root" | chpasswd
