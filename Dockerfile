FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install --no-install-recommends libwrap0-dev libssl-dev libc-ares-dev uuid-dev libwebsockets-dev -y
RUN mkdir -p /etc/mosquitto
RUN adduser --system --disabled-password --disabled-login mosquitto
USER mosquitto
expose 1883
COPY mosquitto /usr/bin/mosquitto
COPY mosquitto.conf /etc/mosquitto/mosquitto.conf
COPY passwdfile /etc/mosquitto/passwdfile
COPY caCert.pem /etc/mosquitto/caCert.pem
COPY serverCert.pem /etc/mosquitto/serverCert.pem
COPY serverKey.pem /etc/mosquitto/serverKey.pem
CMD ["/usr/bin/mosquitto","-c","/etc/mosquitto/mosquitto.conf"]
