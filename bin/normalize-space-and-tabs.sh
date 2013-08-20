#!/usr/bin/env sh

sed --in-place=.orig 's/\t/    /g;s/ *$//g' "$@"