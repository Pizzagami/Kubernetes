#!/bin/bash

openrc
touch /run/openrc/softlevel
service influxdb start
sleep 2
influx < "/utils/influxdb.sql"

tail -f /dev/null
