#!/usr/bin/env bash

set -e

[ -z ${AUTOMATOR_HOME} ] && echo "AUTOMATOR_HOME is not set" && exit 1

[ $# -eq 0 ] && echo "No arguments provided" && exit 1

AUTOMATION=$1

[ ! -f $AUTOMATION ] && echo "Automation $AUTOMATION does not exist" && exit 1

pushd ${AUTOMATOR_HOME}

. venv/bin/activate

echo "Running $AUTOMATION"

. $AUTOMATION

popd
