FROM openjdk:8u151-jre-slim

ENV PRESTO_SOURCE_PATH=https://repo1.maven.org/maven2/com/facebook/presto \
    PRESTO_HOME=/presto \
    PRESTO_VERSION=0.195 \
    PRESTODB_COORDINATOR=false \
    PRESTODB_SERVER_PORT=8080 \
    PRESTODB_MAX_MEMORY=50GB \
    PRESTODB_MAX_MEMORY_PER_NODE=1GB \
    PRESTODB_INCLUDE_COORDINATOR=false \
    PRESTODB_DISCOVERY_SERVER_ENABLED=false \
    PRESTODB_DATA_DIR=/data \
    PRESTODB_DISCOVERY_URI=http://localhost:8080 \
    CLUSTER_NAME=local

RUN apt-get update \
	&& apt-get install -y wget \
	&& apt-get install -y python \
	&& apt-get install -y less

# Download Presto
RUN wget ${PRESTO_SOURCE_PATH}/presto-server/${PRESTO_VERSION}/presto-server-${PRESTO_VERSION}.tar.gz \
  ${PRESTO_SOURCE_PATH}/presto-cli/${PRESTO_VERSION}/presto-cli-${PRESTO_VERSION}-executable.jar \
  ${PRESTO_SOURCE_PATH}/presto-jdbc/${PRESTO_VERSION}/presto-jdbc-${PRESTO_VERSION}.jar \
#		${BASE_URL}/presto-verifier/${PRESTO_VERSION}/presto-verifier-${PRESTO_VERSION}-executable.jar \
#		${BASE_URL}/presto-benchmark-driver/${PRESTO_VERSION}/presto-benchmark-driver-${PRESTO_VERSION}-executable.jar \
	&& rm -rf /var/lib/apt/lists/*

# Install Presto
RUN tar zxvf presto-server-${PRESTO_VERSION}.tar.gz \
	&& chmod +x presto-*executable.jar \
	&& ln -s presto-server-${PRESTO_VERSION} presto \
	&& mv *.jar presto/. \
	&& cd presto \
	&& ln -s presto-cli-${PRESTO_VERSION}-executable.jar presto \
#	&& ln -s presto-verifier-${PRESTO_VERSION}-executable.jar verifier \
#	&& ln -s presto-benchmark-driver-${PRESTO_VERSION}-executable.jar benchmark-driver \
#	&& wget -P plugin/hive-hadoop2/ https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/hive-json-serde/hive-json-serde-0.2.jar \
	&& cd -

WORKDIR ${PRESTO_HOME}

COPY etc ./etc

COPY entrypoint.sh ./entrypoint.sh
RUN chmod a+x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]