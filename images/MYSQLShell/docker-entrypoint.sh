#!/bin/bash
set -e

# if command starts with an option, prepend mysqlsh
if [ "${1:0:1}" = '-' ]; then
	set -- mysqlsh "$@"
fi

if [ "$1" = 'init' ]; then
	if [ -z "$MYSQL_HOST" ]; then
		echo >&2 'error: You need to specify the MYSQL_HOST environment variable'
		exit 1
	fi
	mysqlsh -u root -h ${MYSQL_HOST} -p --classic --dba enableXProtocol
else
	exec "$@"
fi
