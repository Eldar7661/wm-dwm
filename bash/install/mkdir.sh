#!/bin/bash

DIRECTORY=$1

if [ ! -d "$DIRECTORY" ]; then
  mkdir -p "$DIRECTORY"
  echo "Directory created: $DIRECTORY"
else
  echo "Directory already exists: $DIRECTORY"
fi

