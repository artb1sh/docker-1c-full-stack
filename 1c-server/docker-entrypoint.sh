#!/bin/bash

exec ragent 
exec /etc/init.d/haspd start

exec "$@"
