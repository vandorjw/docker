#!/bin/bash

echo injecting environment variables into config files...
sed -i "s@\${CLUSTER_NAME}@${CLUSTER_NAME}@g" etc/node.properties
sed -i "s@\${PRESTODB_NODE_NAME}@${PRESTODB_NODE_NAME}@g" etc/node.properties
sed -i "s@\${HOSTNAME}@${HOSTNAME}@g" etc/node.properties
sed -i "s@\${PRESTODB_DATA_DIR}@${PRESTODB_DATA_DIR}@g" etc/node.properties

sed -i "s@\${PRESTODB_COORDINATOR}@${PRESTODB_COORDINATOR}@g" etc/config.properties
sed -i "s@\${PRESTODB_SERVER_PORT}@${PRESTODB_SERVER_PORT}@g" etc/config.properties
sed -i "s@\${PRESTODB_MAX_MEMORY}@${PRESTODB_MAX_MEMORY}@g" etc/config.properties
sed -i "s@\${PRESTODB_MAX_MEMORY_PER_NODE}@${PRESTODB_MAX_MEMORY_PER_NODE}@g" etc/config.properties
sed -i "s@\${PRESTODB_DISCOVERY_URI}@${PRESTODB_DISCOVERY_URI}@g" etc/config.properties
sed -i "s@\${PRESTODB_INCLUDE_COORDINATOR}@${PRESTODB_INCLUDE_COORDINATOR}@g" etc/config.properties
sed -i "s@\${PRESTODB_DISCOVERY_SERVER_ENABLED}@${PRESTODB_DISCOVERY_SERVER_ENABLED}@g" etc/config.properties

echo launching node...
exec bin/launcher run