#!/bin/bash
# by fhb

set -e
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
    sed -i "s@PASSWORD@$SS_PASS@g" /etc/ss.conf
    set -- ssserver "$@"
fi
exec "$@"
