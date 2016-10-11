# actuator.ether.camp

Admin panel for managing actuators (health, metrics etc) from other services
 
Define `SERVER_PORT` and `MANAGE_PASS` password for user `manage` used for server login and clients data access and execute `./run.sh`
 
### Exporting clients SSL key
 
 Create file retrieve-cert.sh
 ```bash
 #!/bin/sh
 #
 # usage: retrieve-cert.sh remote.host.name [port]
 #
 REMHOST=$1
 REMPORT=${2:-443}
 
 echo |\
 openssl s_client -connect ${REMHOST}:${REMPORT} 2>&1 |\
 sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'
 ```
 Chmod and run
 ```bash
 chmod +x retrieve-cert.sh
 ./retrieve-cert.sh my.url.com 9001 > my-url.cert
 ```
 Save to java keystore, path could differs, default pass is `changeit`
 ```bash
 /opt/jdk1.8.0_51/bin/keytool -import -file my-url.cert -alias my-url -keystore /opt/jdk1.8.0_51/jre/lib/security/cacerts
 ```