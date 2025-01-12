#!/usr/bin/env bash

n=$1

test -e Player-Data || mkdir Player-Data

echo Setting up SSL for $n parties

for i in `seq 0 $[n-1]`; do
    openssl req -newkey rsa -nodes -x509 -out Player-Data/C$i.pem -keyout Player-Data/C$i.key -subj "/CN=C$i"
done

/usr/local/Cellar/openssl@3/3.0.0_1/bin/c_rehash Player-Data
