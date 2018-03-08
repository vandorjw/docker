#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o allexport
set -o nounset

: "${lb_dns:="none"}"
HUB_HOST="$lb_dns"

result="$(python /opt/bin/ecs-get-port-mapping.py)"
eval "$result"

export SE_OPTS="-host $EC2_HOST -remoteHost http://$EC2_HOST:$PORT_TCP_5555 -id $NODE_ID"

# execute default extry_point.sh file
/opt/bin/entry_point.sh

