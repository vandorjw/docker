#!/usr/bin/env bash
set -o errexit
set -o pipefail
set -o allexport
set -o nounset

: "${lb_dns:="none"}"
HUB_HOST="$lb_dns"

/opt/bin/entry_point.sh

