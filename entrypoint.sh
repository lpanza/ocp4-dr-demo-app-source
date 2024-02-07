#!/usr/bin/env bash
set -Eeuo pipefail

if [ ! -f /opt/app-root/src/index.php ]; then
	/usr/libexec/s2i/assemble
fi

exec "/usr/libexec/s2i/run"
