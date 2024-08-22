#!/bin/bash


: "${CM_DIR="${XDG_RUNTIME_DIR-"${TMPDIR-/tmp}"}"}"

major_version=6

cache_dir=$CM_DIR/clipmenu.$major_version.$USER
cache_file=$cache_dir/line_cache

> $cache_file
