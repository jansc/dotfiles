#!/usr/bin/env bash
# https://stevelosh.com/blog/2021/03/small-common-lisp-cli-programs/

set -euo pipefail

LISP=$1
NAME=$(basename "$1" .lisp)
shift

sbcl --load "$LISP" \
     --eval "(sb-ext:save-lisp-and-die \"$NAME\"
               :executable t
               :save-runtime-options t
               :toplevel '$NAME:toplevel)"
