# docker-rsyslog-test
Docker rsyslog test (on Ubuntu 18.04)
 
```
# Build image
docker build -t rsyslog-test .

# Run container
docker run --rm --name rsyslog-test -ti rsyslog-test /bin/bash

# --- container ---
# Check if created log file as the ordinary user's file.
service rsyslog start; logger -p local0.error "test"; ll /home/docker
cat /var/log/syslog; echo "--------"; cat /home/docker/rsyslog-test.log

# exit
exit
```
