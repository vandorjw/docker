FROM selenium/node-chrome:3.10.0-argon
# ===============================================
# See https://github.com/RetailMeNotSandbox/ecs-selenium/blob/master/docker/ecs-node-chrome/Dockerfile
# ===============================================
USER root

#================================================
# Customize sources for apt-get
#================================================
RUN  echo "deb http://archive.ubuntu.com/ubuntu xenial main universe\n" > /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu xenial-updates main universe\n" >> /etc/apt/sources.list \
  && echo "deb http://security.ubuntu.com/ubuntu xenial-security main universe\n" >> /etc/apt/sources.list


#========================
# Install python and pip
#========================
RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    python \
    python-pip \
    coreutils \
  && rm -rf /var/lib/apt/lists/*


#========================
# Install boto3
#========================

RUN pip install boto3 requests boto
COPY ecs-get-port-mapping.py /opt/bin/ecs-get-port-mapping.py
COPY ecs_entry_point.sh /opt/bin/ecs_entry_point.sh

RUN chown -R seluser:seluser /opt/bin/ && chmod +x /opt/bin/*

COPY ./entrypoint.sh /entrypoint.sh
RUN chown seluser:seluser /entrypoint.sh
RUN chmod a+x /entrypoint.sh

USER seluser

ENTRYPOINT ["/entrypoint.sh"]

