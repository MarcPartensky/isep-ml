#!/bin/sh

curl -sX POST -F message="$@" localhost:8000 | jq .answer
