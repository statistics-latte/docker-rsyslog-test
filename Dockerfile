FROM ubuntu:18.04
RUN yes | unminimize

ENV TZ=Asia/Tokyo

# Create ordinary user
ARG DOCKER_UID=1000
ARG DOCKER_USER=docker
ARG DOCKER_PASSWORD=docker
RUN useradd -m --uid ${DOCKER_UID} --groups sudo ${DOCKER_USER} \
  && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

# For the following errors, comment out the imklog module load line.
#   rsyslogd: imklog: cannot open kernel log (/proc/kmsg): Operation not permitted.
#   rsyslogd: activation of module imklog failed [v8.32.0 try http://www.rsyslog.com/e/2145 ]
#
# sed (stream editor) options:
#  -i (--in-place):
#  -e script (--expression=script):
RUN sed -i -e '/^module(load=\"imklog\"/s/^/# /' /etc/rsyslog.conf

COPY rsyslog-test.conf /etc/rsyslog.d/

CMD ["/bin/bash"]
