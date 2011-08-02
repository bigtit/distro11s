#!/bin/bash

source `dirname $0`/common.sh

if [ ! -d $PWD/packages/meshkit ]; then
	echo "No meshkit package."
	exit 1
fi

Q pushd $PWD/packages/meshkit
do_stamp_cmd meshkit.install cp bin/* ${STAGING}/usr/local/bin/
do_stamp_cmd meshkit.install_etc cp -r etc/* ${STAGING}/etc
insserv -p ${STAGING}/etc/init.d/ ${STAGING}/etc/init.d/meshkit