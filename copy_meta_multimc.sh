#!/bin/sh
set -e
cd "$(dirname "$0")"
# clone https://github.com/MultiMC/meta-multimc.git
UPSTREAM_REPO_PATH="${1:-../upstream-meta-multimc}"
if [ -d "${UPSTREAM_REPO_PATH}" ]; then
	cd "${UPSTREAM_REPO_PATH}"
	git pull
	cd -
else
	git clone https://github.com/MultiMC/meta-multimc.git "${UPSTREAM_REPO_PATH}"
fi

DIRS=$(cd "${UPSTREAM_REPO_PATH}";find . -type d ! -path './.git/*' ! -path './.git' ! -path './org.lwjgl3' ! -path './org.lwjgl' ! -path '.')
for DIR in "${DIRS}"; do
	rm -rf "${DIR}"
	cp -a "${UPSTREAM_REPO_PATH}"/"${DIR}" .
	git add "${DIR}"
done
