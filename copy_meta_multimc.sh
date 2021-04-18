#!/bin/sh
set -e
cd "$(dirname "$0")"
UPSTREAM_REPO_PATH="${1:-../upstream-meta-multimc}"
if [ ! -d "${UPSTREAM_REPO_PATH}" ]; then
	echo "${UPSTREAM_REPO_PATH}" does not exist
	exit 1
fi

DIRS=$(cd "${UPSTREAM_REPO_PATH}";find . -type d ! -path './.git/*' ! -path './.git' ! -path './org.lwjgl3' ! -path './org.lwjgl' ! -path '.')
for DIR in $DIRS; do
	rm -rf ${DIR}
	cp -a "${UPSTREAM_REPO_PATH}"/"${DIR}" .
	git add ${DIR}
done
