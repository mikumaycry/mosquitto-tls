# mosquitto-tls

A mosquitto tls configuration guide

Mosquitto version 1.4.14

Self signed caCert and serverCert

## For local test
docker run --name mqtt -d -p 1883:1883 wbuntu/mosquitto-tls:1.0.0

access the broker with URL tls://127.0.0.1, port 1883 with caCert.pem 

## For online test

1.Install strongswan with brew on macOS or apt on Ubuntu

2.Generate a new serverCert.pem with ipsec pki

	ipsec pki --pub --in serverKey.pem | ipsec pki --issue --cacert caCert.pem --cakey caKey.pem --dn "C=CH, O=Wbuntu, CN=MQTT" --san="Your server domain name or IP address" --flag serverAuth --outform pem --lifetime 3650 > serverCert.pem
  
you can add multiple **--san** value if you wish

## For production environment

1.You Must generate all certs by yourself

2.build a new image or mount a folder which contains all necessary files to /etc/mosquitto 

Access [Mosquitto TLS Configure](https://wbuntu.com/?p=1096) (Chinese) for more detail.
